# download prebuilt library if target is windows
if(VCPKG_TARGET_IS_WINDOWS)
set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/loot/libloot/releases/download/${VERSION}/libloot-${VERSION}-win64.7z"
    FILENAME "libloot-${VERSION}-win64.7z"
    SHA512 6559AB8A365A78B0A0C2F010276F1E04CECAA81BEB0006AB0565517B172728F5E3533DA4F0B9BB78972D886ED1605AF2418668216C6F34A05A6CAF94648E2DD4
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

vcpkg_download_distfile(LICENSE
    URLS "https://raw.githubusercontent.com/loot/libloot/master/LICENSE"
    FILENAME "copyright"
    SHA512 7633623B66B5E686BB94DD96A7CDB5A7E5EE00E87004FAB416A5610D59C62BADAF512A2E26E34E2455B7ED6B76690D2CD47464836D7D85D78B51D50F7E933D5C
)

file(INSTALL ${SOURCE_PATH}/include DESTINATION ${CURRENT_PACKAGES_DIR})
file(INSTALL ${SOURCE_PATH}/bin DESTINATION ${CURRENT_PACKAGES_DIR})
file(INSTALL ${SOURCE_PATH}/lib DESTINATION ${CURRENT_PACKAGES_DIR})

file(INSTALL ${SOURCE_PATH}/bin DESTINATION ${CURRENT_PACKAGES_DIR}/debug)
file(INSTALL ${SOURCE_PATH}/lib DESTINATION ${CURRENT_PACKAGES_DIR}/debug)

vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${LICENSE}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

else()
# build from source
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO loot/libloot
    REF "${VERSION}"
    SHA512 f2496f84bce3f3f4ae502d6355bb26529d407ddf6f8780e30e63efc3e5d48693f7502f1d10a1af306f435bd6ba6d9e2b468e7c2525dae49aec075cddbba00d74
    HEAD_REF master
    PATCHES fix-spdlog.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DLIBLOOT_BUILD_TESTS=OFF
        -DLIBLOOT_INSTALL_DOCS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_fixup_pkgconfig()
endif()

if(VCPKG_TARGET_IS_WINDOWS)
    set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/loot/libloot/releases/download/${VERSION}/libloot-${VERSION}-win64.7z"
    FILENAME "libloot-${VERSION}-win64.7z"
    SHA512 29D3EBC405B875022F9957F71D2FCB7234AD3386CBFEF3D98629312F695C042BB1E43E8F57A9132B7070D8493DC406AF766D7FC2FAE59C14C4E98F1DBC87BFBB
)

    vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE ${ARCHIVE}
    )

    vcpkg_download_distfile(LICENSE
        URLS "https://raw.githubusercontent.com/loot/libloot/master/LICENSE"
        q "copyright"
        SHA512 7633623B66B5E686BB94DD96A7CDB5A7E5EE00E87004FAB416A5610D59C62BADAF512A2E26E34E2455B7ED6B76690D2CD47464836D7D85D78B51D50F7E933D5C
    )

    file(INSTALL ${SOURCE_PATH}/include DESTINATION ${CURRENT_PACKAGES_DIR})
    file(INSTALL ${SOURCE_PATH}/bin DESTINATION ${CURRENT_PACKAGES_DIR})
    file(INSTALL ${SOURCE_PATH}/lib DESTINATION ${CURRENT_PACKAGES_DIR})

    file(INSTALL ${SOURCE_PATH}/bin DESTINATION ${CURRENT_PACKAGES_DIR}/debug)
    file(INSTALL ${SOURCE_PATH}/lib DESTINATION ${CURRENT_PACKAGES_DIR}/debug)

    vcpkg_install_copyright(FILE_LIST "${LICENSE}")
else()
    # build from source
    vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO loot/libloot
        REF "${VERSION}"
        SHA512 3102e6315f05dec5a510a88e955e9c2ef449519c1b779852ecbfbfb1472afb0ce440d815781cbbd496ad07b932e572bfc07ded53bf4116dbeea9a407f19af13c
        HEAD_REF master
        PATCHES fix-dependencies.patch
    )

    vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
            -DLIBLOOT_BUILD_TESTS=OFF
            -DLIBLOOT_INSTALL_DOCS=OFF
    )

    vcpkg_cmake_install()
    vcpkg_fixup_pkgconfig()

    vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
endif()

vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

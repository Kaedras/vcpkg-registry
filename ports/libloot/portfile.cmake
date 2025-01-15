if(VCPKG_TARGET_IS_WINDOWS)
    set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

    vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/loot/libloot/releases/download/${VERSION}/libloot-${VERSION}-win64.7z"
        FILENAME "libloot-${VERSION}-win64.7z"
        SHA512 d32a7961aed70c91d980546664e464e262665eb97ea74ea26b4f5c9417e98384a7024d37d70271bd513621941c6999dfdbd15424821b011540ad818250fbadd9
    )
else()
    vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/loot/libloot/releases/download/${VERSION}/libloot-${VERSION}-Linux.tar.xz"
        FILENAME "libloot-${VERSION}-Linux.tar.xz"
        SHA512 2c54892185a4e7499cb6951d9446f1e33a46f6bd339d76a06bc09dd73a36bcc6c2438fb533ddac42d3be8dc520b4f4ade8fe1ade0abebfce65cf87853edee3d9
    )
endif()

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
if(VCPKG_TARGET_IS_WINDOWS)
    file(INSTALL ${SOURCE_PATH}/bin DESTINATION ${CURRENT_PACKAGES_DIR})
endif()
file(INSTALL ${SOURCE_PATH}/lib DESTINATION ${CURRENT_PACKAGES_DIR})

if(VCPKG_TARGET_IS_WINDOWS)
    file(INSTALL ${SOURCE_PATH}/bin DESTINATION ${CURRENT_PACKAGES_DIR}/debug)
endif()
file(INSTALL ${SOURCE_PATH}/lib DESTINATION ${CURRENT_PACKAGES_DIR}/debug)

vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${LICENSE}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
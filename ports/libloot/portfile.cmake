if(VCPKG_TARGET_IS_WINDOWS)
    set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

    vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/loot/libloot/releases/download/${VERSION}/libloot-${VERSION}-win64.7z"
        FILENAME "libloot-${VERSION}-win64.7z"
        SHA512 d32a7961aed70c91d980546664e464e262665eb97ea74ea26b4f5c9417e98384a7024d37d70271bd513621941c6999dfdbd15424821b011540ad818250fbadd9
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
        SHA512 c9a4bf8ba9a35f5a9ec76cffba439c717d655f09c73bfbe0fc808314d6b295cd5d45ae8a255e36dfdc4da2b39f76aa22fdc9d12302123773b80cd5682638373a
        HEAD_REF master
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

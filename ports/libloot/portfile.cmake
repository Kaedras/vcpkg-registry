if(VCPKG_TARGET_IS_WINDOWS)
    set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

    vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/loot/libloot/releases/download/${VERSION}/libloot-${VERSION}-win64.7z"
        FILENAME "libloot-${VERSION}-win64.7z"
        SHA512 9051862f6de284575a7ab6157a6c686d036b6d29fad374967a2314947de0674f0520793fd5e30bfbfdc02a1006f0f82f2bb12ad73d3b23b306739dd0ed6c29a5
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
        SHA512 ee63f5a2a874c892133526ed8186e9905bb309819f522f96dc80679fa17b74211a2cb6f2d93ae357152d10480ac09e6eb4e69898924aebd9bdeb2fb850b4693a
        HEAD_REF master
    )

    vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}/cpp"
        OPTIONS
            -DLIBLOOT_BUILD_TESTS=OFF
            -DLIBLOOT_INSTALL_DOCS=OFF
    )

    vcpkg_cmake_install()
    vcpkg_fixup_pkgconfig()

    vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
    vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
endif()

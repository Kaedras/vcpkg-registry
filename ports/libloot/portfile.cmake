if(VCPKG_TARGET_IS_WINDOWS)
    set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

    vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/loot/libloot/releases/download/${VERSION}/libloot-${VERSION}-win64.7z"
        FILENAME "libloot-${VERSION}-win64.7z"
        SHA512 66516b0b905f299666ed6c0e32312aeda84ef7bf0000d428691aa4483312060c44e6b159e70116e0d8cdd5733c23a9da2de73c6d8a01b1db757eb45b45a25100
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
        SHA512 4c2576751b4b56e3f889a62813685b4c65585756bd36d5764cb280d386ac67524d884848e3722409c3f9be6ffc7b22ff7333302e41a49ed2babd42e22e32a5ff
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

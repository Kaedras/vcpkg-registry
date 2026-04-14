# uibase is prebuilt and is always dynamic, but MO2 uses a static triplets (for Boost,
# lz4, etc.) so we disable that warning
set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

# TODO: add a copyright file to uibase and install it
set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)

if(VCPKG_TARGET_IS_WINDOWS)
    set(OS windows)
    set(SHA 34fd06aa09582eafecbca09cc1e58c8444383b67020236b2051e94d0ae9a0ed23acf9bc6b7c50b70b6fe261d4a300606bf85b80ccc5ef568806c20c591a58442)
else()
    set(OS linux)
    set(SHA 09fa59407e55f91312e2b825700da47e168e4e6d4c19cdcb24ef552bce8a09e0953b4fca12a541265458b5809b8c94ff1422aaf17b65684fd5bbbb46472ee5bf)
endif()

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/Kaedras/modorganizer-uibase/releases/download/v${VERSION}/uibase_v${VERSION}_${OS}.7z"
    FILENAME "uibase_${VERSION}.7z"
    SHA512 ${SHA}
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    NO_REMOVE_ONE_LEVEL
)

file(INSTALL ${SOURCE_PATH}/include DESTINATION ${CURRENT_PACKAGES_DIR})

if(VCPKG_TARGET_IS_WINDOWS)
    file(INSTALL
        ${SOURCE_PATH}/bin/uibase.dll
        ${SOURCE_PATH}/pdb/uibase.pdb
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/bin
    )
    file(INSTALL
        ${SOURCE_PATH}/lib/uibase.lib
        ${SOURCE_PATH}/lib/cmake
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/lib
    )

    file(INSTALL
        ${SOURCE_PATH}/bin/uibased.dll
        ${SOURCE_PATH}/pdb/uibased.pdb
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin)
    file(INSTALL
        ${SOURCE_PATH}/lib/uibased.lib
        ${SOURCE_PATH}/lib/cmake
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/debug/lib
    )
else()
    file(INSTALL
        ${SOURCE_PATH}/lib/libuibase.so
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/lib
    )
    file(INSTALL
        ${SOURCE_PATH}/lib/cmake
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/lib
    )

    file(INSTALL
        ${SOURCE_PATH}/lib/libuibased.so
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib)
    file(INSTALL
        ${SOURCE_PATH}/lib/cmake
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/debug/lib
    )
endif()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-uibase" CONFIG_PATH "lib/cmake/mo2-uibase")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

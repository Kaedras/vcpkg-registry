# uibase is prebuilt and is always dynamic, but MO2 uses a static triplets (for Boost,
# lz4, etc.) so we disable that warning
set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

# TODO: add a copyright file to uibase and install it
set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)

if(VCPKG_TARGET_IS_WINDOWS)
    set(OS windows)
    set(SHA 6cdbe541de53422848b0b666828e24d95218c48b35524b0b027251b386b0e276e642a0678482dcff03e4dce0664c803d97ff0f1bfe8d085edc026a382d4faa0c)
else()
    set(OS linux)
    set(SHA 35a4e6d43d249d3e029131d1267e4b746d3932fc983e49f7a36522ea93152a8182443f8468dccab18a06408b310c6544f09faff933114b8cdcad1b1f52767ffb)
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

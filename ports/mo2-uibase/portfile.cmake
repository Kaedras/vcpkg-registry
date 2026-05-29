# uibase is prebuilt and is always dynamic, but MO2 uses a static triplets (for Boost,
# lz4, etc.) so we disable that warning
set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

# TODO: add a copyright file to uibase and install it
set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)

if(VCPKG_TARGET_IS_WINDOWS)
    set(OS windows)
    set(SHA 020e25bb60127cb761b34d9837e8d00ea8e72f2e28fa029f43e82814aceaa0f937cfe655a5f844b1fb23f416788b74c275cb034c5cc4b815e75f841060cbb2b0)
else()
    set(OS linux)
    set(SHA c297cc1b57d50079b701f7b44848be5f990d4ee2524edf9353c0f6dad405aa2e14ee5d9383ecd68b146ddd37893bd4857ef5dc2c5826ec64487619875c07b36b)
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

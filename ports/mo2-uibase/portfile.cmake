# uibase is prebuilt and is always dynamic, but MO2 uses a static triplets (for Boost,
# lz4, etc.) so we disable that warning
set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

# TODO: add a copyright file to uibase and install it
set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)

if(VCPKG_TARGET_IS_WINDOWS)
    set(OS windows)
    set(SHA 2b3ce29355ec56e0e6175cd7a9f69e4eab7eb576b060fb7889c9e3088220168b806bde5c132b8fa0c3aab2206ccabba6026b075f6d212416428cd54155bc5d48)
else()
    set(OS linux)
    set(SHA feff67b309884b4738de96041ddafbe10171f82c2be60e4ecdcd736296d8495c57b70af1aa8aa3d4f8657487db24d930fcb5a921b53c09b57a272b66e76d1207)
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

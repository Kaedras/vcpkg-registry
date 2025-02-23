set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-archive
    REF dcc095408deb335f6e23719b921073e78c11d348
    SHA512 57ed91e2411ed0ce136d93934598285370a5f92150b98dc4967147fa38852cf20fcf0f4a59d267458bedb4ab02de831bb1c4f83d8ba2218b161b65de76c8b3f3
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-archive" CONFIG_PATH "lib/cmake/mo2-archive")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

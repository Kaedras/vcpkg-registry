set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-archive
    REF a3331cfc839ed3e4c4b43ca2d2fd8068ad4a1c02
    SHA512 529653fceac9ad6715ecd66ca018e771fb5992494fedd18e94d92a5a5b0c9708cd25f23457f1f7c66eb30c22d296cbeed8add1d7c5b725fa08f6d33df3a9a8bc
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-archive" CONFIG_PATH "lib/cmake/mo2-archive")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

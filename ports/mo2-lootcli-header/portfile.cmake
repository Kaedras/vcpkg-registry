vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-lootcli
    REF ${VERSION}
    SHA512 e563f02cff156e1ff6920cc9e8d6f65006e64fc308a0ace117893c5e5ad80f38a6ee4873755054b0377699ee76662de06184320b9ee2dcfa55ec480f01d7f87f
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-lootcli-header" CONFIG_PATH "lib/cmake/mo2-lootcli-header")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

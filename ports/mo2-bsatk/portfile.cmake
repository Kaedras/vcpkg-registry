vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-bsatk
    REF "${VERSION}"
    SHA512 8100c77d9a477ca278e29fc374f6db0c1059e4d9c9052662f91f04fb47ba5af3f213faca408742e37dde515570fa8afe96598164d5ca6a93aaa580f7d16a45de
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-bsatk" CONFIG_PATH "lib/cmake/mo2-bsatk")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

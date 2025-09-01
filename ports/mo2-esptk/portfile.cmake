vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-esptk
    REF "${VERSION}"
    SHA512 2512cc752c69e21a8ac299a1fde4e6dcda315df2ce71a96d538950df48ed2c5d65d0703827526bdbf304e329d21f048627ce3662f6b7cf6ef6469b5cf1d7e44f
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-esptk" CONFIG_PATH "lib/cmake/mo2-esptk")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

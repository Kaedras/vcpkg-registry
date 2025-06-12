vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-esptk
    REF "${VERSION}"
    SHA512 07be6059a1345d0507c44736df4e532eb027a27cf30a03e2382534558236430b43e1d7e1a63fa7d073ad204c10c5fec7475be9f107da49ad857dcc063c6c737c
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-esptk" CONFIG_PATH "lib/cmake/mo2-esptk")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

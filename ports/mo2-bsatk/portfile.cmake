vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-bsatk
    REF "${VERSION}"
    SHA512 3238386f7fba3316bdf447c8a8b0666163d3f83fafeca1c8d049eee9d94987a11471545cbb42297b2cd549a4f78a6bd3c10f9e09a7ebc8c10e0aba542ea75411
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-bsatk" CONFIG_PATH "lib/cmake/mo2-bsatk")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-bsatk
    REF "${VERSION}"
    SHA512 45c0bd2da2771e72beef21830896d17df34dc8fed43ae9917ded8d7c18081f043e0625675e7a749bf89821db9517323084e584915fda7ee8854ea04ccd8d0d91
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-bsatk" CONFIG_PATH "lib/cmake/mo2-bsatk")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

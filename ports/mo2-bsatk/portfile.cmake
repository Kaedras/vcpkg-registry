vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-bsatk
    REF "${VERSION}"
    SHA512 de581f6dce26d9d0a3bb4249ab4fa390854ed7365560f6e34d151eccbdc36f53a006d21249acb30a4a93d3c34ae3e0aeda46af7764aed9cd31f6778c2f4822fc
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-bsatk" CONFIG_PATH "lib/cmake/mo2-bsatk")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

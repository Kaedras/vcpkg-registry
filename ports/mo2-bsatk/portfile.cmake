vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-bsatk
    REF "${VERSION}"
    SHA512 a3e737e4862bbdd197333d715b85dd02881fa5ed0747ef7365413a1013e22b82637ca6af38fb02df9e90cc75f36e7c3582dd3842b38db0b8f96cda8d4974ca65
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-bsatk" CONFIG_PATH "lib/cmake/mo2-bsatk")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

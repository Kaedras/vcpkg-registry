vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-bsatk
    REF 2c834806ef1f1b2fc5598fbcee26ed1779c0896a
    SHA512 ab2aa341af33e60cf0874db51eb7d273f6e31c663d3f3a993f59b292e95f1c3a6a577e8b01fd6400ccc3f20b2ade0cfdc838f97524b5ca5aab56f6f7c079aa0f
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-bsatk" CONFIG_PATH "lib/cmake/mo2-bsatk")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

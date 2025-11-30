vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/mo2-overlayfs
    REF "${VERSION}"
    SHA512 4dd807399181a00b4891a69b54911cdaca509fb8e1d6030d31462570652fc66cdd07f662eb71d28b10a703bb8e38ab4f4eac561d4bec940f095f2d9d59b476ea
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-overlayfs" CONFIG_PATH "lib/cmake/mo2-overlayfs")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

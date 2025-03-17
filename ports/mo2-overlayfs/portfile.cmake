vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/mo2-overlayfs
    REF 07e951be41958f4fdb829b8fbc5853ea0b5cfea7
    SHA512 46e49d958dff4e851025e7edcbe581f9c44e69ee2d5d7a6d446fbb31f56085e862ab3fcc33850f2cbee3a24ee1999807da2faca074dc93d947abdc33c55e5dbb
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-overlayfs" CONFIG_PATH "lib/cmake/mo2-overlayfs")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
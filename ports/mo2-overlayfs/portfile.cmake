vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/mo2-overlayfs
    REF cb478d87b6a7c7d1cc8a863cc08182764dad0435
    SHA512 b346fa5e5405f0be21454dd7ec61ae1de89cee9c6a38241f8105c4835815b1cd81b1441cf7c0ecd77ba610da45d448cf5c81c0b84366357c9cd9b6cfbe1f5fb6
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-overlayfs" CONFIG_PATH "lib/cmake/mo2-overlayfs")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
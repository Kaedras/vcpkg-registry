vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/usvfs-fuse
    REF 863edd4f72e53f0eb55eb1621dbea648dee5de10
    SHA512 cca33ae9ae2eada16fc291b7811ce92ac34fd1af48db7fd73a89c78d5c0df8201b12a1e41bcf649adcc9526ce6e60bd197a4e519362d178afea27fc250a4893f
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "usvfs-fuse" CONFIG_PATH "lib/cmake/usvfs-fuse")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

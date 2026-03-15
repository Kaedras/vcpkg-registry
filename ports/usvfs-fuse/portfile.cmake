vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/usvfs-fuse
    REF cb84ff63ec619cf2585595ee210684034907f86d
    SHA512 d0fd01ccd4c0273794b24403cd8b77bd28e8b28ddb99e0ec909944b3d9e7db2cad6fc2f3a85bacaaabc3f7904b132dbbbc515666931dfd322fecff354745ec3d
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "usvfs-fuse" CONFIG_PATH "lib/cmake/usvfs-fuse")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

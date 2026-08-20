vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/usvfs-fuse
    REF ${VERSION}
    SHA512 f0e24ed6f16d1e241cd01024107455ce517498297b9ebfe22e9a741245126ecb4ded3bdbd4d02c25ce5a324739698c91946b4fad3a716d4853b319802a12b406
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "usvfs-fuse" CONFIG_PATH "lib/cmake/usvfs-fuse")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

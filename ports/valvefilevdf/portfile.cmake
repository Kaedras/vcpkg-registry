vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO TinyTinni/ValveFileVDF
    REF 9138f83d310fc3f656297f79a9b43d0a5d45cd4e
    SHA512 3bc25a94298bc03387b4360c27335d09a66fcbd18890ddf2707e4c073aeaa3590cf0d8a0544fa6c949d1bf9cdb77b4fc944a3eab91e4e3d07cca5560de6e929e
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug
    ${CURRENT_PACKAGES_DIR}/lib
)

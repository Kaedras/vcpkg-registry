vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/libbsarchpp
    REF "${VERSION}"
    SHA512 0e7e3c3ac083689de3fcedcf3f6554d7b444b41341a274d7145e3d424de8ba7b8a6af5f904fa85797ca3fb3d86133acbb2c0f708ca6737e8c035156c607a86f5
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS)
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(PACKAGE_NAME "libbsarchpp" CONFIG_PATH "lib/cmake/libbsarchpp")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/libbsarchpp
    REF "${VERSION}"
    SHA512 165435474b94f36d1aafb2d7390f1c82fc0da7e8978c0ac1655c676f50706e037feb4bda077a8e0892eaa7d302a2389cb35aa4274e4e2aa33b0e9550ea398640
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS)
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(PACKAGE_NAME "libbsarchpp" CONFIG_PATH "lib/cmake/libbsarchpp")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

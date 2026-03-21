vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/libbsarchpp
    REF "${VERSION}"
    SHA512 4750005373f3ab2cb5ed3b5726842f9a433ec273ffbb88ce6df43ed546318e9524b50ff84be378385b3f149395fb51f08d10ac84fdadb9c093c3412ea9f969bf
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS)
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(PACKAGE_NAME "libbsarchpp" CONFIG_PATH "lib/cmake/libbsarchpp")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

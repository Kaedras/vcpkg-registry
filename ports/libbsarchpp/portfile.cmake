vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/libbsarchpp
    REF "${VERSION}"
    SHA512 4a38998e55cc9ffc00c527c2b439a240cb462e6425faebe9ebed650ba3580cc3030f4587db36078263b5134c66c801ecb218271e8ed4754a23284a33c5f9c565
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DUSE_VCPKG=ON)
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(PACKAGE_NAME "libbsarchpp" CONFIG_PATH "lib/cmake/libbsarchpp")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

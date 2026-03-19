vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/libbsarchpp
    REF b2541bf51ea437e2c4a60eb918bae329600f9569
    SHA512 e8657a7d6af60d4b73af427c080d8a81af21722c7f846255b7f4c956641266a43367149ed91f07566eb53900b4ed19835f8ad27eeecb850a177223cc9aca1a86
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DUSE_VCPKG=ON)
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(PACKAGE_NAME "libbsarchpp" CONFIG_PATH "lib/cmake/libbsarchpp")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

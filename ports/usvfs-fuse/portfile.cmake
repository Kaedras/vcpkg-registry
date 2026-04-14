vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/usvfs-fuse
    REF ${VERSION}
    SHA512 37281acc4adaa9ca3cb5e77703bb8f0999eaf7321411aa62c628ddf575f501646b59df2d57bf290b234972b85000496bd5a8338b8444524df1b559eb5438b609
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "usvfs-fuse" CONFIG_PATH "lib/cmake/usvfs-fuse")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

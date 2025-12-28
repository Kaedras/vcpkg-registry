vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/usvfs-fuse
    REF 689ecde962023e85ec174f8037cf08e9f438cd92
    SHA512 aeaf6dab67d990bd3237fd47057a2e24d8ae38dd262933d7ddd44ac713187b9b98233b536d2df9d83a272a05e256e8473fe418c15934e3d7948d9396bdf849eb
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "usvfs-fuse" CONFIG_PATH "lib/cmake/usvfs-fuse")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

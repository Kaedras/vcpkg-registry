vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/mo2-overlayfs
    REF "${VERSION}"
    SHA512 0b53a0aa8a51ac3538598061b10dc76f785a09c52eb4ce4fc9696a9b8f40a78cd45c16d3152eebe85fb394ba1f0fea92542ce7629a371110f310913d4a4182dd
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-overlayfs" CONFIG_PATH "lib/cmake/mo2-overlayfs")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

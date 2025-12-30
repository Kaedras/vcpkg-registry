vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/usvfs-fuse
    REF cdb585369bec7bd4191b846e55bab9f0f2602ef2
    SHA512 475ed32a98db04b18a38d1daa5bc84b1d194b7641039164379610de9c8a5370f3834bd674a6351875f3018fbfa9eeb6c8635e789d432ceaf14e22882ecb9cc03
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "usvfs-fuse" CONFIG_PATH "lib/cmake/usvfs-fuse")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

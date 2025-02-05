set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-archive
    REF 14bf465b04effeccb456db87c4b46f939c74ad76
    SHA512 08cf417fe12a414fca47d7d8bda5d67647c50a6a2f6b860ed6c5646835a1ba0c67d12adb972cc7a3bb515f6065e0247fa201d7e76d590a8007313c9f1e6ad6a3
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-archive" CONFIG_PATH "lib/cmake/mo2-archive")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/usvfs-fuse
    REF 697eaed842b174667c532bab8967e14c155c08b4
    SHA512 e67b0d9202ca7601a609e839ac6cd54838b4f61f2fca4b4bcfdd5bd0d1d88cf42e5141282af5d887752b14f17c615d985f3435c765f106a7d0a8d9d2c09d9a0e
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "usvfs-fuse" CONFIG_PATH "lib/cmake/usvfs-fuse")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

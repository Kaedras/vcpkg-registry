vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/modorganizer-lootcli
    REF ${VERSION}
    SHA512 12062f27c4ec2b4b79b141aca4a296f500887c0a3217be96f984f3445b98b3588a6d14cca9f6c17f89c6facedcdc70c6977b37cc0d54e6ba48a1dda3cd39e36e
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DHEADER_ONLY=ON)
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-lootcli-header" CONFIG_PATH "lib/cmake/mo2-lootcli-header")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

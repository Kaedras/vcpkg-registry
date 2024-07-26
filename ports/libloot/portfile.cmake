set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO loot/libloot
    REF "${VERSION}"
    SHA512 f2496f84bce3f3f4ae502d6355bb26529d407ddf6f8780e30e63efc3e5d48693f7502f1d10a1af306f435bd6ba6d9e2b468e7c2525dae49aec075cddbba00d74
    HEAD_REF master
    PATCHES fix-spdlog.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DLIBLOOT_BUILD_TESTS=OFF
        -DLIBLOOT_INSTALL_DOCS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_fixup_pkgconfig()

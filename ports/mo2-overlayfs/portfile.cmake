vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/mo2-overlayfs
    REF 31963beabbc8ecc13d6f9ee5f8a66e927b438ee0
    SHA512 37ea2897db5942abf678fe604a81ddb92d224a3293d060132cb184ef27093decc22234b90f0047e60929db9da082ea0779eaed3a8da50599455467d2abb15abf
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-overlayfs" CONFIG_PATH "lib/cmake/mo2-overlayfs")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

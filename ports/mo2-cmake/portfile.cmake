set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)
set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/cmake_common
    REF "v${VERSION}"
    SHA512 0080501d3027b3fbd35ab7484c09d2ea79fbaed1331a2be18a35d5e6f1c9393281c1986d7054042340a8978d886d50dbfdcc03e2d0356614fbae52b7e75165ef
    HEAD_REF master
)

file(INSTALL
    "${SOURCE_PATH}/mo2_cpp.cmake"
    "${SOURCE_PATH}/mo2_python.cmake"
    "${SOURCE_PATH}/mo2_utils.cmake"
    "${SOURCE_PATH}/mo2_versions.cmake"
    "${SOURCE_PATH}/mo2.cmake"
    "${SOURCE_PATH}/mo2-cmake-config.cmake"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

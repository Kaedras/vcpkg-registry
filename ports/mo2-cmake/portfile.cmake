set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)
set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/cmake_common
    REF 7dab90b0477dd2fb9394afed7a81875ef4d45ca5
    SHA512 eae81fccc1a4b99a004511ae92c407cd6baf790bc4abb43e3191a06832849e29755a8d4b264d62b9f7d4c3d8c8f2f0411a24c8ce00266cb586d4de43a32900c5
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

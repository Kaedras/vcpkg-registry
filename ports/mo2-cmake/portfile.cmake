set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)
set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/cmake_common
    REF 37c904f865510cbb5298e428830d6cd76c5bacf3
    SHA512 28c3162f2e6719bf2085ae1c3a1523906ddb482e53ede269c054d877bd57c8d4d53c224d6d183d3a8631c2354c94e7bc8c3902a97e8e7609e20c6866efe15a63
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

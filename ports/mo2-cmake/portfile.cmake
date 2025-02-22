set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)
set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/cmake_common
    REF e0d361f41d36714753d1820c7e612c6f7279e318
    SHA512 742301d7d34f13ef135d489037235ce2bb861931395c574d77e39790bd577af8e650ac0347fb5345fd572e57dfa742db312931008fd4cd6d4ddafb57038f76a8
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

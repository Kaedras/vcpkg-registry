set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Kaedras/cmake_common
    REF 64a002e9d9ffd1502854441b21a969c86d60649c
    SHA512 08f0b3c78db1d8f3ee184223df32878f732ef540c265f5d2f87c21f5ce6b6f4da93d75575fa38936313ec1f2a97714b10a109339346b9e023c81eb16bc507d09
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

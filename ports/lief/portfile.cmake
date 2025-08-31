set(VCPKG_POLICY_MISMATCHED_NUMBER_OF_BINARIES enabled)

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/lief-project/LIEF/releases/download/${VERSION}/LIEF-${VERSION}-Linux-x86_64.tar.gz"
    FILENAME "LIEF-${VERSION}-Linux-x86_64.tar.gz"
    SHA512 d44ed694ef97a12ab55c76b6a5fabc2b2b3d6f124f2eb907423fb121b17455d892929bae4cc0073ae3b300efaf91aff6920491788798225efecd7ea64bf8ba25
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    PATCHES fix-paths.patch
)

file(INSTALL "${SOURCE_PATH}/include" DESTINATION "${CURRENT_PACKAGES_DIR}")

file(INSTALL
    "${SOURCE_PATH}/lib/libLIEF.a"
    DESTINATION
    "${CURRENT_PACKAGES_DIR}/lib"
)
file(INSTALL
    "${SOURCE_PATH}/lib/cmake/LIEF/"
    DESTINATION
    "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)


vcpkg_download_distfile(LICENSE
    URLS "https://raw.githubusercontent.com/lief-project/LIEF/main/LICENSE"
    FILENAME "LICENSE"
    SHA512 ad9379995c7262a33beda046ff13d0797459de3b9e168dbb80e014633b97be24573449c5dd955cbff33283a2d1cd754bf7bc262664c38867965a2d223a8aa148
)
vcpkg_install_copyright(FILE_LIST "${LICENSE}")

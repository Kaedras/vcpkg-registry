# uibase is prebuilt and is always dynamic, but MO2 uses a static triplets (for Boost,
# lz4, etc.) so we disable that warning
set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

# TODO: add a copyright file to uibase and install it
set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)

if(VCPKG_TARGET_IS_WINDOWS)
    set(OS windows)
    set(SHA 657841a243b92c2c86623587387afc78cfd8a7896e43e7f1339f10b10c07ec14ceedb70a6f079a4a55120da350a07d0fcb47fbc21ecf8fc0368799dbda8e4e0a)
else()
    set(OS linux)
    set(SHA 210dd284e2c860ebaa96eacea9ce65e22d2f359be74ad2b63f6622b6f7c312ad683fb0f33c5c6412261b9d6063ac9e2e0a68a9f691914a04017dbe4b1f785ac0)
endif()

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/Kaedras/modorganizer-uibase/releases/download/v${VERSION}/uibase_v${VERSION}_${OS}.7z"
    FILENAME "uibase_${VERSION}.7z"
    SHA512 ${SHA}
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    NO_REMOVE_ONE_LEVEL
)

file(INSTALL ${SOURCE_PATH}/include DESTINATION ${CURRENT_PACKAGES_DIR})

if(VCPKG_TARGET_IS_WINDOWS)
    file(INSTALL
        ${SOURCE_PATH}/bin/uibase.dll
        ${SOURCE_PATH}/pdb/uibase.pdb
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/bin
    )
    file(INSTALL
        ${SOURCE_PATH}/lib/uibase.lib
        ${SOURCE_PATH}/lib/cmake
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/lib
    )

    file(INSTALL
        ${SOURCE_PATH}/bin/uibased.dll
        ${SOURCE_PATH}/pdb/uibased.pdb
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin)
    file(INSTALL
        ${SOURCE_PATH}/lib/uibased.lib
        ${SOURCE_PATH}/lib/cmake
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/debug/lib
    )
else()
    file(INSTALL
        ${SOURCE_PATH}/lib/libuibase.so
        ${SOURCE_PATH}/debug/libuibase.so.debug
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/lib
    )
    file(INSTALL
        ${SOURCE_PATH}/lib/cmake
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/lib
    )

    file(INSTALL
        ${SOURCE_PATH}/lib/libuibased.so
        ${SOURCE_PATH}/debug/libuibased.so.debug
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib)
    file(INSTALL
        ${SOURCE_PATH}/lib/cmake
    DESTINATION
        ${CURRENT_PACKAGES_DIR}/debug/lib
    )
endif()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-uibase" CONFIG_PATH "lib/cmake/mo2-uibase")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

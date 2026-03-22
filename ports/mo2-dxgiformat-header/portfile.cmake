vcpkg_download_distfile(HEADER
    URLS "https://raw.githubusercontent.com/microsoft/DirectX-Headers/${VERSION}/include/directx/dxgiformat.h"
    FILENAME "dxgiformat.h"
    SHA512 004be604e28a60f8f6195144e678a82d10894fc4d1cfea10e7efa72eb7d7cd15efbd03d21ec80a65579c00eec8aa77b09809ade3f1b9198901757ebe7a63401c
)

file(INSTALL ${HEADER} DESTINATION ${CURRENT_PACKAGES_DIR}/include/directx)
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/mo2-dxgiformat-header-config.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

# install license
vcpkg_download_distfile(LICENSE
    URLS "https://raw.githubusercontent.com/microsoft/DirectX-Headers/${VERSION}/LICENSE"
    FILENAME "LICENSE"
    SHA512 6ef2dc66f6d26b34d1302c760bfc070b3557717571ebccb0bcdac899b91e916c1b47be4cd9e8ce1b387599e99507c98b0f320b20f2997139ebccc90782c32ae7
)
file(INSTALL ${LICENSE} DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME "copyright")

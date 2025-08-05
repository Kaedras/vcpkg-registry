vcpkg_download_distfile(ARCHIVE
    URLS "https://raw.githubusercontent.com/microsoft/DirectX-Headers/${VERSION}/include/directx/dxgiformat.h"
    FILENAME "dxgiformat.h"
    SHA512 004be604e28a60f8f6195144e678a82d10894fc4d1cfea10e7efa72eb7d7cd15efbd03d21ec80a65579c00eec8aa77b09809ade3f1b9198901757ebe7a63401c
)

file(INSTALL ${ARCHIVE} DESTINATION ${CURRENT_PACKAGES_DIR}/include/directx)
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/mo2-dxgiformat-header-config.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/mo2-dxgiformat-header)

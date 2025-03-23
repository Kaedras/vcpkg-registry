vcpkg_download_distfile(ARCHIVE
    URLS "https://raw.githubusercontent.com/TinyTinni/ValveFileVDF/${VERSION}/include/vdf_parser.hpp"
    FILENAME "vdf_parser.hpp"
    SHA512 f2d85be10941c0b5da74c10a19b1f74f068188a246b2cb34f5af31c84d45f29bb0a22a0ffe36fa9c8310a101d1be6a94a263882c7534c93e483e42bef802d657
)

vcpkg_download_distfile(LICENSE
    URLS "https://raw.githubusercontent.com/TinyTinni/ValveFileVDF/${VERSION}/LICENSE"
    FILENAME "copyright"
    SHA512 b18d8c531ed78e2f350c23cb8e2787399db76d3838aab4a34b8a816910781e49f352dfa55473c882fd624b540c4491158364536337e7be8b64f892dbdf46e6e3
)

file(INSTALL ${ARCHIVE} DESTINATION ${CURRENT_PACKAGES_DIR}/include/vdf-parser)
file(INSTALL ${LICENSE} DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/vdf-parser-config.cmake DESTINATION ${CURRENT_PACKAGES_DIR}/share/vdf-parser)

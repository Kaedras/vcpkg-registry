if (TARGET mo2::dxgiformat-header)
  return()
endif()

get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)

add_library(mo2::dxgiformat-header INTERFACE IMPORTED)
target_include_directories(mo2::dxgiformat-header INTERFACE ${_IMPORT_PREFIX}/include/directx)

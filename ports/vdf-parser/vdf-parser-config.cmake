if (TARGET vdf-parser)
  return()
endif()

get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)

add_library(vdf-parser INTERFACE IMPORTED)
target_include_directories(vdf-parser INTERFACE ${_IMPORT_PREFIX}/include/vdf)

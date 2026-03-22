if (TARGET mo2::dxgiformat-header)
  return()
endif()

add_library(mo2::dxgiformat-header INTERFACE IMPORTED)
set_target_properties(mo2::dxgiformat-header PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/../../include")

cmake_minimum_required(VERSION 3.18)

# uncomment these 2 lines if using clang
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -target x86_64-pc-windows-gnu")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -target x86_64-pc-windows-gnu")

# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(ffmpeg-clang-playground)

add_library(ffmpeg STATIC IMPORTED)

set_property(
  TARGET ffmpeg APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG
)

set(MY_SHARED_LIBS
  "${_IMPORT_PREFIX}/"
    "D:/Code Projects/ffmpeg-clang/ffmpeg-master-windows-desktop-clang-lite.tar/lib/x64/avutil.lib" 
    "D:/Code Projects/ffmpeg-clang/ffmpeg-master-windows-desktop-clang-lite.tar/lib/x64/avformat.lib"
)

# "${FFMPEG_ROOT}/lib/x64/avcodec.lib;${FFMPEG_ROOT}/lib/x64/avdevice.lib;${FFMPEG_ROOT}/lib/x64/avfilter.lib;${FFMPEG_ROOT}/lib/x64/avformat.lib;${FFMPEG_ROOT}/lib/x64/avutil.lib;${FFMPEG_ROOT}/lib/x64/ffmpeg.lib;${FFMPEG_ROOT}/lib/x64/swresample.lib;${FFMPEG_ROOT}/lib/x64/swscale.lib"
set_target_properties(ffmpeg PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${FFMPEG_ROOT}/lib/x64/ffmpeg.lib"
)

set_property(
  TARGET ffmpeg APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(ffmpeg PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${FFMPEG_ROOT}/lib/x64/ffmpeg.lib"
)
  
set_target_properties(ffmpeg PROPERTIES
  MAP_IMPORTED_CONFIG_MINSIZEREL Release
  MAP_IMPORTED_CONFIG_RELWITHDEBINFO Release
)

target_include_directories(ffmpeg INTERFACE "${FFMPEG_ROOT}/include")

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

add_executable(${PROJECT_NAME} 
  "src/main.cpp"
)

target_link_libraries(${PROJECT_NAME} ffmpeg)
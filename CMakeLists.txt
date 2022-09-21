cmake_minimum_required(VERSION 3.18)

# uncomment these 2 lines if using clang
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -target x86_64-pc-windows-gnu")
# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -target x86_64-pc-windows-gnu")

# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_SYSTEM_VERSION 10.0)

project(ffmpeg-playground)

macro(add_ffmpeg_library_component target component)
  add_library(${component} STATIC IMPORTED)
  
  set_property(
    TARGET ${component} APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
  )

  set_target_properties(${component} PROPERTIES
    IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
    IMPORTED_LOCATION_RELEASE "${FFMPEG_ROOT}/lib/lib${component}.a"
  )

  message(STATUS "${FFMPEG_ROOT}/lib/lib${component}.a")
  target_include_directories(${component} INTERFACE "${FFMPEG_ROOT}/include")
  target_link_libraries(${target} ${component})
endmacro()


add_library(avcodec STATIC IMPORTED)
  
set_property(
  TARGET avcodec APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(avcodec PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${FFMPEG_ROOT}/lib/libavcodec.a"
)

message(STATUS "${FFMPEG_ROOT}/lib/libavcodec.a")
target_include_directories(avcodec INTERFACE "${FFMPEG_ROOT}/include")


#################################

add_library(avdevice STATIC IMPORTED)
  
set_property(
  TARGET avdevice APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(avdevice PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${FFMPEG_ROOT}/lib/libavdevice.a"
)

message(STATUS "${FFMPEG_ROOT}/lib/libavdevice.a")
target_include_directories(avdevice INTERFACE "${FFMPEG_ROOT}/include")



#################################

add_library(avfilter STATIC IMPORTED)
  
set_property(
  TARGET avfilter APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(avfilter PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${FFMPEG_ROOT}/lib/libavfilter.a"
)

message(STATUS "${FFMPEG_ROOT}/lib/libavfilter.a")
target_include_directories(avfilter INTERFACE "${FFMPEG_ROOT}/include")



#################################

add_library(avformat STATIC IMPORTED)
  
set_property(
  TARGET avformat APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(avformat PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${FFMPEG_ROOT}/lib/libavformat.a"
)

message(STATUS "${FFMPEG_ROOT}/lib/libavformat.a")
target_include_directories(avformat INTERFACE "${FFMPEG_ROOT}/include")


#################################

add_library(avutil STATIC IMPORTED)
  
set_property(
  TARGET avutil APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(avutil PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${FFMPEG_ROOT}/lib/libavutil.a"
)

message(STATUS "${FFMPEG_ROOT}/lib/libavutil.a")
target_include_directories(avutil INTERFACE "${FFMPEG_ROOT}/include")


################################

add_library(postproc STATIC IMPORTED)
  
set_property(
  TARGET postproc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(postproc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${FFMPEG_ROOT}/lib/libpostproc.a"
)

message(STATUS "${FFMPEG_ROOT}/lib/libpostproc.a")
target_include_directories(postproc INTERFACE "${FFMPEG_ROOT}/include")



#################################

add_library(swresample STATIC IMPORTED)
  
set_property(
  TARGET swresample APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(swresample PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${FFMPEG_ROOT}/lib/libswresample.a"
)

message(STATUS "${FFMPEG_ROOT}/lib/libswresample.a")
target_include_directories(swresample INTERFACE "${FFMPEG_ROOT}/include")



#################################

add_library(swscale STATIC IMPORTED)
  
set_property(
  TARGET swscale APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(swscale PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${FFMPEG_ROOT}/lib/libswscale.a"
)

message(STATUS "${FFMPEG_ROOT}/lib/libswscale.a")
target_include_directories(swscale INTERFACE "${FFMPEG_ROOT}/include")


#################################

add_library(zlib STATIC IMPORTED)
  
set_property(
  TARGET zlib APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(zlib PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${ZLIB_ROOT}/lib/libzlibstatic.a"
)

target_include_directories(zlib INTERFACE "${ZLIB_ROOT}/include")


#################################






set_property( TARGET avdevice APPEND PROPERTY INTERFACE_LINK_LIBRARIES Strmiids zlib Quartz Vfw32 winmm D3D11 ws2_32 shlwapi dxva2 evr  mf avutil avformat avcodec)


# -Bstatic
SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

add_executable(${PROJECT_NAME} 
  "src/main.cpp"
)

target_link_libraries(${PROJECT_NAME} shlwapi ws2_32 D3D11 Strmiids Quartz Vfw32 zlib avcodec avdevice avfilter avformat avutil postproc swresample swscale)

# add_ffmpeg_library_component(${PROJECT_NAME} avcodec)
# add_ffmpeg_library_component(${PROJECT_NAME} avdevice)
# add_ffmpeg_library_component(${PROJECT_NAME} avfilter)
# add_ffmpeg_library_component(${PROJECT_NAME} avformat)
# add_ffmpeg_library_component(${PROJECT_NAME} avutil)
# add_ffmpeg_library_component(${PROJECT_NAME} postproc)
# add_ffmpeg_library_component(${PROJECT_NAME} swresample)
# add_ffmpeg_library_component(${PROJECT_NAME} swscale)

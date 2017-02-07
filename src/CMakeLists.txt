cmake_minimum_required(VERSION 3.7)
include("cmake/message.cmake")

project(yuni)
ynmessage()
ynmessage(BOLD "The Yuni Framework")

set(YUNI_URL_WEBSITE  "http://www.libyuni.org")
set(YUNI_VERSION_HI   2)
set(YUNI_VERSION_LO   0)
set(YUNI_VERSION_REV  0)
set(YUNI_VERSION      "${YUNI_VERSION_HI}.${YUNI_VERSION_LO}")

include("cmake/system-information.cmake")

set(VS_KEYWORD                    "YuniVS${YUNI_VERSION}")
set(VERSION                       "${YUNI_VERSION}")
set(VS_SCC_PROJECTNAME            "Yuni Framework")
set(PROJECT_LABEL                 "Yuni Framework")
set(CMAKE_EXPORT_COMPILE_COMMANDS 1) # vim / youcomplete / emacs / ...
set(YUNI_VERSIONED_INST_PATH      "yuni/${YUNI_VERSION}")

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED 1)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)

add_subdirectory(yuni)

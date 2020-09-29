# Install script for directory: /Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/doc/tiff/html/images/back.gif;/usr/local/share/doc/tiff/html/images/bali.jpg;/usr/local/share/doc/tiff/html/images/cat.gif;/usr/local/share/doc/tiff/html/images/cover.jpg;/usr/local/share/doc/tiff/html/images/cramps.gif;/usr/local/share/doc/tiff/html/images/dave.gif;/usr/local/share/doc/tiff/html/images/info.gif;/usr/local/share/doc/tiff/html/images/jello.jpg;/usr/local/share/doc/tiff/html/images/jim.gif;/usr/local/share/doc/tiff/html/images/note.gif;/usr/local/share/doc/tiff/html/images/oxford.gif;/usr/local/share/doc/tiff/html/images/quad.jpg;/usr/local/share/doc/tiff/html/images/ring.gif;/usr/local/share/doc/tiff/html/images/smallliz.jpg;/usr/local/share/doc/tiff/html/images/strike.gif;/usr/local/share/doc/tiff/html/images/warning.gif")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/share/doc/tiff/html/images" TYPE FILE FILES
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/back.gif"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/bali.jpg"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/cat.gif"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/cover.jpg"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/cramps.gif"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/dave.gif"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/info.gif"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/jello.jpg"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/jim.gif"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/note.gif"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/oxford.gif"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/quad.jpg"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/ring.gif"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/smallliz.jpg"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/strike.gif"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/html/images/warning.gif"
    )
endif()


# Install script for directory: /Users/andreas/Moln/GitHub/rcell2/src/tiff410/man

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
   "/usr/local/share/man/man1/fax2ps.1;/usr/local/share/man/man1/fax2tiff.1;/usr/local/share/man/man1/pal2rgb.1;/usr/local/share/man/man1/ppm2tiff.1;/usr/local/share/man/man1/raw2tiff.1;/usr/local/share/man/man1/tiff2bw.1;/usr/local/share/man/man1/tiff2pdf.1;/usr/local/share/man/man1/tiff2ps.1;/usr/local/share/man/man1/tiff2rgba.1;/usr/local/share/man/man1/tiffcmp.1;/usr/local/share/man/man1/tiffcp.1;/usr/local/share/man/man1/tiffcrop.1;/usr/local/share/man/man1/tiffdither.1;/usr/local/share/man/man1/tiffdump.1;/usr/local/share/man/man1/tiffgt.1;/usr/local/share/man/man1/tiffinfo.1;/usr/local/share/man/man1/tiffmedian.1;/usr/local/share/man/man1/tiffset.1;/usr/local/share/man/man1/tiffsplit.1")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/share/man/man1" TYPE FILE FILES
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/fax2ps.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/fax2tiff.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/pal2rgb.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/ppm2tiff.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/raw2tiff.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiff2bw.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiff2pdf.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiff2ps.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiff2rgba.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiffcmp.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiffcp.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiffcrop.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiffdither.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiffdump.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiffgt.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiffinfo.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiffmedian.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiffset.1"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/tiffsplit.1"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/man/man3/libtiff.3tiff;/usr/local/share/man/man3/TIFFbuffer.3tiff;/usr/local/share/man/man3/TIFFClose.3tiff;/usr/local/share/man/man3/TIFFcodec.3tiff;/usr/local/share/man/man3/TIFFcolor.3tiff;/usr/local/share/man/man3/TIFFDataWidth.3tiff;/usr/local/share/man/man3/TIFFError.3tiff;/usr/local/share/man/man3/TIFFFieldDataType.3tiff;/usr/local/share/man/man3/TIFFFieldName.3tiff;/usr/local/share/man/man3/TIFFFieldPassCount.3tiff;/usr/local/share/man/man3/TIFFFieldReadCount.3tiff;/usr/local/share/man/man3/TIFFFieldTag.3tiff;/usr/local/share/man/man3/TIFFFieldWriteCount.3tiff;/usr/local/share/man/man3/TIFFFlush.3tiff;/usr/local/share/man/man3/TIFFGetField.3tiff;/usr/local/share/man/man3/TIFFmemory.3tiff;/usr/local/share/man/man3/TIFFOpen.3tiff;/usr/local/share/man/man3/TIFFPrintDirectory.3tiff;/usr/local/share/man/man3/TIFFquery.3tiff;/usr/local/share/man/man3/TIFFReadDirectory.3tiff;/usr/local/share/man/man3/TIFFReadEncodedStrip.3tiff;/usr/local/share/man/man3/TIFFReadEncodedTile.3tiff;/usr/local/share/man/man3/TIFFReadRawStrip.3tiff;/usr/local/share/man/man3/TIFFReadRawTile.3tiff;/usr/local/share/man/man3/TIFFReadRGBAImage.3tiff;/usr/local/share/man/man3/TIFFReadRGBAStrip.3tiff;/usr/local/share/man/man3/TIFFReadRGBATile.3tiff;/usr/local/share/man/man3/TIFFReadScanline.3tiff;/usr/local/share/man/man3/TIFFReadTile.3tiff;/usr/local/share/man/man3/TIFFRGBAImage.3tiff;/usr/local/share/man/man3/TIFFSetDirectory.3tiff;/usr/local/share/man/man3/TIFFSetField.3tiff;/usr/local/share/man/man3/TIFFsize.3tiff;/usr/local/share/man/man3/TIFFstrip.3tiff;/usr/local/share/man/man3/TIFFswab.3tiff;/usr/local/share/man/man3/TIFFtile.3tiff;/usr/local/share/man/man3/TIFFWarning.3tiff;/usr/local/share/man/man3/TIFFWriteDirectory.3tiff;/usr/local/share/man/man3/TIFFWriteEncodedStrip.3tiff;/usr/local/share/man/man3/TIFFWriteEncodedTile.3tiff;/usr/local/share/man/man3/TIFFWriteRawStrip.3tiff;/usr/local/share/man/man3/TIFFWriteRawTile.3tiff;/usr/local/share/man/man3/TIFFWriteScanline.3tiff;/usr/local/share/man/man3/TIFFWriteTile.3tiff")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/share/man/man3" TYPE FILE FILES
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/libtiff.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFbuffer.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFClose.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFcodec.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFcolor.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFDataWidth.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFError.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFFieldDataType.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFFieldName.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFFieldPassCount.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFFieldReadCount.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFFieldTag.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFFieldWriteCount.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFFlush.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFGetField.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFmemory.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFOpen.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFPrintDirectory.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFquery.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFReadDirectory.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFReadEncodedStrip.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFReadEncodedTile.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFReadRawStrip.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFReadRawTile.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFReadRGBAImage.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFReadRGBAStrip.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFReadRGBATile.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFReadScanline.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFReadTile.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFRGBAImage.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFSetDirectory.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFSetField.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFsize.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFstrip.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFswab.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFtile.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFWarning.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFWriteDirectory.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFWriteEncodedStrip.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFWriteEncodedTile.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFWriteRawStrip.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFWriteRawTile.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFWriteScanline.3tiff"
    "/Users/andreas/Moln/GitHub/rcell2/src/tiff410/man/TIFFWriteTile.3tiff"
    )
endif()


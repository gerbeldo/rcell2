# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.18.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.18.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/andreas/Moln/GitHub/rcell2/src/tiff410

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/andreas/Moln/GitHub/rcell2/src/tiff410

# Include any dependencies generated for this target.
include test/CMakeFiles/raw_decode.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/raw_decode.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/raw_decode.dir/flags.make

test/CMakeFiles/raw_decode.dir/raw_decode.c.o: test/CMakeFiles/raw_decode.dir/flags.make
test/CMakeFiles/raw_decode.dir/raw_decode.c.o: test/raw_decode.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andreas/Moln/GitHub/rcell2/src/tiff410/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object test/CMakeFiles/raw_decode.dir/raw_decode.c.o"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/raw_decode.dir/raw_decode.c.o -c /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/raw_decode.c

test/CMakeFiles/raw_decode.dir/raw_decode.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/raw_decode.dir/raw_decode.c.i"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/raw_decode.c > CMakeFiles/raw_decode.dir/raw_decode.c.i

test/CMakeFiles/raw_decode.dir/raw_decode.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/raw_decode.dir/raw_decode.c.s"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/raw_decode.c -o CMakeFiles/raw_decode.dir/raw_decode.c.s

# Object files for target raw_decode
raw_decode_OBJECTS = \
"CMakeFiles/raw_decode.dir/raw_decode.c.o"

# External object files for target raw_decode
raw_decode_EXTERNAL_OBJECTS =

test/raw_decode: test/CMakeFiles/raw_decode.dir/raw_decode.c.o
test/raw_decode: test/CMakeFiles/raw_decode.dir/build.make
test/raw_decode: libtiff/libtiff.5.5.0.dylib
test/raw_decode: port/libport.a
test/raw_decode: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/libm.tbd
test/raw_decode: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/libz.tbd
test/raw_decode: /usr/local/lib/libjpeg.dylib
test/raw_decode: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/liblzma.tbd
test/raw_decode: /usr/local/lib/libwebp.dylib
test/raw_decode: test/CMakeFiles/raw_decode.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/andreas/Moln/GitHub/rcell2/src/tiff410/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable raw_decode"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/raw_decode.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/raw_decode.dir/build: test/raw_decode

.PHONY : test/CMakeFiles/raw_decode.dir/build

test/CMakeFiles/raw_decode.dir/clean:
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && $(CMAKE_COMMAND) -P CMakeFiles/raw_decode.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/raw_decode.dir/clean

test/CMakeFiles/raw_decode.dir/depend:
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andreas/Moln/GitHub/rcell2/src/tiff410 /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test /Users/andreas/Moln/GitHub/rcell2/src/tiff410 /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/CMakeFiles/raw_decode.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/raw_decode.dir/depend


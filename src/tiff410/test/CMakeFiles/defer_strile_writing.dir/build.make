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
include test/CMakeFiles/defer_strile_writing.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/defer_strile_writing.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/defer_strile_writing.dir/flags.make

test/CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.o: test/CMakeFiles/defer_strile_writing.dir/flags.make
test/CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.o: test/defer_strile_writing.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andreas/Moln/GitHub/rcell2/src/tiff410/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object test/CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.o"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.o -c /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/defer_strile_writing.c

test/CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.i"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/defer_strile_writing.c > CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.i

test/CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.s"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/defer_strile_writing.c -o CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.s

# Object files for target defer_strile_writing
defer_strile_writing_OBJECTS = \
"CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.o"

# External object files for target defer_strile_writing
defer_strile_writing_EXTERNAL_OBJECTS =

test/defer_strile_writing: test/CMakeFiles/defer_strile_writing.dir/defer_strile_writing.c.o
test/defer_strile_writing: test/CMakeFiles/defer_strile_writing.dir/build.make
test/defer_strile_writing: libtiff/libtiff.5.5.0.dylib
test/defer_strile_writing: port/libport.a
test/defer_strile_writing: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/libm.tbd
test/defer_strile_writing: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/libz.tbd
test/defer_strile_writing: /usr/local/lib/libjpeg.dylib
test/defer_strile_writing: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/liblzma.tbd
test/defer_strile_writing: /usr/local/lib/libwebp.dylib
test/defer_strile_writing: test/CMakeFiles/defer_strile_writing.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/andreas/Moln/GitHub/rcell2/src/tiff410/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable defer_strile_writing"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/defer_strile_writing.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/defer_strile_writing.dir/build: test/defer_strile_writing

.PHONY : test/CMakeFiles/defer_strile_writing.dir/build

test/CMakeFiles/defer_strile_writing.dir/clean:
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && $(CMAKE_COMMAND) -P CMakeFiles/defer_strile_writing.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/defer_strile_writing.dir/clean

test/CMakeFiles/defer_strile_writing.dir/depend:
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andreas/Moln/GitHub/rcell2/src/tiff410 /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test /Users/andreas/Moln/GitHub/rcell2/src/tiff410 /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/CMakeFiles/defer_strile_writing.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/defer_strile_writing.dir/depend


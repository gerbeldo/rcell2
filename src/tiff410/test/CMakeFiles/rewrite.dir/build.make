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
include test/CMakeFiles/rewrite.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/rewrite.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/rewrite.dir/flags.make

test/CMakeFiles/rewrite.dir/rewrite_tag.c.o: test/CMakeFiles/rewrite.dir/flags.make
test/CMakeFiles/rewrite.dir/rewrite_tag.c.o: test/rewrite_tag.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andreas/Moln/GitHub/rcell2/src/tiff410/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object test/CMakeFiles/rewrite.dir/rewrite_tag.c.o"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rewrite.dir/rewrite_tag.c.o -c /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/rewrite_tag.c

test/CMakeFiles/rewrite.dir/rewrite_tag.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rewrite.dir/rewrite_tag.c.i"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/rewrite_tag.c > CMakeFiles/rewrite.dir/rewrite_tag.c.i

test/CMakeFiles/rewrite.dir/rewrite_tag.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rewrite.dir/rewrite_tag.c.s"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/rewrite_tag.c -o CMakeFiles/rewrite.dir/rewrite_tag.c.s

# Object files for target rewrite
rewrite_OBJECTS = \
"CMakeFiles/rewrite.dir/rewrite_tag.c.o"

# External object files for target rewrite
rewrite_EXTERNAL_OBJECTS =

test/rewrite: test/CMakeFiles/rewrite.dir/rewrite_tag.c.o
test/rewrite: test/CMakeFiles/rewrite.dir/build.make
test/rewrite: libtiff/libtiff.5.5.0.dylib
test/rewrite: port/libport.a
test/rewrite: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/libm.tbd
test/rewrite: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/libz.tbd
test/rewrite: /usr/local/lib/libjpeg.dylib
test/rewrite: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/liblzma.tbd
test/rewrite: /usr/local/lib/libwebp.dylib
test/rewrite: test/CMakeFiles/rewrite.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/andreas/Moln/GitHub/rcell2/src/tiff410/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable rewrite"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rewrite.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/rewrite.dir/build: test/rewrite

.PHONY : test/CMakeFiles/rewrite.dir/build

test/CMakeFiles/rewrite.dir/clean:
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test && $(CMAKE_COMMAND) -P CMakeFiles/rewrite.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/rewrite.dir/clean

test/CMakeFiles/rewrite.dir/depend:
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andreas/Moln/GitHub/rcell2/src/tiff410 /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test /Users/andreas/Moln/GitHub/rcell2/src/tiff410 /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test /Users/andreas/Moln/GitHub/rcell2/src/tiff410/test/CMakeFiles/rewrite.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/rewrite.dir/depend


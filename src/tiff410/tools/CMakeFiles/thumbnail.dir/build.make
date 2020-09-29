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
include tools/CMakeFiles/thumbnail.dir/depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/thumbnail.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/thumbnail.dir/flags.make

tools/CMakeFiles/thumbnail.dir/thumbnail.c.o: tools/CMakeFiles/thumbnail.dir/flags.make
tools/CMakeFiles/thumbnail.dir/thumbnail.c.o: tools/thumbnail.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andreas/Moln/GitHub/rcell2/src/tiff410/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tools/CMakeFiles/thumbnail.dir/thumbnail.c.o"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/thumbnail.dir/thumbnail.c.o -c /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools/thumbnail.c

tools/CMakeFiles/thumbnail.dir/thumbnail.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/thumbnail.dir/thumbnail.c.i"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools/thumbnail.c > CMakeFiles/thumbnail.dir/thumbnail.c.i

tools/CMakeFiles/thumbnail.dir/thumbnail.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/thumbnail.dir/thumbnail.c.s"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools/thumbnail.c -o CMakeFiles/thumbnail.dir/thumbnail.c.s

# Object files for target thumbnail
thumbnail_OBJECTS = \
"CMakeFiles/thumbnail.dir/thumbnail.c.o"

# External object files for target thumbnail
thumbnail_EXTERNAL_OBJECTS =

tools/thumbnail: tools/CMakeFiles/thumbnail.dir/thumbnail.c.o
tools/thumbnail: tools/CMakeFiles/thumbnail.dir/build.make
tools/thumbnail: libtiff/libtiff.5.5.0.dylib
tools/thumbnail: port/libport.a
tools/thumbnail: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/libm.tbd
tools/thumbnail: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/libz.tbd
tools/thumbnail: /usr/local/lib/libjpeg.dylib
tools/thumbnail: /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib/liblzma.tbd
tools/thumbnail: /usr/local/lib/libwebp.dylib
tools/thumbnail: tools/CMakeFiles/thumbnail.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/andreas/Moln/GitHub/rcell2/src/tiff410/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable thumbnail"
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/thumbnail.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/thumbnail.dir/build: tools/thumbnail

.PHONY : tools/CMakeFiles/thumbnail.dir/build

tools/CMakeFiles/thumbnail.dir/clean:
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools && $(CMAKE_COMMAND) -P CMakeFiles/thumbnail.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/thumbnail.dir/clean

tools/CMakeFiles/thumbnail.dir/depend:
	cd /Users/andreas/Moln/GitHub/rcell2/src/tiff410 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andreas/Moln/GitHub/rcell2/src/tiff410 /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools /Users/andreas/Moln/GitHub/rcell2/src/tiff410 /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools /Users/andreas/Moln/GitHub/rcell2/src/tiff410/tools/CMakeFiles/thumbnail.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/CMakeFiles/thumbnail.dir/depend


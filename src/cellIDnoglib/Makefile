# tiflib = tiff

objects = cell.o segment.o tif.o nums.o date_and_time.o fit.o fft.o fft_stats.o split_and_overlap.o contiguous.o fl_dist.o align_image.o flatten.o

# -Wall for all compiler warnings messages
CFLAGS = -Wall
CLIBS = -I../tiff410/libtiff/ -L../tiff410/r_build/libtiff/ -ltiff -lm

# -I <include directory>
# -L <library directory>
# -l <library name>

# The include directory will be location of the header files. 
# The library directory will be the location of the library (.a or .so)
# and the library name will be the name of the library file, without the leading 'lib' prefix or its extension (i.e. -lsal rather than -l libsal.a ).

cell : $(objects)
	gcc -o cell $(CFLAGS) $(CLIBS) $(objects)

#cell : $(objects)
#	gcc -o cell $(CFLAGS) -lm -l$(tiflib) $(objects)

cell.o: segment.h tif_routines.h date_and_time.h nums.h point.h image_type.h align_image.h split_and_overlap.h parameters.h

tif.o : tif_routines.h

segment.o: segment.h nums.h fit.h tif_routines.h fft_stats.h point.h image_type.h split_and_overlap.h contiguous.h fl_dist.h parameters.h flatten.h

contiguous.o: contiguous.h

nums.o: nums.h tif_routines.h

date_and_time.o: date_and_time.h

fit.o: fit.h

fft.o: fft.h complex.h

fft_stats.o: segment.h fft.h fft_stats.h point.h complex.h

split_and_overlap.o: split_and_overlap.h contiguous.h

fl_dist.o: fl_dist.h contiguous.h

align_image.o: align_image.h

flatten.o: flatten.h

clean:
	rm cell $(objects)


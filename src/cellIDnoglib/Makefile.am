bin_PROGRAMS = cell
cell_SOURCES = cell.c align_image.c contiguous.c date_and_time.c fft.c fft_stats.c fit.c flatten.c fl_dist.c nums.c oif.c segment.c split_and_overlap.c tif.c

# http://web.archive.org/web/20191127110840/http://smalltalk.gnu.org:80/blog/bonzinip/all-you-should-really-know-about-autoconf-and-automake
# http://smalltalk.gnu.org/blog/bonzinip/all-you-should-really-know-about-autoconf-and-automake

# AM_CFLAGS = $(libtiff_CFLAGS) $(libm_CFLAGS)
# LIBS += $(libtiff_LIBS) $(libm_LIBS)
AM_CFLAGS = -I../tiff410/r_build/libtiff $(libm_CFLAGS)
LIBS += -L../tiff410/r_build/libtiff -ltiff -ljpeg -llzma -lz $(libm_LIBS)

#################################################
##### HELPFUL MAKEFILE[am] STUFF - NOT RUN ######
#################################################

# add a link to a library in autoconf configure script / makefile
# https://stackoverflow.com/questions/2057472/howto-add-a-link-to-a-library-in-autoconf-configure-script-makefile
# AM_LDFLAGS = -ltiff

# additional include paths necessary to compile the C++ library
# http://www.bioinf.uni-freiburg.de/~mmann/HowTo/automake.html#extLibCheckLink
# AM_CFLAGS = -I$(top_srcdir)/src @AM_CFLAGS@

# Makevars de R (for reference)
## # Include de archivos ".h"
## # apparently unnecesary
## PKG_CPPFLAGS= -I./tiff410/libtiff
## # Links a archivos ".so" (las libraries)
## PKG_LIBS= -L./tiff410/r_build/libtiff -ltiff -ljpeg -llzma -lz
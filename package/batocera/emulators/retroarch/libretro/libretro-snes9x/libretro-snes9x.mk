################################################################################
#
# SNES9X
#
################################################################################
# Version.: Commits on Jan 07, 2020
LIBRETRO_SNES9X_VERSION = 04692e1ee45cc647423774ee17c63208c2713638
LIBRETRO_SNES9X_SITE = $(call github,snes9xgit,snes9x,$(LIBRETRO_SNES9X_VERSION))
LIBRETRO_SNES9X_LICENSE = Non-commercial

define LIBRETRO_SNES9X_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		-C $(@D)/libretro -f Makefile platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_SNES9X_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/libretro/snes9x_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/snes9x_libretro.so
endef

$(eval $(generic-package))

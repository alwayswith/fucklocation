#THEOS_DEVICE_IP=



include $(THEOS)/makefiles/common.mk



TWEAK_NAME = FuckLocation
FuckLocation_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 oasys"

all: openrtm_python

VERSION     = 1.1.0
TARBALL     = build/OpenRTM-aist-$(VERSION).tar.gz
TARBALL_URL = \
http://www.openrtm.org/pub/OpenRTM-aist/python/$(VERSION)/OpenRTM-aist-Python-$(VERSION)-RC1.tar.gz
UNPACK_CMD  = tar xzf
SOURCE_DIR  = build/OpenRTM-aist-Python-$(VERSION)
TARBALL_PATCH =


MD5SUM_FILE = OpenRTM-aist-Python-$(VERSION)-RC1.tar.gz.md5sum

INSTALL_DIR = install

PYTHON_BUILD_FLAGS = \
	--debug
PYTHON_INSTALL_FLAGS = \
	--prefix=`rospack find openrtm_python`/$(INSTALL_DIR)/

include $(shell rospack find mk)/download_unpack_build.mk

openrtm_python: $(INSTALL_DIR)/installed


$(INSTALL_DIR)/installed: $(SOURCE_DIR)/unpacked
	cd $(SOURCE_DIR)	  			\
	&& python setup.py build $(PYTHON_BUILD_FLAGS)	\
	&& python setup.py install $(PYTHON_INSTALL_FLAGS)
	touch $(INSTALL_DIR)/installed

clean:
	rm -rf $(SOURCE_DIR) $(INSTALL_DIR)

wipe: clean
	rm -rf build

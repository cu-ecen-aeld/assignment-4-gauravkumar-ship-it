
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = fa804e2709474bf25a8f492c7dd7e1e89c8dec3f
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-gauravkumar-ship-it.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app build 
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS

	$(INSTALL) -d $(TARGET_DIR)/home

	$(INSTALL) -m 0755 $(@D)/finder-app/writer \
		$(TARGET_DIR)/home/writer

	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh \
		$(TARGET_DIR)/home/finder.sh

	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf
	$(INSTALL) -m 0755 $(@D)/conf/* \
		$(TARGET_DIR)/etc/finder-app/conf/

	$(INSTALL) -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 \
		$(@D)/assignment-autotest/test/assignment4-buildroot/* \
		$(TARGET_DIR)/usr/bin

		$(INSTALL) -d $(TARGET_DIR)/usr/bin

	$(INSTALL) -m 0755 $(@D)/finder-app/writer \
			$(TARGET_DIR)/usr/bin/writer

	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh \
			$(TARGET_DIR)/usr/bin/finder.sh

endef

$(eval $(generic-package))



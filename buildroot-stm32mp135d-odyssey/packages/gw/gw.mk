################################################################################
#
# gw package
#
################################################################################

GW_VERSION = 1.0
GW_SITE = $(BR2_EXTERNAL_STM32MP135D_ODYSSEY_PATH)/packages/gw/src
#../buildroot-stm32mp135d-odyssey/packages/gw/src
# package/gw/src
GW_SITE_METHOD = local
# Other methods like git,wget,scp,file etc. are also available.

define GW_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" -C $(@D)
#    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

define GW_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/gw  $(TARGET_DIR)/usr/bin
    $(INSTALL) -D -m 0644 $(@D)/gw.cfg  $(TARGET_DIR)/root
endef

$(eval $(generic-package))

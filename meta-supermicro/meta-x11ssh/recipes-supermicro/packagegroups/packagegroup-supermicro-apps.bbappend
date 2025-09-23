# Remove phosphor state manager
# https://github.com/openbmc/phosphor-state-manager/issues/20
RDEPENDS:${PN}-chassis:remove = "phosphor-state-manager"

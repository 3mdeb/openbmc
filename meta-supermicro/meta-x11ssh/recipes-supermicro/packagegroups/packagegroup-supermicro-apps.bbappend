# Remove x86-power-controll
# https://github.com/openbmc/phosphor-state-manager/issues/20
RDEPENDS:${PN}-chassis:remove = "x86-power-control"

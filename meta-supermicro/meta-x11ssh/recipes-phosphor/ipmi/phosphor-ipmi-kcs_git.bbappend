# meta-supermicro/meta-x11ssh/recipes-phosphor/ipmi/phosphor-ipmi-kcs_git.bbappend

# Override the channel configuration
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Override KCS_DEVICE for X11SSH platform
KCS_DEVICE = "ipmi-kcs1"

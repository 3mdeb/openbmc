SUMMARY = "Phosphor LED Group Management for Supermicro X11"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${PHOSPHORBASE}/COPYING.apache-2.0;md5=34400b68072d710fecd0a2940a0d1658"
PR = "r1"

inherit native
inherit obmc-phosphor-utils

PROVIDES += "virtual/phosphor-led-manager-config-native"

SRC_URI += "file://led.yaml"
S = "${WORKDIR}"

# Overwrites the default led.yaml
do_install() {
    SRC=${S}
    DEST=${D}${datadir}/phosphor-led-manager
    install -D ${SRC}/led.yaml ${DEST}/led.yaml
}

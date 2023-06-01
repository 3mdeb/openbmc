
FILESEXTRAPATHS:append := "${THISDIR}/files:"

inherit systemd
inherit obmc-phosphor-systemd

S = "${WORKDIR}/"

SRC_URI = "file://poweroff.sh \
           file://poweron.sh \
           file://host-poweroff.service \
           file://host-poweron.service"

DEPENDS = "systemd"
RDEPENDS:${PN} = "bash"

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "host-poweron.service host-poweroff.service"

do_install() {
    install -d ${D}/usr/sbin
    install -m 0755 ${S}poweroff.sh ${D}/${sbindir}/
    install -m 0755 ${S}poweron.sh ${D}/${sbindir}/
}

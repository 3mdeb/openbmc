SUMMARY = "Supermicro X11SSH board wiring"
DESCRIPTION = "Board wiring information for the Supermicro X11SSH system."
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
PR = "r1"

inherit allarch
inherit setuptools3
inherit python3native

PROVIDES += "virtual/obmc-inventory-data"
RPROVIDES_${PN} += "virtual-obmc-inventory-data"

DEPENDS += "python3"

S = "${WORKDIR}"
SRC_URI += "file://supermicro-x11ssh.py"

do_make_setup() {
        cp ${S}/supermicro-x11ssh.py \
                ${S}/obmc_system_config.py
        cat <<EOF > ${S}/setup.py
from distutils.core import setup

setup(name='${BPN}',
    version='${PR}',
    py_modules=['obmc_system_config'],
    )
EOF
}

addtask make_setup after do_patch before do_configure

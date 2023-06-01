SUMMARY = "Supermicro X11 board wiring"
DESCRIPTION = "Board wiring information for the Supermicro X11 system."
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${PHOSPHORBASE}/COPYING.apache-2.0;md5=34400b68072d710fecd0a2940a0d1658"
PR = "r1"

inherit allarch
inherit setuptools
inherit pythonnative

PROVIDES += "virtual/obmc-inventory-data"
RPROVIDES_${PN} += "virtual-obmc-inventory-data"

DEPENDS += "python"

S = "${WORKDIR}"
SRC_URI += "file://supermicro-x11.py"

do_make_setup() {
        cp ${S}/supermicro-x11.py \
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

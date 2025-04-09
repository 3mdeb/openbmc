# Include patch
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://0001-bmcweb.service-Fix-WatchdogSec.patch"

#Set default watchdog for 60s
EXTRA_OEMESON += "-Dwatchdog-timeout-seconds=60"

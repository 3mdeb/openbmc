# Remove some features so image fits in available flash size
IMAGE_FEATURES:remove = "obmc-telemetry"
IMAGE_FEATURES:remove = "obmc-devtools"
IMAGE_FEATURES:remove = "obmc-debug-collector"
IMAGE_FEATURES:remove = "obmc-user-mgmt-ldap"
IMAGE_FEATURES:remove = "obmc-user-mgmt"
BMC_IMAGE_BASE_INSTALL:remove = "packagegroup-obmc-apps-extras"

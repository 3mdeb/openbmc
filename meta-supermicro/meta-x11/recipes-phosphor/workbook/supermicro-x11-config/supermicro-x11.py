
## System states
##   state can change to next state in 2 ways:
##   - a process emits a GotoSystemState signal with state name to goto
##   - objects specified in EXIT_STATE_DEPEND have started
SYSTEM_STATES = [
    'BASE_APPS',
    'BMC_STARTING',
    'BMC_READY',
    'HOST_POWERING_ON',
    'HOST_POWERED_ON',
    'HOST_BOOTING',
    'HOST_BOOTED',
    'HOST_POWERED_OFF',
]

EXIT_STATE_DEPEND = {
    'BASE_APPS' : {
        '/xyz/openbmc_project/sensors': 0,
    },
    'BMC_STARTING' : {
        '/xyz/openbmc_project/control/chassis0': 0,
    },
}

FRU_INSTANCES = {}

# I believe these numbers need to match the yaml file used to create the c++ ipmi map.
# the devices have types, but I don't believe that factors in here, I think these are
# just unique IDs.
ID_LOOKUP = {
    'FRU' : {},
    # The number at the end needs to match the FRU ID.
    # https://github.com/openbmc/skeleton/blob/master/pysystemmgr/system_manager.py#L143
    # The paramter for it is of type 'y' (unsigned 8-bit integer) presumably decimal?
    'FRU_STR' : {},
    'SENSOR' : {},
    'GPIO_PRESENT' : {}
}

GPIO_CONFIG = {}

# We configure the power button as an input to be able to tell when it's
# pressed. However, to turn on the host ourselves, we need to change the
# direction to out and drive the pin low (essentially pretending we're
# pressing the button).
GPIO_CONFIG['POWER_BUTTON'] = { 'gpio_pin': 'C1', 'direction': 'both' }
GPIO_CONFIG['RESET_BUTTON'] = { 'gpio_pin': 'E2', 'direction': 'both' }

HWMON_CONFIG = {}
GPIO_CONFIGS = {}

# Miscellaneous non-poll sensor with system specific properties.
# The sensor id is the same as those defined in ID_LOOKUP['SENSOR'].
MISC_SENSORS = {}

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4

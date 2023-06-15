#!/bin/bash

# TODO: It would be good to reuse the GPIO_CONFIG definition here
GPIO_BASE=$(cat /sys/class/gpio/gpiochip*/base)
GPIO_NUM=$(($GPIO_BASE + 17))

if [ ! -d "/sys/class/gpio/gpio${GPIO_NUM}" ]; then
  echo ${GPIO_NUM} > /sys/class/gpio/export
fi
echo 1 > /sys/class/gpio/gpio${GPIO_NUM}/active_low

echo high > /sys/class/gpio/gpio${GPIO_NUM}/direction
echo 1 > /sys/class/gpio/gpio${GPIO_NUM}/value
sleep 1
echo 0 > /sys/class/gpio/gpio${GPIO_NUM}/value

# Reset to input
echo in > /sys/class/gpio/gpio${GPIO_NUM}/direction

exit 0;

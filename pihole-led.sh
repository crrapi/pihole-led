#!/bin/bash
echo none | sudo tee /sys/class/leds/led0/trigger
echo 1 | sudo tee /sys/class/leds/led0/brightness

tail -f /var/log/pihole.log | while read INPUT
do
   if [[ "$INPUT" == *"/etc/pihole/gravity.list"* ]]; then
       echo 0 | sudo tee /sys/class/leds/led0/brightness
       sleep 0.2
       echo 1 | sudo tee /sys/class/leds/led0/brightness
       sleep 0.2
    fi
done

#!/bin/bash

read -p "Enter name (Hyper, QC, Speaker) : " name


var=$(wpctl status | sed -e '1,/─ Sinks:/d' -e '/─ Sources:/,$d' | grep $name | awk '{print $2}')

wpctl set-default $var

#!/bin/sh
killall picom 

cp picom.conf ~/.config/picom/picom.conf

sleep 0.1

picom --config ~/.config/picom/picom.conf & 

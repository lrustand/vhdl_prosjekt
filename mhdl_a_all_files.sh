#!/bin/sh

ghdl -a *.vhd
ghdl -e $1

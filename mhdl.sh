#!/bin/sh

ghdl -a --ieee=synopsys *.vhd
ghdl -e $1
ghdl -a tb_files/$1_tb.vhd
ghdl -e $1_tb

ghdl -r $1_tb --stop-time=$2ns --vcd=$1.vcd
open $1.vcd
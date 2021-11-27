#!/bin/sh

ghdl -e --ieee=synopsys $1
ghdl -a --ieee=synopsys tb_files/$1_tb.vhd
ghdl -e --ieee=synopsys $1_tb

ghdl -r $1_tb --stop-time=$2ns --vcd=$1.vcd
open $1.vcd
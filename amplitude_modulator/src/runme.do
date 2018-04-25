# (c) Aldec, Inc.
# All rights reserved.
#
# Last modified: $Date: 2010-02-23 14:37:09 +0100 (Tue, 23 Feb 2010) $
# $Revision: 135800 $

# set project working directory
cd $aldec/examples/vhdl/amplitude_modulator

# load procedures
source $aldec/examples/commonscripts/procedures.do

# create project library and clear its contents
createWorklib amplitude_modulator
adel -all

# compile project's source files
acom -dbg src/sinegenerator.vhd src/cosinegenerator.vhd src/sawgenerator.vhd \
  src/multiplier.vhd src/modulator.vhd

# initialize simulation
asim -O2 -advdataflow modulator

# force signals
do src/force.do

# advance simulation and check signal values periodically
for {set i 0} {$i<10} {incr i} {
    run 10 ns
    echo output = [ examine output ]
}

# uncomment following line to terminate simulation automatically from script
#endsim

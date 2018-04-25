# (c) Aldec, Inc.
# All rights reserved.
#
# Last modified: $Date: 2010-02-23 14:37:09 +0100 (Tue, 23 Feb 2010) $
# $Revision: 135800 $

# load procedures
source $aldec/examples/commonscripts/procedures.do

# open workspace
openWorkspace $aldec/examples/vhdl/amplitude_modulator/amplitude_modulator.rwsp

# activate appropriate design
workspace.design.setactive amplitude_modulator

# set desired workspace/design configuration
workspace.configuration.setactive debug

# compile all designs in the workspace
workspace.compile

# set top-level and initialize the simulator
design.simulation.initialize modulator

do src/force.do

# advance simulation and check signal values periodically
for {set i 0} {$i<10} {incr i} {
    run 10 ns
    echo output = [ examine output ]
}

# uncomment following line to terminate simulation automatically from script
#endsim

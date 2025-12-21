v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -110 -50 -110 -30 {lab=GND}
N -110 -30 -30 -30 {lab=GND}
N -30 -50 -30 -30 {lab=GND}
N -110 -30 -110 -0 {lab=GND}
N -110 -150 -110 -110 {lab=VSS}
N -30 -150 -30 -110 {lab=VDD}
N 130 -90 130 -40 {lab=GND}
N 130 -190 130 -150 {lab=vin}
C {/home/subhransu/gitRepo/test/xschem/inverter.sym} 120 50 0 0 {name=x1}
C {vsource.sym} -110 -80 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -30 -80 0 0 {name=V2 value="CACE\{vdd\}" savecurrent=false}
C {lab_wire.sym} -110 -150 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -30 -150 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {gnd.sym} -110 0 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} 320 -170 0 0 {name=SETUP
simulator=ngspice
only_toplevel=false 
value="
.lib /home/subhransu/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice tt

.include /home/subhransu/gitRepo/test/netlist/schematic/inverter.spice

.temp 130

.option warn=1

.control
dc 0 3
.endc

"}
C {devices/code_shown.sym} 320 -340 0 0 {name=MODELS1 only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {vsource.sym} 130 -120 0 0 {name=V3 value=3 savecurrent=false}
C {gnd.sym} 130 -40 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 130 -190 0 0 {name=p3 sig_type=std_logic lab=vin}

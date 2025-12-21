v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -100 -90 -100 -70 {lab=GND}
N -100 -70 -20 -70 {lab=GND}
N -20 -90 -20 -70 {lab=GND}
N -100 -70 -100 -40 {lab=GND}
N -100 -190 -100 -150 {lab=VSS}
N -20 -190 -20 -150 {lab=VDD}
N 130 -90 130 -40 {lab=GND}
N 130 -190 130 -150 {lab=vin}
C {vsource.sym} -100 -120 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -20 -120 0 0 {name=V2 value="CACE\{vdd\}" savecurrent=false}
C {lab_wire.sym} -100 -190 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -20 -190 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {gnd.sym} -100 -40 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} 320 -170 0 0 {name=SETUP
simulator=ngspice
only_toplevel=false 
value="
.lib /home/subhransu/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice tt

.include /home/subhransu/gitRepo/test/netlist/schematic/inverter.spice

.temp 130

.option warn=1

"}
C {vsource.sym} 130 -120 0 0 {name=V3 value="0 PULSE(0 3.3 0 1n 1n 10n 20n)" savecurrent=false}
C {gnd.sym} 130 -40 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 130 -190 0 0 {name=p3 sig_type=std_logic lab=vin}
C {simulator_commands_shown.sym} 320 60 0 0 {name=CONTROL
simulator=ngspice
only_toplevel=false 
value="
.control

.tran 0.1n 50n

.endc
"}
C {/home/subhransu/gitRepo/test/xschem/inverter.sym} 210 -300 0 0 {name=x1}

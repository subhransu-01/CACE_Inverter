v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -180 -20 -180 0 {lab=GND}
N -180 -0 -100 -0 {lab=GND}
N -100 -20 -100 -0 {lab=GND}
N -180 -0 -180 40 {lab=GND}
N -180 -120 -180 -80 {lab=VSS}
N -100 -120 -100 -80 {lab=VDD}
N 90 10 90 60 {lab=vin}
N 90 120 90 160 {lab=GND}
N 190 -170 270 -170 {lab=VDD}
N 190 -130 270 -130 {lab=VSS}
N -160 -170 -110 -170 {lab=vin}
N 190 -150 360 -150 {lab=Vout}
C {vsource.sym} -180 -50 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -100 -50 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -180 40 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -180 -120 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -100 -120 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {simulator_commands_shown.sym} 190 200 0 0 {name=CONTROL
simulator=ngspice
only_toplevel=false 
value="
.control
dc V3 0 1.8 0.01
set wr_singlescale
wrdata /home/subhransu/gitRepo/test/runs/RUN_2025-12-26_18-47-52/parameters/dc_response/run_6/dc_6.data V(Vin) V(Vout)
.endc
"}
C {vsource.sym} 90 90 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} 90 150 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 90 10 0 0 {name=p3 sig_type=std_logic lab=vin}
C {lab_wire.sym} 270 -170 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 270 -130 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -160 -170 0 0 {name=p7 sig_type=std_logic lab=vin}
C {/home/subhransu/gitRepo/test/xschem/inverter.sym} 40 -150 0 0 {name=x1}
C {lab_wire.sym} 360 -150 0 0 {name=p4 sig_type=std_logic lab=Vout}
C {simulator_commands_shown.sym} 410 70 0 0 {name=SETUP
simulator=ngspice
only_toplevel=false 
value="
*.lib /home/subhransu/share/pdk/gf180mcuD/libs.tech/ngspice/sm141064.ngspice ss
.include /home/subhransu/gitRepo/test/netlist/schematic/inverter.spice
.temp 130
.option SEED=12345
.option warn=1
"}
C {devices/code_shown.sym} 520 -70 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}

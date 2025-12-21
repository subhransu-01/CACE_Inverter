v {xschem version=3.4.7 file_version=1.2}
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
N 360 -150 360 -130 {lab=Vout}
N 190 -150 360 -150 {lab=Vout}
N 360 -70 360 -50 {lab=GND}
C {vsource.sym} -180 -50 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -100 -50 0 0 {name=V2 value=CACE\{vdd\} savecurrent=false}
C {gnd.sym} -180 40 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -180 -120 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -100 -120 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {simulator_commands_shown.sym} 190 200 0 0 {name=CONTROL
simulator=ngspice
only_toplevel=false 
value="
.control
tran 0.1n CACE\{Tmax\}
set wr_singlescale
wrdata CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data V(Vout) V(Vin)
.endc
"}
C {vsource.sym} 90 90 0 0 {name=V3 value=CACE\{vin\} savecurrent=false}
C {gnd.sym} 90 150 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 90 10 0 0 {name=p3 sig_type=std_logic lab=vin}
C {lab_wire.sym} 270 -170 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 270 -130 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -160 -170 0 0 {name=p7 sig_type=std_logic lab=vin}
C {/home/subhransu/gitRepo/test/xschem/inverter.sym} 40 -150 0 0 {name=x1}
C {capa.sym} 360 -100 0 0 {name=C1
m=1
value=CACE\{cl\}
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 360 -150 0 0 {name=p4 sig_type=std_logic lab=Vout}
C {gnd.sym} 360 -50 0 0 {name=l3 lab=GND}
C {simulator_commands_shown.sym} 410 70 0 0 {name=SETUP
simulator=ngspice
only_toplevel=false 
value="
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
.include CACE\{DUT_path\}
.temp CACE\{temperature\}
.option SEED=CACE[CACE\{seed=12345\} + CACE\{iterations=0\}]
.option warn=1
"}

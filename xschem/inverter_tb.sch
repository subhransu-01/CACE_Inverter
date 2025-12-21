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
N 90 10 90 60 {lab=Vin}
N 90 120 90 160 {lab=GND}
N 190 -170 270 -170 {lab=VDD}
N 190 -130 270 -130 {lab=VSS}
N -160 -170 -110 -170 {lab=Vin}
N 190 -150 380 -150 {lab=vout}
C {vsource.sym} -180 -50 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -100 -50 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -180 40 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -180 -120 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -100 -120 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/code_shown.sym} 230 -40 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {simulator_commands_shown.sym} 190 200 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.PARAM PAR_VDD=1.8

** Rise/Fall 10-90%
.MEASURE TRAN tr1090 TRIG v(vout) VAL='0.1*PAR_VDD' RISE=1 TARG v(vout) VAL='0.9*PAR_VDD' RISE=1
.MEASURE TRAN tf9010 TRIG v(vout) VAL='0.9*PAR_VDD' FALL=1 TARG v(vout) VAL='0.1*PAR_VDD' FALL=1

** Delay Rise Fall
.MEASURE TRAN tdrise TRIG v(vin)  VAL='0.5*PAR_VDD' RISE=1 TARG v(vout) VAL='0.5*PAR_VDD' RISE=1
.MEASURE TRAN tdfall TRIG v(vin)  VAL='0.5*PAR_VDD' FALL=1 TARG v(vout) VAL='0.5*PAR_VDD' FALL=1
.control
	   save all

op

    write inverter_tb.raw
    set appendwrite

	TRAN 0.1n 50n
.endc

"}
C {vsource.sym} 90 90 0 0 {name=V3 value="0 PULSE(0 1.8 0 1n 1n 10n 20n)" savecurrent=false}
C {gnd.sym} 90 150 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 90 10 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {opin.sym} 380 -150 0 0 {name=p4 lab=vout}
C {lab_wire.sym} 270 -170 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 270 -130 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {lab_wire.sym} -160 -170 0 0 {name=p7 sig_type=std_logic lab=Vin}
C {inverter.sym} 40 -150 0 0 {name=x1}

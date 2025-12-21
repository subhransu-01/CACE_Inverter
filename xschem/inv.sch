v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 100 10 100 90 {lab=vo}
N 100 -100 100 -50 {lab=#net1}
N 100 -20 160 -20 {lab=#net1}
N 100 -60 160 -60 {lab=#net1}
N 100 150 100 200 {lab=#net2}
N 100 160 150 160 {lab=#net2}
N 100 120 150 120 {lab=#net2}
N 20 -20 60 -20 {lab=#net3}
N 20 -20 20 120 {lab=#net3}
N 20 120 60 120 {lab=#net3}
N 100 50 130 50 {lab=vo}
N -40 50 20 50 {lab=#net3}
N 160 -60 180 -60 {lab=#net1}
N 180 -60 180 -20 {lab=#net1}
N 160 -20 180 -20 {lab=#net1}
N 150 120 210 120 {lab=#net2}
N 210 120 210 160 {lab=#net2}
N 150 160 210 160 {lab=#net2}
N -420 140 -420 160 {lab=GND}
N -420 160 -340 160 {lab=GND}
N -340 140 -340 160 {lab=GND}
N -420 160 -420 200 {lab=GND}
N -420 40 -420 80 {lab=#net2}
N -340 40 -340 80 {lab=#net3}
N -340 40 -30 40 {lab=#net3}
N -40 50 -30 40 {lab=#net3}
N -450 40 -420 40 {lab=#net2}
N -450 40 -450 230 {lab=#net2}
N -450 230 100 230 {lab=#net2}
N 100 200 100 230 {lab=#net2}
N -180 -140 100 -140 {lab=#net1}
N 100 -140 100 -100 {lab=#net1}
C {opin.sym} 130 50 0 0 {name=p1 lab=vo}
C {symbols/nfet_03v3.sym} 80 120 0 0 {name=M3
L=0.28u
W=0.22u
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 80 -20 0 0 {name=M2
L=0.28u
W=0.22u
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {vsource.sym} -420 110 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -340 110 0 0 {name=V2 value=" 0 PULSE(0 1.8 0 1n 1n 10n 20n)" savecurrent=false}
C {gnd.sym} -420 200 0 0 {name=l1 lab=GND}
C {vsource.sym} -180 -110 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} -180 -80 0 0 {name=l2 lab=GND}
C {simulator_commands_shown.sym} 240 -80 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.control

    save all
    op
    tran 0.1n 50n

    plot v(net3) v(vo)
.endc

"}
C {devices/code_shown.sym} 230 -220 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}

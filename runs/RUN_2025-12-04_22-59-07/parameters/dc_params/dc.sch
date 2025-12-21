v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -240 20 -240 50 {lab=GND}
N -240 -80 -240 -40 {lab=xxx}
N -240 -80 -200 -80 {lab=xxx}
C {/home/subhransu/gitRepo/test/xschem/inverter.sym} 60 -20 0 0 {name=x1}
C {vsource.sym} -240 -10 0 0 {name=V1 value=3 savecurrent=false}
C {gnd.sym} -240 50 0 0 {name=l1 lab=GND}
C {lab_wire.sym} -200 -80 0 0 {name=p1 sig_type=std_logic lab=vin}

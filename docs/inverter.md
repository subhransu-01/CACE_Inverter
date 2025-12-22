# inverter

- Description: A simple inverter
- PDK: gf180mcuD

## Authorship

- Designer: Subhransu Das
- Created: Dec 17, 2025
- License: MIT license
- Company: None
- Last modified: None

## Pins

- VDD
  + Description: Positive analog power supply
  + Type: power
  + Direction: inout
  + Vmin: 1.7
  + Vmax: 1.9
- VSS
  + Description: Analog ground
  + Type: ground
  + Direction: inout
- Vin
  + Description: Voltage input
  + Type: signal
  + Direction: input
- Vout
  + Description: Voltage output
  + Type: signal
  + Direction: output

## Default Conditions

- vdd
  + Description: Analog power supply voltage
  + Display: Vdd
  + Unit: V
  + Typical: 1.8
- vin
  + Description: Voltage input
  + Display: Vin
  + Unit: V
  + Typical: 1.8
- cl
  + Description: Output load capacitance
  + Display: CLoad
  + Unit: fF
  + Maximum: 1
- corner
  + Description: Process corner
  + Display: Corner
  + Typical: tt
- temperature
  + Description: Ambient temperature
  + Display: Temp
  + Unit: °C
  + Typical: 27

## Symbol

![Symbol of inverter](inverter_symbol.svg)

## Schematic

![Schematic of inverter](inverter_schematic.svg)

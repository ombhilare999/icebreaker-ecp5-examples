# Blink

- The RGB Pins of `icebreaker++` board are connected in sink mode, so we need to send negated signal to the Pins.
- Verilog code simply uses 27 bit counter to blink the RGB led.

## Steps to program

```
make prog   # If you need to program the FPGA directly
or 
make flash  # If you need to program the SRAM first
```
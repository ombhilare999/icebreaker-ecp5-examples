//////////////////////////////////////////////////////////
//  Name: Omkar Bhilare
//  Email: omkarbhilare45@gmail.com
//  Info: Top Verilog file for PWM generator
//////////////////////////////////////////////////////////

`include "pwm.v"

module top (
    input clk_in,       //12 MHz clock input
    output [2:0] rgb    //rgb output
);

    // Create a 8 bit register
    reg [7:0] counter = 0;

    // Every positive edge increment register by 1
    always @(posedge clk_in) begin
        counter <= counter + 1;
    end

    // Variables for PWM instance
    parameter pwm_bits = 8;
    wire i_reset = 1'b0;
    wire pwm;

    pwm 
    #(
        .pwm_bits (pwm_bits)
    )
    pwm_dut (
        .i_clk (clk_in),
        .i_reset(i_reset),
        .duty_cycle(counter),
        .o_pwm(pwm)
    );

    // Output inverted values of counter onto LEDs
    assign rgb[1] = ~pwm;   //Blue
    assign rgb[0] = ~pwm;   //Green
    assign rgb[2] = ~pwm;   //Red

endmodule

//////////////////////////////////////////////////////////
//  Name: Omkar Bhilare
//  Email: omkarbhilare45@gmail.com
//  Info: Top Verilog file for PWM
//////////////////////////////////////////////////////////

`include "pwm.v"

module top (
    input clk_in,       //12 MHz clock input
    output [2:0] rgb    //rgb output
);

    parameter delay = 300000;     //0.30 Seconds in Binary    
    reg [7:0] counter = 0;       // Create a 8 bit register
    reg [19:0] r_delay = 0;

    // Increment Counter after 0.30 Seconds
    always @(posedge clk_in) begin
        if (r_delay < delay) begin
            r_delay <= r_delay + 1;
        end else begin
            r_delay <= 0;
            counter <= counter + 1;
        end 
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

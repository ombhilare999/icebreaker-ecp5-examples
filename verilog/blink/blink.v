//////////////////////////////////////////////////////////
//  Name: Omkar Bhilare
//  Email: omkarbhilare45@gmail.com
//  Info: RGB blink on icebreaker++ board
//////////////////////////////////////////////////////////

module top (
    input clk_in,       //12 MHz clock input
    output [2:0] rgb    //rgb output
);

    // Create a 27 bit register
    reg [26:0] counter = 0;

    // Every positive edge increment register by 1
    always @(posedge clk_in) begin
        counter <= counter + 1;
    end

    // Output inverted values of counter onto LEDs
    assign rgb[1] = ~counter[20];   //Blue
    assign rgb[0] = ~counter[20];   //Green
    assign rgb[2] = ~counter[20];   //Red

endmodule

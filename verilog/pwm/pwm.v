//////////////////////////////////////////////////////////
//  Name: Omkar Bhilare
//  Email: omkarbhilare45@gmail.com
//  Info: Generalize N bit basic PWM generator Example
//////////////////////////////////////////////////////////

module pwm 
#(
    parameter pwm_bits = 8   
)(
    input i_clk,        // Input Clock
    input i_reset,      // Input Reset 
    input [pwm_bits -1 : 0] duty_cycle, // Duty Cycle Value
    output reg o_pwm        // Output pwm signal
);

    // Register for up counter
    reg [pwm_bits -1 : 0] up_counter;

    // N bit up-counter with synchronus positive edge reset
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset == 1'b1) begin
            up_counter <= 1'b0;
        end else begin
            up_counter <= up_counter + 1'b1;
        end
    end

    always @(posedge i_clk) begin
        //Comparator: Comparing input duty cycle with up counter
        o_pwm = up_counter < (duty_cycle + 1);
    end
endmodule

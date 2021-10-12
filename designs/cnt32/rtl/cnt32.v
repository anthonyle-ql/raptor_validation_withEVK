// simple 32bit counter

module cnt32 (
    clk,
    reset,
    cnt32
);


// MODULE PORT Declarations and Data Types ===============================================

input clk;
input reset;
output [31:0] cnt32;
reg [31:0] cnt32;


// MODULE LOGIC ==========================================================================
always@ (posedge clk or negedge reset)
    if (!reset)
        cnt32 <= 0;
    else
        cnt32 <= cnt32 + 1;


endmodule

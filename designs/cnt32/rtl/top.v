
module top (
    
    // LEDs from constraint file
    red_led,
    green_led,
    blue_led,
    c0,
    c1,
    c2,
    c3
);


output red_led, green_led, blue_led;
output c0, c1, c2, c3;

wire red_led, green_led, blue_led;
wire c0, c1, c2, c3;

wire [31:0] cnt32;

assign red_led = cnt32[26];
assign green_led = cnt32[25];
assign blue_led = cnt32[24];
assign c0 = cnt32[0];
assign c1 = cnt32[1];
assign c2 = cnt32[2];
assign c3 = cnt32[3];



// MODULE INTERNAL Signals ===============================================================

wire                                    Sys_Clk0        ;
wire                                    Sys_Clk0_Rst    ;

wire                                    Sys_Clk1        ;
wire                                    Sys_Clk1_Rst    ;


// MODULE LOGIC ==========================================================================

// Sys_Clk0_Rst provides a reset signal for the other FPGA IP logic
assign RST_IP = Sys_Clk0_Rst;
// Sys_Clk0 provides a clock signal for the other FPGA IP logic
assign CLK_IP = Sys_Clk0;

// we need only the clocks/resets from the cell macro
qlal4s3b_cell_macro u_qlal4s3b_cell_macro (
    // FB Clocks
    .Clk_C16                  ( Sys_Clk0                       ), // output
    .Clk_C16_Rst              ( Sys_Clk0_Rst                   ), // output
    .Clk_C21                  ( Sys_Clk1                       ), // output
    .Clk_C21_Rst              ( Sys_Clk1_Rst                   ), // output
);

cnt32 dut (
        .clk(CLK_IP),
        .reset(1'b1),
        .cnt32(cnt32)
    );

endmodule


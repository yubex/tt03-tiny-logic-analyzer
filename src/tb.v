`default_nettype none
`timescale 1us/1ns

module tb (
    );

	reg clk;
	reg rst;
	reg data_in;
	
    wire [7:0] inputs = {4'b0000, data_in, rst, clk};
    wire [7:0] outputs;
	
	always 
	begin
		clk <= 1'b0;
		# 40;
		clk <= 1'b1;
		# 40;
	end 
	
	initial 
	begin
    $display("Simulation started!");
		rst   	 <= 1'b1;
		data_in  <= 1'b0;
		# 5000;
		rst <= 1'b0;
		# 50000;
		data_in  <= 1'b1;
		# 500000;
		data_in  <= 1'b0;
		# 500000;
		data_in  <= 1'b1;
		# 500000;
		data_in  <= 1'b0;
		# 500000;
		data_in  <= 1'b1;
		# 6100;
        data_in  <= 1'b0;
		# 50000;        
		data_in  <= 1'b1;
		# 500000; 
		data_in  <= 1'b0;
		# 6100;
		data_in  <= 1'b1;
		# 500000;
    $display("Done!");
    $finish ;
	end 

    yubex_tiny_logic_analyzer yubex_tiny_logic_analyzer (
        .io_in (inputs),
        .io_out (outputs)
    );

initial
 begin
    $dumpfile("test.vcd");
    $dumpvars(0,clk,rst,data_in,outputs);
 end



endmodule

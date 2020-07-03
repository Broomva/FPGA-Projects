`timescale 1ns / 1ps
module BtnVuelta(
	input wire clk,
	input wire button,
	output reg pbreg);

	reg[7:0] pbshift;
	wire clk_1ms;
	Tiempo_1ms T1(clk, clk_1ms);
	
	always @(posedge clk_1ms) begin
		pbshift = pbshift << 1;
		pbshift[0] = button;
		if (pbshift == 0)
			pbreg = 0;
		if (pbshift == 8'hFF)
			pbreg = 1;
	end

endmodule

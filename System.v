`timescale 1ns / 1ps
//////this system connects viterbi decoder and convolutional encoder
/////in is the input of convolutional encoder
/////out is the output of viterbi decoder


module System(in,CLK,out1,out2,coded_data_v1,coded_data_v2);
    input wire in,CLK;
    output wire out1,out2;
    output wire [1:0]coded_data_v1;
    output wire [1:0]coded_data_v2;
	
	 Convolutional_Encoder_V1 c_enc_v1(.in(in), .parities(coded_data_v1), .CLK(CLK));
    Convolutional_Encoder_V2 c_enc_v2(.in(in), .parities(coded_data_v2), .CLK(CLK));

    Viterbi_V1 v_dec_v1(.parities(coded_data_v1), .CLK(CLK), .out(out1));
	 Viterbi_V2 v_dec_v2(.parities(coded_data_v2), .CLK(CLK), .out(out2));
	 
	 
endmodule


module test_tb;
	// Inputs
	reg in;
	reg CLK;
	// Outputs
	wire out1,out2;
	wire [1:0]coded_data_v1;
	wire [1:0]coded_data_v2;
	// Instantiate the Unit Under Test (UUT)
	System uut (
		.in(in),
		.CLK(CLK),		
		.out1(out1),
		.out2(out2),
		.coded_data_v1(coded_data_v1),
		.coded_data_v2(coded_data_v2)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		CLK = 0;
	end
	always CLK=#100 ~CLK;
	always@(posedge CLK)
	begin
	in= $random();
	end
endmodule
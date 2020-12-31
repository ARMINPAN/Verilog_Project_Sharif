//////this system connects viterbi decoder and convolutional encoder
/////in is the input of convolutional encoder
/////out is the output of viterbi decoder
module System(in,CLK,out);
    input wire in,CLK;
    output wire out;
    wire [1:0]coded_data;

    Convolutional_Encoder c_enc(.in(in), .parities(coded_data), .CLK(CLK));
    Viterbi_V1 v_dec(.parities(coded_data), .CLK(CLK), .out(out));


endmodule



module System_test();
	// Inputs
	reg in;
	reg CLK;
	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	System uut (
		.in(in),
		.CLK(CLK),		
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		CLK = 0;
	end
	always CLK=#10 ~CLK;
	always@(posedge CLK)
	begin
	in= $random();
	end

endmodule
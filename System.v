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
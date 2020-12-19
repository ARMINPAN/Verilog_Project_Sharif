module Convolutional_Encoder(in,parities,CLK);
    input wire in;
    input wire clock;
    output wire parities[1:0];
    wire memory[2:0];
    reg g1[2:0] = 3'b110;
    reg g2[2:0] = 3'b111;


    shiftRegister3Bit storage(.in(in), .out(memory), .CLK(CLK));
    assign parrities[0] = g1[0] * memory[2] + g1[1] * memory[1] + g1[2] * memory[0];
    assign parrities[1] = g2[0] * memory[2] + g2[1] * memory[1] + g2[2] * memory[0];
endmodule


////////////////shiftregister
module shiftRegister3Bit(in,out,CLK);
    input wire in,CLK;
    output reg out[2:0];

    always@(posedge CLK)
        begin
            out[0] <= in;
            {out[2],out[1]} <= {out[1],out[0]};     
        end
endmodule

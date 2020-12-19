//a convolutional encoder (r=2 and code rate = 1/2)
module Convolutional_Encoder(in,parities,CLK);
    input wire in;
    input wire CLK;
    output wire [1:0]parities;
    wire [2:0]memmoryCells;
    reg [2:0]g1 = 3'b110;
    reg [2:0]g2 = 3'b111;


    shiftRegister3Bit storage(.in(in), .out(memmoryCells), .CLK(CLK));
    assign parities[0] = (g1[0] * memmoryCells[2] + g1[1] * memmoryCells[1] + g1[2] * memmoryCells[0])%2;
    assign parities[1] = (g2[0] * memmoryCells[2] + g2[1] * memmoryCells[1] + g2[2] * memmoryCells[0])%2;
endmodule


//a shift register for saving constraint bits (here K=3)

module shiftRegister3Bit(in,out,CLK);
    input wire in,CLK;
    output reg [2:0]out = 3'b0;

    always@(posedge CLK)
        begin
            out[0] <= in;
            {out[2],out[1]} <= {out[1],out[0]};     
        end
endmodule

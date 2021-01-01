//a viterbi decoder (r=2 and code rate = 1/2 )
//parities come from the convolutional encoder
//outputs are the inputs of convolutional encoder
//the first state is 00
module Viterbi_V1(parities,CLK,out);
    input wire [1:0]parities;
    input wire CLK;
    output reg out;
    reg [1:0]state = 2'b00;


    always@(posedge CLK)
        begin
            if(parities == 2'b00 && state == 2'b00) 
                begin
                    out = 1'b0;
                end
            else if(parities == 2'b11 && state == 2'b00)
                begin
                    out = 1'b1;
                    state = 2'b01;
                end
            else if(parities == 2'b10 && state == 2'b01)
                begin
                    out = 1'b0;
                    state = 2'b10;
                end
            else if(parities == 2'b01 && state == 2'b01)
                begin
                    out = 1'b1;
                    state = 2'b11;
                end
            else if(parities == 2'b01 && state == 2'b11)
                begin
                    out = 1'b0;
                    state = 2'b10;
                end
            else if(parities == 2'b10 && state == 2'b11)
                begin
                    out = 1'b1;
                    state = 2'b11;
                end
            else if(parities == 2'b11 && state == 2'b10)
                begin
                    out = 1'b0;
                    state = 2'b00;
                end
            else if(parities == 2'b00 && state == 2'b10)
                begin
                    out = 1'b1;
                    state = 2'b01;
                end
        end
endmodule
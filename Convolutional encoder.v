//a convolutional encoder (r=2 and code rate = 1/2)
module Convolutional_Encoder(in,parities,CLK);
    input wire in;
    input wire CLK;
    output reg [1:0]parities;
    wire [2:0]memmoryCells;
	 reg [1:0]state=2'b00; 
	 
	 
	always@(CLK)
	begin
				if(in == 1'b0 && state == 2'b00) 
                begin
                    parities = 2'b00;
						  state = 2'b00;
                end
            else if(in == 1'b1 && state == 2'b00)
                begin
                    parities = 2'b11;
                    state = 2'b01;
                end
            else if(in == 1'b0 && state == 2'b01)
                begin
                    parities = 2'b10;
                    state = 2'b10;
                end
            else if(in == 1'b1 && state == 2'b01)
                begin
                    parities = 2'b01;
                    state = 2'b11;
                end
            else if(in == 1'b0 && state == 2'b11)
                begin
                    parities = 2'b01;
                    state = 2'b10;
                end
            else if(in == 1'b1 && state == 2'b11)
                begin
                    parities = 2'b10;
                    state = 2'b11;
                end
            else if(in == 1'b0 && state == 2'b10)
                begin
                    parities = 2'b11;
                    state = 2'b00;
                end
            else if(in == 1'b1 && state == 2'b10)
                begin
                    parities = 2'b00;
                    state = 2'b01;
                end
	end
endmodule

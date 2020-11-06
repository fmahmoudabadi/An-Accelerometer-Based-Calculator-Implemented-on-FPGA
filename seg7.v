module seg7(

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	input                      clk,
	input                      nothing,
   input 		     [11:0]		display,
	input                      neg
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

  reg [31:0] out; 
  reg [28:0] count, count_c;  


//=======================================================
//  Structural coding
//=======================================================

always @(count) begin

		count_c = count + 29'h000_0001;
		if (count == 29'd022_000_000) begin
		count_c = 29'h0000_0000;
		end

end

always @ (posedge clk) begin
	count <= #1 count_c;
end

always @(*) begin
	 
	 case (display [3:0])  
	 4'b0000: begin 
	 out [7:0] = 8'b11000000; 
	 end 
	 4'b0001: begin 
	 out [7:0] = 8'b11111001; 
	 end 
	 4'b0010: begin 
	 out [7:0] = 8'b10100100; 
	 end 
	 4'b0011: begin 
	 out [7:0] = 8'b10110000; 
	 end 
	 
	 4'b0100: begin 
	 out [7:0] = 8'b10011001; 
	 end 
	 4'b0101: begin 
	 out [7:0]= 8'b10010010; 
	 end 
	 4'b0110: begin 
	 out [7:0]= 8'b10000010; 
	 end 
	 4'b0111: begin 
	 out [7:0]= 8'b11111000; 
	 end
	 
	 4'b1000: begin 
	 out [7:0]= 8'b10000000; 
	 end 
	 4'b1001: begin 
	 out [7:0]= 8'b10010000; 
	 end 
	 4'b1010: begin 
	 out [7:0]= 8'b10001000; 
	 end 
	 4'b1011: begin 
	 out [7:0]= 8'b10000011; 
	 end
	 
	 4'b1100: begin 
	 out [7:0]= 8'b11000110; 
	 end 
	 4'b1101: begin 
	 out [7:0]= 8'b10100001; 
	 end 
	 4'b1110: begin 
	 out [7:0]= 8'b10000110; 
	 end 
	 4'b1111: begin 
	 out [7:0]= 8'b10001110; 
	 end
	 default: begin 
	 out [7:0]= 8'b11111111; 
	 end 
	 endcase 
	 
	 
	 case (display [7:4])  
	 4'b0000: begin 
	 out [15:8]= 8'b11000000; 
	 end 
	 4'b0001: begin 
	 out [15:8]= 8'b11111001; 
	 end 
	 4'b0010: begin 
	 out [15:8]= 8'b10100100; 
	 end 
	 4'b0011: begin 
	 out [15:8]= 8'b10110000; 
	 end 
	 
	 4'b0100: begin 
	 out [15:8]= 8'b10011001; 
	 end 
	 4'b0101: begin 
	 out [15:8]= 8'b10010010; 
	 end 
	 4'b0110: begin 
	 out [15:8]= 8'b10000010; 
	 end 
	 4'b0111: begin 
	 out [15:8]= 8'b11111000; 
	 end
	 
	 4'b1000: begin 
	 out [15:8]= 8'b10000000; 
	 end 
	 4'b1001: begin 
	 out [15:8]= 8'b10010000; 
	 end 
	 4'b1010: begin 
	 out [15:8]= 8'b10001000; 
	 end 
	 4'b1011: begin 
	 out [15:8]= 8'b10000011; 
	 end
	 
	 4'b1100: begin 
	 out [15:8]= 8'b11000110; 
	 end 
	 4'b1101: begin 
	 out [15:8]= 8'b10100001; 
	 end 
	 4'b1110: begin 
	 out [15:8]= 8'b10000110; 
	 end 
	 4'b1111: begin 
	 out [15:8]= 8'b10001110; 
	 end
	 default: begin 
	 out [15:8]= 8'b11111111; 
	 end 
	 endcase 
	 
	 
	 case (display [11:8])  
	 4'b0000: begin 
	 out [23:16]= 8'b11000000; 
	 end 
	 4'b0001: begin 
	 out [23:16]= 8'b11111001; 
	 end 
	 4'b0010: begin 
	 out [23:16]= 8'b10100100; 
	 end 
	 4'b0011: begin 
	 out [23:16]= 8'b10110000; 
	 end 
	 
	 4'b0100: begin 
	 out [23:16]= 8'b10011001; 
	 end 
	 4'b0101: begin 
	 out [23:16]= 8'b10010010; 
	 end 
	 4'b0110: begin 
	 out [23:16]= 8'b10000010; 
	 end 
	 4'b0111: begin 
	 out [23:16]= 8'b11111000; 
	 end
	 
	 4'b1000: begin 
	 out [23:16]= 8'b10000000; 
	 end 
	 4'b1001: begin 
	 out [23:16]= 8'b10010000; 
	 end 
	 4'b1010: begin 
	 out [23:16]= 8'b10001000; 
	 end 
	 4'b1011: begin 
	 out [23:16]= 8'b10000011; 
	 end
	 
	 4'b1100: begin 
	 out [23:16]= 8'b11000110; 
	 end 
	 4'b1101: begin 
	 out [23:16]= 8'b10100001; 
	 end 
	 4'b1110: begin 
	 out [23:16]= 8'b10000110; 
	 end 
	 4'b1111: begin 
	 out [23:16]= 8'b10001110; 
	 end
	 default: begin 
	 out [23:16]= 8'b11111111; 
	 end 
	 endcase 
	 
	 case (neg)
	 1'b1: begin
	 out [31:24]= 8'b10111111;
	 end
	 default: begin 
	 out [31:24]= 8'b11111111; 
	 end 
	 endcase
	
    if (nothing == 1'b1) begin 
	 if (count <= 29'd011_000_000) begin
	 out [7:0] = 8'b1011_1111;
	 out[15:8] = 8'b1011_1111;
	 out[23:16] = 8'b1011_1111; 
	 out[31:24] = 8'b1011_1111;
	 end 
	 else begin
	 out [7:0] = 8'b1111_1111;
	 out[15:8] = 8'b1111_1111;
	 out[23:16] = 8'b1111_1111; 
	 out[31:24] = 8'b1111_1111;
	 end
	 end
 end 

assign HEX0[7:0]=out[7:0];
assign HEX1[7:0]=out[15:8];
assign HEX2[7:0]=out[23:16];
assign HEX3[7:0]=out[31:24];
assign HEX4[7:0]= 8'b11111111;
assign HEX5[7:0]= 8'b11111111;

endmodule

 


module bin2bcd
(
	input wire [9:0] bin,
	output wire [3:0] bcd2,bcd1,bcd0,
	output reg neg
//	output reg [9:0] abs_bin
);

//reg [9:0] rem, ones;
reg [9:0] abs_bin, rem, ones;
reg [3:0] tens, honds;

always @ (*) begin

	if (bin[9] == 1'b1) 
		begin
		abs_bin = (~bin) + 10'b00_0000_0001;
		neg = 1'b1;
		end
	else 
		begin
		abs_bin = bin;
		neg = 1'b0;
		end
		
	if (abs_bin >= 10'd500)
		begin
		honds = 4'h5;
		rem = abs_bin - 10'd500; 
		end 
	else if (abs_bin >= 10'd400 && abs_bin < 10'd500)
	   begin
		honds = 4'h4;
		rem = abs_bin - 10'd400;
		end
	else if (abs_bin >= 10'd300 && abs_bin < 10'd400)
	   begin
		honds = 4'h3;
		rem = abs_bin - 10'd300;
		end
	else if (abs_bin >= 10'd200 && abs_bin < 10'd300)
	   begin
		honds = 4'h2;
		rem = abs_bin - 10'd200;
		end
	else if (abs_bin >= 10'd100 && abs_bin < 10'd200)
	   begin
		honds = 4'h1;
		rem = abs_bin - 10'd100;
		end
	else 
	   begin
		honds = 4'h0;
		rem = abs_bin;
		end
		
	if (rem >= 10'd090)
		begin
		tens = 4'h9;
		ones = rem - 10'd090;
		end
	else if (rem >= 10'd080 && rem < 10'd090)
		begin
		tens = 4'h8;
		ones = rem - 10'd080;
		end
	else if (rem >= 10'd070 && rem < 10'd080)
		begin
		tens = 4'h7;
		ones = rem - 10'd070;
		end
	else if (rem >= 10'd060 && rem < 10'd070)
		begin
		tens = 4'h6;
		ones = rem - 10'd060;
		end
	else if (rem >= 10'd050 && rem < 10'd060)
		begin
		tens = 4'h5;
		ones = rem - 10'd050;
		end
	else if (rem >= 10'd040 && rem < 10'd050)
		begin
		tens = 4'h4;
		ones = rem - 10'd040;
		end
	else if (rem >= 10'd030 && rem < 10'd040)
		begin
		tens = 4'h3;
		ones = rem - 10'd030;
		end
	else if (rem >= 10'd020 && rem < 10'd030)
		begin
		tens = 4'h2;
		ones = rem - 10'd020;
		end
	else if (rem >= 10'd010 && rem < 10'd020)
		begin
		tens = 4'h1;
		ones = rem - 10'd010;
		end
	else 
		begin
		tens = 4'h0;
		ones = rem;
		end
end

assign bcd0 = ones [3:0];
assign bcd1 = tens;
assign bcd2 = honds;

endmodule 
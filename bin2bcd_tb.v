module bin2bcd_tb ();

wire [9:0] bin, abs_bin;
wire [3:0] bcd2,bcd1,bcd0;
wire neg;
reg [9:0] count;

bin2bcd my_bin2bcd (.bin(bin),.bcd2(bcd2), .bcd1(bcd1), .bcd0(bcd0), .neg(neg), .abs_bin(abs_bin));


initial begin       
	count = 10'd500;
   repeat (10) begin   
   #100   
	$display("bin = %d this means: neg = %d, abs_bin = %d, bcd2 = %d, bcd1 = %d, bcd0 = %d", bin, neg, abs_bin, bcd2, bcd1, bcd0);
   count = count - 10'd063;
   end   
	end 

	assign bin = count;
	
endmodule 
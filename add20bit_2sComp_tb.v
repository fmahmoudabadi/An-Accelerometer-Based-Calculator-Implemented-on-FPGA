module add20bit_2sComp_tb;

   reg [19:0] num1;
   reg [19:0] num2;
	integer fd1;
 
	wire [19:0] A;
	wire [19:0] B;
	wire ci=1'b0;
	wire [19:0] calculate_out;
	
   assign A[19:0] = num1;
	assign B[19:0] = num2;
	
   add20bit_2sComp UUT (.A(A),.B(B),.ci(ci),.calculate_out(calculate_out));
	
   initial begin 	
	num1 = 20'b0000_0000_0000_0000_0000;
	num2 = 20'b1111_1111_1110_0000_0000;
	fd1 = $fopen("add20bit_2sComp.txt","w");
	#100;
	num1 = 20'b0000_0000_0000_0000_0000;
	num2 = 20'b0000_0000_0001_1111_1111;
	#100;
	num1 = 20'b1111_1111_1110_0000_0000;
	num2 = 20'b1111_1111_1110_0000_0000;
	#100;
	num1 = 20'b1111_1111_1111_1111_1111;
	num2 = 20'b1111_1111_1111_1111_1111;
	#100;
	num1 = 20'b0000_0000_0001_1111_1111;
	num2 = 20'b0000_0000_0001_1111_1111;
	#100;
	num1 = 20'b0000_0000_0000_1111_1111;
	num2 = 20'b0000_0000_0001_1100_1011;
	#100;
	num1 = 20'b0000_0000_0001_1111_1001;
	num2 = 20'b0000_0000_0001_0111_1110;
	#100;
	num1 = 20'b0000_0000_0001_1110_0011;
	num2 = 20'b1111_1111_1111_1001_0011;
	#100;
	
	$fclose(fd1);	
	end
	
	always @ (num1 or num2) begin
	#10;
	$fwrite(fd1,"%b %b %b\n", num1, num2, calculate_out);
	end

endmodule 
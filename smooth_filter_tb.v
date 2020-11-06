`timescale 1ns / 1ns
module smooth_filter_tb();

integer fd2;
reg clk;
reg reset;
reg [1:0] SW;
reg [15:0] in;
wire [15:0] out;
wire [15:0] r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16;
wire [18:0] count_c, count;
wire en;

smooth_filter my_filter(.clk(clk),.reset(reset),.in(in),.SW(SW),.count_c(count_c),.count(count),
.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11),
.r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.en(en),.out(out));


initial begin

fd2 = $fopen("small_filter2.txt","w");
clk = 1'b1;
reset = 1'b1;
SW = 2'b00;
in = 16'b1111_1110_0000_1100;
#200;
reset = 1'b0;
#100_000_000;

SW[1:0] = 2'b01;
#100_000_000;

SW[1:0] = 2'b10;
#140_000_000;

SW[1:0] = 2'b11;
#60_000_000;
//#600;
//in = 16'd00250;
//#800;
//in = 16'd00050;
//#800;
$fclose(fd2);
$stop;
end

always begin
#20;
clk = ~clk;
end

always begin
#20_000_000;
in = in + 16'd00050;
if (in == 16'd00550) begin
in = 16'b1111_1110_0000_1100;
end
end
 
always @ (*) begin
#3;
//$fwrite(fd2,"data_in = %d, r1= %d, r2 = %d, data_out = %d, SW = %b, en = %d\n",in, r1, r2, out, , SW, en);
$fwrite(fd2,"data_in = %b, data_out = %b, SW = %b, en = %b\n",in, out, SW, en);
end

endmodule 

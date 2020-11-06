module cal(
input clk,
input [1:0] KEY,
input [6:2] SW,
input [15:0] smooth_out,
output [1:0] LEDR,
output reg nothing,
output reg [9:0] BCD_in
);


reg enable1;
reg enable2;
reg state_c, state;
reg [15:0] operand1, operand2;
wire [16:0] num1, num2, num3, num4;
wire [16:0] calculate_out1, calculate_out2;



wire load, reset;
wire reset_edge, load_edge;

assign reset = ~KEY[0];
assign load = ~KEY[1];

edge_detection my_edge1(.clock(clk),.input_signal(reset),.rising_transition(reset_edge));
edge_detection my_edge2(.clock(clk),.input_signal(load),.rising_transition(load_edge));


reg [1:0] LED;
assign LEDR[1:0] = LED[1:0];



always @ (*) begin

state_c = state;
LED = LED;
enable1 = 1'b0;
enable2 = 1'b0;

case (state)
1'b0:begin LED = 2'b01; if (load_edge == 1'b1) begin state_c = 1'b1; enable1 = 1'b1; end end
1'b1:begin LED = 2'b10; if (load_edge == 1'b1) begin state_c = 1'b0; enable2 = 1'b1; end end
endcase

if (reset_edge == 1'b1) begin
state_c = 1'b0;
LED = 2'b01;
end

end

	

always @ (posedge clk) begin
	state <= state_c;
	if (enable1 == 1'b1) begin
		operand1 <= smooth_out;
	end
	if (enable2 == 1'b1) begin
		operand2 <= smooth_out;
   end
end


parameter smooth = 5'b00_001;
parameter operand_1 = 5'b00_010;
parameter operand_2 = 5'b00_100;
parameter add = 5'b01_000;
parameter sub = 5'b10_000;


assign num1 = {operand1[15],operand1};
assign num2 = {operand2[15],operand2};
assign num3 = {operand1[15],operand1};
assign num4 = ~({operand2[15],operand2});

always @ (*) begin

	case (SW[6:2])
	smooth: begin
		BCD_in = smooth_out[9:0];
		nothing = 1'b0;
	end
	operand_1: begin
		BCD_in = operand1[9:0];
		nothing = 1'b0;
	end
	operand_2: begin
		BCD_in = operand2[9:0];
		nothing = 1'b0;
	end
	add: begin
		BCD_in = calculate_out1[9:0];
		nothing = 1'b0;
	end
	sub: begin
		BCD_in = calculate_out2[9:0];
		nothing = 1'b0;
	end
	default: begin
		nothing = 1'b1;
	end
	endcase
end

add17bit_2sComp my_add(.A(num1), .B(num2), .ci(1'b0), .calculate_out(calculate_out1));
add17bit_2sComp my_sub(.A(num3), .B(num4), .ci(1'b1), .calculate_out(calculate_out2));

endmodule 
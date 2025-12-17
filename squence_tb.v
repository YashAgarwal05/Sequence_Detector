module squence_tb();
reg clk,data;
wire [3:0]q;
wire [1:0]newstate,state;
wire out;
sequence uut(.clk(clk),.data(data),.q(q),.state(state),.newstate(newstate),.out(out));
initial clk=0;
always #5 clk=~clk;
initial begin
data=0;
#10 data=1;
#10 data=0;
#10 data=1;
#10 data=1;
#10 data=1;
#10 data=1;
#10 data=0;
#10 data=1;
#10 data=0;
#10 data=0;
#10 data=0;
#10 data=1;
#10 data=1;
#10 data=0;
#10 data=1;
#10 data=0;
#10 data=1;
#10 data=1;
#10 data=0;
#10 $finish;
end
endmodule
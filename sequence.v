module sequence(input clk,input data,output reg [3:0] q,output reg [1:0]state,newstate,
output out);
parameter A =0, B=1 ,C=2 , D=3;
initial begin
q=0;
state=0;
newstate=0;
end

    always@(*)begin
      case(state)
        A:newstate=data?B:A;
        B:newstate=data?C:A;
        C:newstate=data?C:D;
        D:newstate=data?B:A;
      endcase
    end
    always@(posedge clk)begin
        state<=newstate;
     end
     assign out=(newstate==B && state==D);
     always@(*)begin
        if(out==1)
            q=q+1;
      end
endmodule
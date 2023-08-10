module RAM(CLK, nrd, nwr, nCe, addr, data);
input CLK, nrd, nwr, nCe;
input [3:0] addr;

inout [7:0] data;

reg [7:0] dataout;
reg [7:0] rammem[0:8];

always @ (nCe or nwr or nrd)      //asynchronous RAM

begin 
  if(!nrd)
    dataout <= !nCe?rammem[addr]:8'bz;

  else if(!nwr)
    rammem[addr] <= !nCe?data:rammem[addr];
  end
  
assign data = dataout;

endmodule

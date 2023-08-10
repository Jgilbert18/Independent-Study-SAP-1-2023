module InputMAR (nLm, CLK, in, addr, nrd, nwr, prog);
input CLK, nLm, prog;  //run_prog = 1 means in run mode not in programming mode
input [3:0] in;

output nrd, nwr;
output [3:0] addr;

reg nrd, nwr;
reg [3:0] addr;

always @ (posedge CLK)
  begin 
    if(prog) 
      begin
      {nrd, nwr} = 1;     //make nrd enabled and nwr disabled b/c in run mode ram become ROM
    
    if(!nLm) addr = in;    
    
    else addr <= addr;
    end

    else 
      begin
        {nrd, nwr} = 2;
  
    if(!nLm) addr = in;    //make nrd enabled and nwr disabled b/c in run mode
   
    else addr <= addr;
    end
  end

endmodule

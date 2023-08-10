module Controller_Sequencer(CLK, CLR, cntrl_bus, opcode);
input CLK,CLR;
input [3:0] opcode;

output [11:0] cntrl_bus;  //Forms the control word for the system

reg [5:0] ringcount;
reg [11:0] cntrl_bus;     //The 12 control bits

wire [5:0] state ;

parameter 
  T1 = 1,
  T2 = 2,
  T3 = 4,
  T4 = 8,
  T5 = 16,
  T6 = 32;
  
// ring counter 
always @ (negedge CLK)
  begin
    if (CLR)  
      ringcount = 1;
  
   else case(ringcount)   //Changes from one cycle to the next
      T1: ringcount <= T2;
      T2: ringcount <= T3;
      T3: ringcount <= T4;
      T4: ringcount <= T5;
      T5: ringcount <= T6; 
      T6: ringcount <= T1;
   endcase
  end
//end of ring counter 

/*Mealy state machine in which next state is missing in a sense that 
ringcounter indepedently calculate determin it*/
assign state = ringcount;

always @(negedge CLK)
  case ({state, opcode})              //Opcode instructions
  {T1, 4'hx}: cntrl_bus = 12'h5E3;    //fetch cycle start here PC -> MAR
  {T2, 4'hx}: cntrl_bus = 12'hBE3;
  {T3, 4'hx}: cntrl_bus = 12'h263;    //fetch cycle end here

  //LDA operation
  {T4, 4'h0}: cntrl_bus = 12'h1A3;
  {T5, 4'h0}: cntrl_bus = 12'h2C3;
  {T6, 4'h0}: cntrl_bus = 12'h3E3;

  //ADD
  {T4, 4'h0}: cntrl_bus = 12'h1A3;
  {T5, 4'h0}: cntrl_bus = 12'h2E1;  
  {T6, 4'h0}: cntrl_bus = 12'h3C7;

  //SUB
  {T4, 4'h0}: cntrl_bus = 12'h1A3;
  {T5, 4'h0}: cntrl_bus = 12'h2E1;
  {T6, 4'h0}: cntrl_bus = 12'h3EF;

  //OUT
  {T4, 4'h0}: cntrl_bus = 12'h3F2;
  {T5, 4'h0}: cntrl_bus = 12'h3E3;
  {T6, 4'h0}: cntrl_bus = 12'h3E3;

  //HLT
  {T4, 4'h0}: cntrl_bus = 12'h3E3;
  {T5, 4'h0}: cntrl_bus = 12'h3E3;
  {T6, 4'h0}: cntrl_bus = 12'h3E3;
  endcase

endmodule

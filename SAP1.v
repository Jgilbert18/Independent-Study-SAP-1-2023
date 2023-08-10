module SAP1(CLK, CLR, result, prog, ram_sel, Wbus_ext, nLm_ext);  
input CLK, CLR, prog, ram_sel, nLm_ext;
input [7:0] Wbus_ext;

output [7:0] result;

//varibles for run and program mode of SAP1 in FPGA it is connected to the switches
wire nrd, nwr, prog, nLm_int;
wire [7:0] Wbus, Wbus_int;
wire Cp, Ep, nLm, nCe, nLi, nEi, nLa, Ea, Su, Eu, nLb, nLo;
wire [11:0] cntrl_bus = {Cp, Ep, nLm, nCe, nLi, nEi, nLa, Ea, Su, Eu, nLb, nLo};
wire [3:0] opcode;
wire [7:0] atemp, bout;

assign nCe = prog?nCe:ram_sel;
assign Wbus = prog?Wbus_int:Wbus_ext;
assign nLm = prog?nLm_int:nLm_ext;


Program_Counter PC_SAP1(nCLR, nCLK, Cp, Ep, Wbus);

InputMAR MAR_SAP1(nLm, CLK, in, addr, nrd, nwr, prog);

RAM RAM_SAP1(CLK, nrd, nwr, nCe, addr, data);

Instruction_Register IR_SAP1(CLK, nLi, nEi, CLR, Wbus, Wbuslower, opcode);

Controller_Sequencer CS_SAP1(CLK, CLR, cntrl_bus, opcode);

Accumulator_A AA_SAP1(CLK, nLa, Ea, aout, ain, atemp);

Adder_Subtractor AS_SAP1(a, b, s, cout, cb);

Register_B RB_SAP1(nLb, CLK, bin, bout);

Output_Register OR_SAP1(nLo, CLK, orin, display);

endmodule


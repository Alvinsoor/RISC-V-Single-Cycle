/******************************************************************
* Description
*	This is control unit for the RISC-V Microprocessor. The control unit is 
*	in charge of generation of the control signals. Its only input 
*	corresponds to opcode from the instruction bus.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module Control
(
	input [6:0]OP_i,
	
	
	output Branch_o,
	output Mem_Read_o,
	output Mem_to_Reg_o,
	output Mem_Write_o,
	output ALU_Src_o,
	output Reg_Write_o,
	output [2:0]ALU_Op_o,
	output JALR_Signal,
	output JAL_Signal
);



localparam R_Type			= 7'h33;
localparam I_Type_LOGIC		= 7'h13;
localparam U_Type_LUI		= 7'h37;
localparam I_Type_LW		= 7'h03;
localparam I_Type_JMP		= 7'h67;
localparam S_Type 			= 7'h23;//SW
localparam B_Type 			= 7'h63;//Branches
localparam J_Type 			= 7'h6F;//JAL


reg [10:0] control_values;
//reg jalr;

always@(OP_i) begin
	case(OP_i)//                             A9_876_54_3_210 Los ultimos 3 bits son para identificar la operación (asignados)
		R_Type:			control_values = 11'b00_001_00_0_000;
		I_Type_LOGIC:	control_values = 11'b00_001_00_1_001;
		U_Type_LUI:		control_values = 11'b00_001_00_1_010;
		I_Type_JMP:		control_values = 11'b01_001_00_1_011;//Configuracion JALR
		B_Type:			control_values = 11'b00_100_00_0_100;//Branches
		I_Type_LW:		control_values = 11'b00_011_10_1_101;//LW
		S_Type:			control_values = 11'b00_010_01_1_110;//SW
		J_Type:			control_values = 11'b10_001_00_0_111;//JAL
		
		
		
		default:
			control_values= 11'b00_000_00_000;
			
		endcase
	
	
end	

assign JAL_Signal = control_values[10];

assign JALR_Signal = control_values[9];

assign Branch_o = control_values[8];

assign Mem_to_Reg_o = control_values[7];

assign Reg_Write_o = control_values[6];

assign Mem_Read_o = control_values[5];

assign Mem_Write_o = control_values[4];

assign ALU_Src_o = control_values[3];

assign ALU_Op_o = control_values[2:0];	


endmodule



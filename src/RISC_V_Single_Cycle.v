/******************************************************************
* Description
*	This is the top-level of a RISC-V Microprocessor that can execute the next set of instructions:
*		add
*		addi
* This processor is written Verilog-HDL. It is synthesizabled into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be executed. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module RISC_V_Single_Cycle
#(
	parameter PROGRAM_MEMORY_DEPTH = 64,
	parameter DATA_MEMORY_DEPTH = 256
)

(
	// Inputs
	input clk,
	input reset

);
//******************************************************************/
//******************************************************************/

//******************************************************************/
//******************************************************************/
/* Signals to connect modules*/

/**Control**/
wire alu_src_w;
wire reg_write_w;
wire mem_to_reg_w;
wire mem_write_w;
wire mem_read_w;
wire branch_o_w;
wire [2:0] alu_op_w;

/** Program Counter**/
wire [31:0] pc_plus_4_w;
wire [31:0] pc_w;

//Mux Jump
wire pc_jalr_signal_w;
wire [31:0] pc_MUX_JALR_w;

wire pc_jal_signal_w;
wire [31:0] pc_MUX_JAL_w;

//Mux Branch
wire [31:0] pc_MUX_BRN_w;


//Adder PC Plus INMM
wire [31:0] pc_plus_INMM_w;


/**Register File**/
wire [31:0] read_data_1_w;
wire [31:0] read_data_2_w;

/**Inmmediate Unit**/
wire [31:0] inmmediate_data_w;

/**ALU**/
wire [31:0] alu_result_w;

/**Multiplexer MUX_DATA_OR_IMM_FOR_ALU**/
wire [31:0] read_data_2_or_imm_w;

/**ALU Control**/
wire [3:0] alu_operation_w;

/**Instruction Bus**/	
wire [31:0] instruction_bus_w;

//Data memory
wire [31:0]read_data_memory_w;

//OR Gate jal,jalr
wire 	[31:0]Or_Gate_output_w;
//MUX Mem To Reg
wire [31:0]Output_mem_to_reg_w;

wire [31:0]Output_Mux_Memtoreg_w;
//And Gate Alu Branch
wire	And_Gate_output_w;

//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
CONTROL_UNIT
(
	/****/
	.OP_i(instruction_bus_w[6:0]),
	/** outputus**/
	.ALU_Op_o(alu_op_w),
	.ALU_Src_o(alu_src_w),
	.Reg_Write_o(reg_write_w),
	.Mem_to_Reg_o(mem_to_reg_w),
	.Mem_Read_o(mem_read_w),
	.Mem_Write_o(mem_write_w),
	.Branch_o(branch_o_w),
	.JALR_Signal(pc_jalr_signal_w),
	.JAL_Signal(pc_jal_signal_w)
);

//******************************************************************/
PC_Register
PROGRAM_COUNTER
(
	.clk(clk),
	.reset(reset),
	.Next_PC(pc_MUX_JALR_w),
	.PC_Value(pc_w)
);
//******************************************************************/

Program_Memory
#(
	.MEMORY_DEPTH(PROGRAM_MEMORY_DEPTH)
)
PROGRAM_MEMORY
(
	.Address_i(pc_w),
	.Instruction_o(instruction_bus_w)
);

//******************************************************************/

Data_Memory
#(
	.MEMORY_DEPTH(DATA_MEMORY_DEPTH)
)
Data_Memory
(
	.clk(clk),
	.Mem_Write_i(mem_write_w),
	.Mem_Read_i(mem_read_w),
	.Write_Data_i(read_data_2_w),
	.Address_i(alu_result_w),

	.Read_Data_o(read_data_memory_w)
);

//******************************************************************/
Adder_32_Bits
PC_PLUS_4
(
	.Data0(pc_w),
	.Data1(4),
	
	.Result(pc_plus_4_w)
);
//******************************************************************/
Adder_32_Bits
PC_PLUS_INMM
(
	.Data0(pc_w),
	.Data1(inmmediate_data_w),
	
	.Result(pc_plus_INMM_w)
);



//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/



Register_File
REGISTER_FILE_UNIT
(
	.clk(clk),
	.reset(reset),
	.Reg_Write_i(reg_write_w),
	.Write_Register_i(instruction_bus_w[11:7]),
	.Read_Register_1_i(instruction_bus_w[19:15]),
	.Read_Register_2_i(instruction_bus_w[24:20]),
	.Write_Data_i(Output_Mux_Memtoreg_w),
	.Read_Data_1_o(read_data_1_w),
	.Read_Data_2_o(read_data_2_w)

);
//******************************************************************/

Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_Mem_To_Reg
(
	.Selector_i(mem_to_reg_w),
	.Mux_Data_0_i(alu_result_w),
	.Mux_Data_1_i(read_data_memory_w),
	
	.Mux_Output_o(Output_mem_to_reg_w)

);
//******************************************************************/

Immediate_Unit
IMM_UNIT
(  .op_i(instruction_bus_w[6:0]),
   .Instruction_bus_i(instruction_bus_w),
   .Immediate_o(inmmediate_data_w)
);


//******************************************************************/

Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_DATA_OR_IMM_FOR_ALU
(
	.Selector_i(alu_src_w),
	.Mux_Data_0_i(read_data_2_w),
	.Mux_Data_1_i(inmmediate_data_w),
	
	.Mux_Output_o(read_data_2_or_imm_w)

);

//******************************************************************/
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_PC_JALR_OR_NEXT
(
	.Selector_i(pc_jalr_signal_w),
	.Mux_Data_0_i(pc_MUX_JAL_w),
	.Mux_Data_1_i(alu_result_w),
	
	.Mux_Output_o(pc_MUX_JALR_w)

);
//******************************************************************/

Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_PC_BRANCH_OR_NEXT
(
	.Selector_i(And_Gate_output_w),
	.Mux_Data_0_i(pc_plus_4_w),
	.Mux_Data_1_i(pc_plus_INMM_w),
	
	.Mux_Output_o(pc_MUX_BRN_w)

);

//******************************************************************/
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_PC_JAL_OR_NEXT
(
	.Selector_i(pc_jal_signal_w),
	.Mux_Data_0_i(pc_MUX_BRN_w),
	.Mux_Data_1_i(pc_plus_INMM_w),
	
	.Mux_Output_o(pc_MUX_JAL_w)

);
//******************************************************************/

Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_PC_OR_MemeToReg
(
	.Selector_i(Or_Gate_output_w),
	.Mux_Data_0_i(Output_mem_to_reg_w),
	.Mux_Data_1_i(pc_plus_4_w),
	
	.Mux_Output_o(Output_Mux_Memtoreg_w)

);

//******************************************************************/
OrGate
OR_Gate_Jal_Jalr
(
	.A_i(pc_jalr_signal_w),
	.B_i(pc_jal_signal_w),

	.result(Or_Gate_output_w)
);
//******************************************************************/

And_Gate
And_Gate_Alu_BRN
(
	.A_i(branch_o_w),
	.B_i(alu_result_w[0]),

	.result(And_Gate_output_w)
);
//******************************************************************/

ALU_Control
ALU_CONTROL_UNIT
(
	.funct7_i(instruction_bus_w[30]),
	.ALU_Op_i(alu_op_w),
	.funct3_i(instruction_bus_w[14:12]),
	.ALU_Operation_o(alu_operation_w)

);

//******************************************************************/

ALU
ALU_UNIT
(
	.ALU_Operation_i(alu_operation_w),
	.A_i(read_data_1_w),
	.B_i(read_data_2_or_imm_w),
	.ALU_Result_o(alu_result_w)
);




endmodule


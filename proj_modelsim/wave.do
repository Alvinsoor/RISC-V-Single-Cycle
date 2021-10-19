onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RISC_V_Single_Cycle_TB/clk_tb
add wave -noupdate /RISC_V_Single_Cycle_TB/reset_tb
add wave -noupdate -expand -group ALU -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Operation_i
add wave -noupdate -expand -group ALU -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/A_i
add wave -noupdate -expand -group ALU -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/B_i
add wave -noupdate -expand -group ALU /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/Zero_o
add wave -noupdate -expand -group ALU -itemcolor Red -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Result_o
add wave -noupdate -group {CTRL Unit} /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/OP_i
add wave -noupdate -group {CTRL Unit} /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Branch_o
add wave -noupdate -group {CTRL Unit} /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Mem_Read_o
add wave -noupdate -group {CTRL Unit} /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Mem_to_Reg_o
add wave -noupdate -group {CTRL Unit} /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Mem_Write_o
add wave -noupdate -group {CTRL Unit} -color {Dark Orchid} /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/ALU_Src_o
add wave -noupdate -group {CTRL Unit} -color White /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Reg_Write_o
add wave -noupdate -group {ALU CTRL} /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/ALU_Op_o
add wave -noupdate -group {ALU CTRL} /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/funct7_i
add wave -noupdate -group {ALU CTRL} /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/ALU_Op_i
add wave -noupdate -group {ALU CTRL} /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/funct3_i
add wave -noupdate -group {ALU CTRL} /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/ALU_Operation_o
add wave -noupdate -expand -group {Porgram Memory} -radix unsigned /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Address_i
add wave -noupdate -expand -group {Porgram Memory} -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/PROGRAM_MEMORY/Instruction_o
add wave -noupdate -expand -group {Register File} /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/clk
add wave -noupdate -expand -group {Register File} /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/reset
add wave -noupdate -expand -group {Register File} /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Reg_Write_i
add wave -noupdate -expand -group {Register File} /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Write_Register_i
add wave -noupdate -expand -group {Register File} /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Register_1_i
add wave -noupdate -expand -group {Register File} /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Register_2_i
add wave -noupdate -expand -group {Register File} -radix unsigned /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Write_Data_i
add wave -noupdate -expand -group {Register File} -radix unsigned /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Data_1_o
add wave -noupdate -expand -group {Register File} -radix unsigned /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Read_Data_2_o
add wave -noupdate -group t1 -radix unsigned /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t1/DataInput
add wave -noupdate -group t2 -radix unsigned /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/enable
add wave -noupdate -group t2 -radix unsigned -childformat {{{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[31]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[30]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[29]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[28]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[27]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[26]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[25]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[24]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[23]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[22]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[21]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[20]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[19]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[18]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[17]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[16]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[15]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[14]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[13]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[12]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[11]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[10]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[9]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[8]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[7]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[6]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[5]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[4]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[3]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[2]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[1]} -radix unsigned} {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[0]} -radix unsigned}} -subitemconfig {{/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[31]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[30]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[29]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[28]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[27]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[26]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[25]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[24]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[23]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[22]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[21]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[20]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[19]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[18]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[17]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[16]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[15]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[14]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[13]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[12]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[11]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[10]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[9]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[8]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[7]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[6]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[5]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[4]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[3]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[2]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[1]} {-height 15 -radix unsigned} {/RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput[0]} {-height 15 -radix unsigned}} /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataInput
add wave -noupdate -expand -group outputs -label t0 -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t0/DataOutput
add wave -noupdate -expand -group outputs -label t1 -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t1/DataOutput
add wave -noupdate -expand -group outputs -label t2 -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataOutput
add wave -noupdate -expand -group outputs -label s0 -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s0_fp/DataOutput
add wave -noupdate -expand -group outputs -label s1 -radix hexadecimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s1/DataOutput
add wave -noupdate -expand -group outputs -label s2 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s2/DataOutput
add wave -noupdate -expand -group outputs -label s3 /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s3/DataOutput
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {62 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 328
configure wave -valuecolwidth 119
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {47 ps} {103 ps}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_tb/ALU_result_out
add wave -noupdate /mips_tb/Branch_out
add wave -noupdate /mips_tb/Instruction_out
add wave -noupdate /mips_tb/Memwrite_out
add wave -noupdate /mips_tb/PC
add wave -noupdate /mips_tb/Regwrite_out
add wave -noupdate /mips_tb/Zero_out
add wave -noupdate /mips_tb/clock
add wave -noupdate /mips_tb/read_data_1_out
add wave -noupdate /mips_tb/read_data_2_out
add wave -noupdate /mips_tb/reset
add wave -noupdate /mips_tb/write_data_out
add wave -noupdate /mips_tb/U_0/reset
add wave -noupdate /mips_tb/U_0/clock
add wave -noupdate /mips_tb/U_0/PC
add wave -noupdate /mips_tb/U_0/ALU_result_out
add wave -noupdate /mips_tb/U_0/read_data_1_out
add wave -noupdate /mips_tb/U_0/read_data_2_out
add wave -noupdate /mips_tb/U_0/write_data_out
add wave -noupdate /mips_tb/U_0/Instruction_out
add wave -noupdate /mips_tb/U_0/Branch_out
add wave -noupdate /mips_tb/U_0/Zero_out
add wave -noupdate /mips_tb/U_0/Memwrite_out
add wave -noupdate /mips_tb/U_0/Regwrite_out
add wave -noupdate /mips_tb/U_0/PC_plus_4
add wave -noupdate /mips_tb/U_0/read_data_1
add wave -noupdate /mips_tb/U_0/read_data_2
add wave -noupdate /mips_tb/U_0/Sign_extend
add wave -noupdate /mips_tb/U_0/Add_result
add wave -noupdate /mips_tb/U_0/ALU_result
add wave -noupdate /mips_tb/U_0/read_data
add wave -noupdate /mips_tb/U_0/ALUSrc
add wave -noupdate /mips_tb/U_0/ALU_ctl
add wave -noupdate /mips_tb/U_0/J_addr
add wave -noupdate /mips_tb/U_0/RegDst
add wave -noupdate /mips_tb/U_0/Regwrite
add wave -noupdate /mips_tb/U_0/Zero
add wave -noupdate /mips_tb/U_0/Jump
add wave -noupdate /mips_tb/U_0/Branch
add wave -noupdate /mips_tb/U_0/Shift
add wave -noupdate /mips_tb/U_0/MemWrite
add wave -noupdate /mips_tb/U_0/MemtoReg
add wave -noupdate /mips_tb/U_0/MemRead
add wave -noupdate /mips_tb/U_0/ALUop
add wave -noupdate /mips_tb/U_0/Instruction
add wave -noupdate /mips_tb/U_0/WReg_addr
add wave -noupdate /mips_tb/U_0/Instruction_20_16
add wave -noupdate /mips_tb/U_0/Instruction_15_11
add wave -noupdate /mips_tb/U_0/Instruction_10_6
add wave -noupdate /mips_tb/U_0/PCwritedisable
add wave -noupdate /mips_tb/U_0/IF_IDwritedisable
add wave -noupdate /mips_tb/U_0/stall
add wave -noupdate /mips_tb/U_0/FA
add wave -noupdate /mips_tb/U_0/FB
add wave -noupdate /mips_tb/U_0/Result_MEM_WB
add wave -noupdate /mips_tb/U_0/IF_Flush
add wave -noupdate /mips_tb/U_0/read_data_2_ex
add wave -noupdate /mips_tb/U_0/Instruction_IF_ID_Reg
add wave -noupdate /mips_tb/U_0/PC_plus_4_IF_ID_Reg
add wave -noupdate /mips_tb/U_0/Instruction_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/PC_plus_4_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/read_data_1_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/read_data_2_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/Sign_extend_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/Instruction_20_16_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/Instruction_15_11_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/Instruction_10_6_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/RegDst_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/ALUSrc_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/MemtoReg_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/RegWrite_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/MemRead_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/MemWrite_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/ALUop_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/Branch_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/Jump_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/Instruction_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/Add_result_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/ALU_result_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/read_data_2_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/WReg_addr_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/J_addr_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/PC_plus_4_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/MemtoReg_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/RegWrite_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/MemRead_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/MemWrite_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/Zero_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/Branch_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/Jump_EX_MEM_Reg
add wave -noupdate /mips_tb/U_0/Instruction_MEM_WB_Reg
add wave -noupdate /mips_tb/U_0/read_data_MEM_WB_Reg
add wave -noupdate /mips_tb/U_0/ALU_result_MEM_WB_Reg
add wave -noupdate /mips_tb/U_0/WReg_addr_MEM_WB_Reg
add wave -noupdate /mips_tb/U_0/PC_plus_4_MEM_WB_Reg
add wave -noupdate /mips_tb/U_0/MemtoReg_MEM_WB_Reg
add wave -noupdate /mips_tb/U_0/RegWrite_MEM_WB_Reg
add wave -noupdate /mips_tb/U_0/Jump_MEM_WB_Reg
add wave -noupdate /mips_tb/U_0/IFE/Instruction
add wave -noupdate /mips_tb/U_0/IFE/PC_plus_4_out
add wave -noupdate /mips_tb/U_0/IFE/Add_result
add wave -noupdate /mips_tb/U_0/IFE/read_data_1
add wave -noupdate /mips_tb/U_0/IFE/J_addr
add wave -noupdate /mips_tb/U_0/IFE/Branch
add wave -noupdate /mips_tb/U_0/IFE/Jump
add wave -noupdate /mips_tb/U_0/IFE/Zero
add wave -noupdate /mips_tb/U_0/IFE/PCwritedisable
add wave -noupdate /mips_tb/U_0/IFE/PC_out
add wave -noupdate /mips_tb/U_0/IFE/IF_Flush
add wave -noupdate /mips_tb/U_0/IFE/clock
add wave -noupdate /mips_tb/U_0/IFE/reset
add wave -noupdate /mips_tb/U_0/IFE/PC
add wave -noupdate /mips_tb/U_0/IFE/PC_plus_4
add wave -noupdate /mips_tb/U_0/IFE/next_PC
add wave -noupdate /mips_tb/U_0/IFE/Mem_Addr
add wave -noupdate /mips_tb/U_0/IFE/PCSrc
add wave -noupdate /mips_tb/U_0/IFE/en
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/wren_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/wren_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/rden_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/rden_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/data_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/data_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/address_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/address_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/clock0
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/clock1
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/clocken0
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/clocken1
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/clocken2
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/clocken3
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/aclr0
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/aclr1
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/addressstall_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/addressstall_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/byteena_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/byteena_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/q_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/q_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/eccstatus
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_data_reg_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_data_reg_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_reg_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_tmp_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_tmp2_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_tmp_wren_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_tmp2_wren_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_tmp_wren_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_reg_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_tmp_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_tmp2_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_output_latch
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_ecc_reg_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_q_ecc_tmp_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_current_written_data_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_original_data_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_original_data_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_a_x
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_b_x
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_a_out
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_b_out
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_address_reg_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_address_reg_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_wren_reg_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_wren_reg_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_rden_reg_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_rden_reg_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_read_flag_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_read_flag_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_reread_flag_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_reread_flag_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_reread_flag2_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_reread_flag2_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_write_flag_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_write_flag_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_nmram_write_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_nmram_write_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_indata_aclr_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_address_aclr_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_wrcontrol_aclr_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_indata_aclr_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_address_aclr_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_wrcontrol_aclr_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_outdata_aclr_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_outdata_aclr_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_rdcontrol_aclr_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_byteena_aclr_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_byteena_aclr_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/good_to_go_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/good_to_go_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_core_clocken_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_core_clocken_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_core_clocken_b0
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_core_clocken_b1
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_inclocken0
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_input_clocken_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_outdata_clken_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_outdata_clken_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_outlatch_clken_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_outlatch_clken_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_core_clocken_a_reg
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_core_clocken_b_reg
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/default_val
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_data_zero_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_data_zero_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_data_ones_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_data_ones_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/same_clock_pulse0
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/same_clock_pulse1
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_force_reread_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_force_reread_a1
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_force_reread_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_force_reread_b1
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_force_reread_signal_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_force_reread_signal_b
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_good_to_write_a
add wave -noupdate /mips_tb/U_0/IFE/inst_memory/i_good_to_write_b
add wave -noupdate /mips_tb/U_0/ID/read_data_1_out
add wave -noupdate /mips_tb/U_0/ID/read_data_2_out
add wave -noupdate /mips_tb/U_0/ID/Instruction
add wave -noupdate /mips_tb/U_0/ID/read_data
add wave -noupdate /mips_tb/U_0/ID/ALU_result
add wave -noupdate /mips_tb/U_0/ID/RegWrite
add wave -noupdate /mips_tb/U_0/ID/MemtoReg
add wave -noupdate /mips_tb/U_0/ID/Jump
add wave -noupdate /mips_tb/U_0/ID/Shift
add wave -noupdate /mips_tb/U_0/ID/PC_plus_4_jal
add wave -noupdate /mips_tb/U_0/ID/PC_plus_4
add wave -noupdate /mips_tb/U_0/ID/Sign_extend_out
add wave -noupdate /mips_tb/U_0/ID/Instruction_20_16
add wave -noupdate /mips_tb/U_0/ID/Instruction_15_11
add wave -noupdate /mips_tb/U_0/ID/Instruction_10_6
add wave -noupdate /mips_tb/U_0/ID/WReg_addr
add wave -noupdate /mips_tb/U_0/ID/Add_result
add wave -noupdate /mips_tb/U_0/ID/Zero
add wave -noupdate /mips_tb/U_0/ID/J_addr
add wave -noupdate /mips_tb/U_0/ID/clock
add wave -noupdate /mips_tb/U_0/ID/reset
add wave -noupdate /mips_tb/U_0/ID/register_array
add wave -noupdate /mips_tb/U_0/ID/write_register_address
add wave -noupdate /mips_tb/U_0/ID/write_data
add wave -noupdate /mips_tb/U_0/ID/read_register_1_address
add wave -noupdate /mips_tb/U_0/ID/read_register_2_address
add wave -noupdate /mips_tb/U_0/ID/write_register_address_1
add wave -noupdate /mips_tb/U_0/ID/write_register_address_0
add wave -noupdate /mips_tb/U_0/ID/Instruction_immediate_value
add wave -noupdate /mips_tb/U_0/ID/Comparator
add wave -noupdate /mips_tb/U_0/ID/Branch_Add
add wave -noupdate /mips_tb/U_0/ID/read_data_1
add wave -noupdate /mips_tb/U_0/ID/read_data_2
add wave -noupdate /mips_tb/U_0/ID/Sign_extend
add wave -noupdate /mips_tb/U_0/CTL/Opcode
add wave -noupdate /mips_tb/U_0/CTL/Function_opcode
add wave -noupdate /mips_tb/U_0/CTL/RegDst
add wave -noupdate /mips_tb/U_0/CTL/ALUSrc
add wave -noupdate /mips_tb/U_0/CTL/MemtoReg
add wave -noupdate /mips_tb/U_0/CTL/RegWrite
add wave -noupdate /mips_tb/U_0/CTL/MemRead
add wave -noupdate /mips_tb/U_0/CTL/MemWrite
add wave -noupdate /mips_tb/U_0/CTL/Shift
add wave -noupdate /mips_tb/U_0/CTL/Jump
add wave -noupdate /mips_tb/U_0/CTL/Branch
add wave -noupdate /mips_tb/U_0/CTL/ALUop
add wave -noupdate /mips_tb/U_0/CTL/clock
add wave -noupdate /mips_tb/U_0/CTL/reset
add wave -noupdate /mips_tb/U_0/CTL/R_format
add wave -noupdate /mips_tb/U_0/CTL/Lw
add wave -noupdate /mips_tb/U_0/CTL/Sw
add wave -noupdate /mips_tb/U_0/CTL/Andi
add wave -noupdate /mips_tb/U_0/CTL/Addi
add wave -noupdate /mips_tb/U_0/CTL/Ori
add wave -noupdate /mips_tb/U_0/CTL/Xori
add wave -noupdate /mips_tb/U_0/CTL/Slti
add wave -noupdate /mips_tb/U_0/CTL/Lui
add wave -noupdate /mips_tb/U_0/CTL/Mul
add wave -noupdate /mips_tb/U_0/CTL/Beq
add wave -noupdate /mips_tb/U_0/CTL/Bne
add wave -noupdate /mips_tb/U_0/CTL/Jal
add wave -noupdate /mips_tb/U_0/CTL/Jr
add wave -noupdate /mips_tb/U_0/EXE/Read_data_1
add wave -noupdate /mips_tb/U_0/EXE/Read_data_2
add wave -noupdate /mips_tb/U_0/EXE/Sign_extend
add wave -noupdate /mips_tb/U_0/EXE/Function_opcode
add wave -noupdate /mips_tb/U_0/EXE/Ainput_out
add wave -noupdate /mips_tb/U_0/EXE/Binput_out
add wave -noupdate /mips_tb/U_0/EXE/ALUSrc
add wave -noupdate /mips_tb/U_0/EXE/FA
add wave -noupdate /mips_tb/U_0/EXE/FB
add wave -noupdate /mips_tb/U_0/EXE/ALUOp
add wave -noupdate /mips_tb/U_0/EXE/ALU_Result
add wave -noupdate /mips_tb/U_0/EXE/Result_EX_MEM
add wave -noupdate /mips_tb/U_0/EXE/Result_MEM_WB
add wave -noupdate /mips_tb/U_0/EXE/PC_plus_4
add wave -noupdate /mips_tb/U_0/EXE/Read_data_2_ex
add wave -noupdate /mips_tb/U_0/EXE/WReg_addr
add wave -noupdate /mips_tb/U_0/EXE/Jump
add wave -noupdate /mips_tb/U_0/EXE/RegDst
add wave -noupdate /mips_tb/U_0/EXE/Instruction_20_16
add wave -noupdate /mips_tb/U_0/EXE/Instruction_15_11
add wave -noupdate /mips_tb/U_0/EXE/Shamt
add wave -noupdate /mips_tb/U_0/EXE/clock
add wave -noupdate /mips_tb/U_0/EXE/reset
add wave -noupdate /mips_tb/U_0/EXE/Ainput
add wave -noupdate /mips_tb/U_0/EXE/Binput
add wave -noupdate /mips_tb/U_0/EXE/ALU_output_mux
add wave -noupdate /mips_tb/U_0/EXE/SUB_B
add wave -noupdate /mips_tb/U_0/EXE/Branch_Add
add wave -noupdate /mips_tb/U_0/EXE/ALU_ctl
add wave -noupdate /mips_tb/U_0/MEM/read_data
add wave -noupdate /mips_tb/U_0/MEM/address
add wave -noupdate /mips_tb/U_0/MEM/write_data
add wave -noupdate /mips_tb/U_0/MEM/MemRead
add wave -noupdate /mips_tb/U_0/MEM/Memwrite
add wave -noupdate /mips_tb/U_0/MEM/clock
add wave -noupdate /mips_tb/U_0/MEM/reset
add wave -noupdate /mips_tb/U_0/MEM/write_clock
add wave -noupdate /mips_tb/U_0/MEM/data_memory/wren_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/wren_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/rden_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/rden_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/data_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/data_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/address_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/address_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/clock0
add wave -noupdate /mips_tb/U_0/MEM/data_memory/clock1
add wave -noupdate /mips_tb/U_0/MEM/data_memory/clocken0
add wave -noupdate /mips_tb/U_0/MEM/data_memory/clocken1
add wave -noupdate /mips_tb/U_0/MEM/data_memory/clocken2
add wave -noupdate /mips_tb/U_0/MEM/data_memory/clocken3
add wave -noupdate /mips_tb/U_0/MEM/data_memory/aclr0
add wave -noupdate /mips_tb/U_0/MEM/data_memory/aclr1
add wave -noupdate /mips_tb/U_0/MEM/data_memory/addressstall_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/addressstall_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/byteena_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/byteena_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/q_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/q_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/eccstatus
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_data_reg_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_data_reg_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_reg_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_tmp_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_tmp2_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_tmp_wren_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_tmp2_wren_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_tmp_wren_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_reg_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_tmp_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_tmp2_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_output_latch
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_ecc_reg_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_q_ecc_tmp_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_current_written_data_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_original_data_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_original_data_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_a_x
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_b_x
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_a_out
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_b_out
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_address_reg_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_address_reg_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_wren_reg_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_wren_reg_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_rden_reg_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_rden_reg_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_read_flag_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_read_flag_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_reread_flag_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_reread_flag_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_reread_flag2_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_reread_flag2_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_write_flag_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_write_flag_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_nmram_write_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_nmram_write_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_indata_aclr_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_address_aclr_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_wrcontrol_aclr_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_indata_aclr_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_address_aclr_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_wrcontrol_aclr_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_outdata_aclr_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_outdata_aclr_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_rdcontrol_aclr_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_byteena_aclr_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_byteena_aclr_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/good_to_go_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/good_to_go_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_core_clocken_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_core_clocken_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_core_clocken_b0
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_core_clocken_b1
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_inclocken0
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_input_clocken_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_outdata_clken_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_outdata_clken_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_outlatch_clken_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_outlatch_clken_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_core_clocken_a_reg
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_core_clocken_b_reg
add wave -noupdate /mips_tb/U_0/MEM/data_memory/default_val
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_data_zero_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_data_zero_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_data_ones_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_data_ones_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/same_clock_pulse0
add wave -noupdate /mips_tb/U_0/MEM/data_memory/same_clock_pulse1
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_force_reread_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_force_reread_a1
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_force_reread_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_force_reread_b1
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_force_reread_signal_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_force_reread_signal_b
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_good_to_write_a
add wave -noupdate /mips_tb/U_0/MEM/data_memory/i_good_to_write_b
add wave -noupdate /mips_tb/U_0/FORWARDING_UNIT/rs_ID_EX
add wave -noupdate /mips_tb/U_0/FORWARDING_UNIT/rt_ID_EX
add wave -noupdate /mips_tb/U_0/FORWARDING_UNIT/rd_EX_MEM
add wave -noupdate /mips_tb/U_0/FORWARDING_UNIT/rd_MEM_WB
add wave -noupdate /mips_tb/U_0/FORWARDING_UNIT/RegWrite_EX_MEM
add wave -noupdate /mips_tb/U_0/FORWARDING_UNIT/RegWrite_MEM_WB
add wave -noupdate /mips_tb/U_0/FORWARDING_UNIT/FA
add wave -noupdate /mips_tb/U_0/FORWARDING_UNIT/FB
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/PCwritedisable
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/IF_IDwritedisable
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/Instruction
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/r1_ID_EX
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/r2_ID_EX
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/rd_EX_MEM
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/rd_MEM_WB
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/stall
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/Jump_ID_EX
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/Jump_EX_MEM
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/Jump_MEM_WB
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/RegWrite_ID_EX
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/RegWrite_EX_MEM
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/RegWrite_MEM_WB
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/RegDst
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/MemRead_ID_EX_Reg
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/R_type
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/I_type
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/B_type
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/J_type
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/to_stall
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/lw_stall
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/used_RA
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/used_RB
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/Branch_stall
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/JR_stall
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/RA
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/RB
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/OP
add wave -noupdate /mips_tb/U_0/HAZARD_DETECTION/rd_ID_EX
add wave -noupdate /mips_tb/U_1/ALU_result_out
add wave -noupdate /mips_tb/U_1/Branch_out
add wave -noupdate /mips_tb/U_1/Instruction_out
add wave -noupdate /mips_tb/U_1/Memwrite_out
add wave -noupdate /mips_tb/U_1/PC
add wave -noupdate /mips_tb/U_1/Regwrite_out
add wave -noupdate /mips_tb/U_1/Zero_out
add wave -noupdate /mips_tb/U_1/read_data_1_out
add wave -noupdate /mips_tb/U_1/read_data_2_out
add wave -noupdate /mips_tb/U_1/write_data_out
add wave -noupdate /mips_tb/U_1/clock
add wave -noupdate /mips_tb/U_1/reset
add wave -noupdate /mips_tb/U_1/mw_U_0clk
add wave -noupdate /mips_tb/U_1/mw_U_0disable_clk
add wave -noupdate /mips_tb/U_1/mw_U_1pulse
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 214
configure wave -valuecolwidth 106
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 500000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {19973271 ps} {19995953 ps}
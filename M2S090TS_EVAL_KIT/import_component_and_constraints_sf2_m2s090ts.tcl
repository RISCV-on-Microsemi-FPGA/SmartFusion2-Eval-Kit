set project_folder_name MiV_RV32IMA_L1_AHB_BaseDesign_M2S090TS_EVAL_KIT
set project_dir_sf2 "./$project_folder_name"
set Libero_project_name MiV_BaseDesign


puts "-------------------------------------------------------------------------"
puts "-----------------------IMPORTING COMPONENTS------------------------------"
puts "-------------------------------------------------------------------------" 

#MSS Subsystem as a SmartDesign Component

import_files -cxf {./M2S090TS_EVAL_KIT/MSS_SUBSYSTEM_sb_0_sb_MSS/MSS_SUBSYSTEM_sb_0_sb_MSS.cxf} 
source ./M2S090TS_EVAL_KIT/mss_subsystem_sf2_m2s090ts.tcl
generate_component -component_name {MSS_SUBSYSTEM_sb_0_sb_MSS}

source ./M2S090TS_EVAL_KIT/top_level_sf2_m2s090ts.tcl

build_design_hierarchy
set_root BaseDesign


puts "-------------------------------------------------------------------------"
puts "--------------------APPLYING DESING CONSTRAINTS--------------------------"
puts "-------------------------------------------------------------------------"

import_files -io_pdc ./M2S090TS_EVAL_KIT/io_constraints.pdc
import_files -sdc    ./M2S090TS_EVAL_KIT/io_jtag_constraints.sdc
# #Associate SDC constraint file to Place and Route tool
organize_tool_files -tool {PLACEROUTE} \
    -file $project_dir_sf2/constraint/io_jtag_constraints.sdc \
    -file $project_dir_sf2/constraint/io/io_constraints.pdc \
    -module {BaseDesign::work} -input_type {constraint}  
    
organize_tool_files -tool {SYNTHESIZE} \
    -file $project_dir_sf2/constraint/io_jtag_constraints.sdc \
    -module {BaseDesign::work} -input_type {constraint}    
    
organize_tool_files -tool {VERIFYTIMING} \
    -file $project_dir_sf2/constraint/io_jtag_constraints.sdc \
    -module {BaseDesign::work} -input_type {constraint}    
  
run_tool -name {CONSTRAINT_MANAGEMENT}
derive_constraints_sdc 
set_root BaseDesign

set project_folder_name MiV_AHB_BD
set project_dir2 "./$project_folder_name"

puts "-------------------------------------------------------------------------"
puts "-----------------------IMPORTING COMPONENTS------------------------------"
puts "-------------------------------------------------------------------------" 


source ./import/components/M2S090-FG484/AHB/top_level_sf2_eval_kit_ahb.tcl

build_design_hierarchy
set_root BaseDesign


puts "-------------------------------------------------------------------------"
puts "--------------------APPLYING DESING CONSTRAINTS--------------------------"
puts "-------------------------------------------------------------------------"

import_files -io_pdc ./import/constraints/io/io_constraints.pdc
import_files -sdc    ./import/constraints/io_jtag_constraints.sdc
# #Associate SDC constraint file to Place and Route tool

organize_tool_files -tool {PLACEROUTE} \
    -file $project_dir2/constraint/io_jtag_constraints.sdc \
    -file $project_dir2/constraint/io/io_constraints.pdc \
    -module {BaseDesign::work} -input_type {constraint}  
    
organize_tool_files -tool {SYNTHESIZE} \
    -file $project_dir2/constraint/io_jtag_constraints.sdc \
    -module {BaseDesign::work} -input_type {constraint}    
    
organize_tool_files -tool {VERIFYTIMING} \
    -file $project_dir2/constraint/io_jtag_constraints.sdc \
    -module {BaseDesign::work} -input_type {constraint}    
  
run_tool -name {CONSTRAINT_MANAGEMENT}
derive_constraints_sdc 
set_root BaseDesign

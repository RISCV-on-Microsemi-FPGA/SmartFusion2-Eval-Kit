set project_folder_name_axi MiV_AXI_BD
set project_dir_axi "./$project_folder_name_axi"
set Libero_project_name_axi SF2_EVAL_KIT_TS_MiV_AXI_BaseDesign

set project_folder_name_ahb MiV_AHB_BD
set project_dir_ahb "./$project_folder_name_ahb"
set Libero_project_name_ahb SF2_EVAL_KIT_TS_MiV_AHB_BaseDesign

set target [string toupper [lindex $argv 0]]
set design_flow_stage [string toupper [lindex $argv 1]]


proc create_new_project_label_axi { }\
{
   puts "-----------------------------------------------------------------------------------------------"
   puts "-----------------------------------------------------------------------------------------------"
   puts "---------------------------Creating New Project------------------------------------"
   puts "------------SF2_EVAL_KIT_TS_MiV_AXI_BaseDesign--------------------------"
   puts "-----------------------------------------------------------------------------------------------"
   puts "-----------------------------------------------------------------------------------------------"
}

proc create_new_project_label_ahb { }\
{
   puts "-----------------------------------------------------------------------------------------------"
   puts "-----------------------------------------------------------------------------------------------"
   puts "---------------------------Creating New Project------------------------------------"
   puts "------------SF2_EVAL_KIT_TS_MiV_AHB_BaseDesign------------------------"
   puts "-----------------------------------------------------------------------------------------------"
   puts "-----------------------------------------------------------------------------------------------"
}

proc project_exists { }\
{
   puts "-----------------------------------------------------------------------------------------------"
   puts "----------------------------------------Error-----------------------------------------------"
   puts "-----------------------------------------------------------------------------------------------"
   puts "Project already exists in folder. Please rename or remove and rerun script."
   puts "-----------------------------------------------------------------------------------------------"
}

proc invalid_argument { }\
{
   puts "-----------------------------------------------------------------------------------------------"
   puts "----------------------Wrong Argument Entered ---------------------------------"
   puts "-----------------------------------------------------------------------------------------------"
   puts "Make sure you put AHB or AXI argument in front of the Design Flow argument."
   puts "-----------------------------------------------------------------------------------------------"
}

proc  base_design_built {}\
{
  puts "-----------------------------------------------------------------------------------------------"
  puts "------------------------------BaseDesign Built---------------------------------------"
  puts "-----------------------------------------------------------------------------------------------"
}


if {"$target" == "AHB"} then {
	if {[file exists $project_dir_ahb] == 1} then {
		project_exists
	} else {
		create_new_project_label_ahb
		new_project -location $project_dir_ahb -name $Libero_project_name_ahb -project_description {} -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -hdl {VERILOG} -family {SmartFusion2} -die {M2S090TS} -package {484 FBGA} -speed {STD} -die_voltage {1.2} -part_range {COM} -adv_options {IO_DEFT_STD:LVCMOS 2.5V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {TEMPR:COM} -adv_options {UNUSED_MSS_IO_RESISTOR_PULL:None} -adv_options {VCCI_1.2_VOLTR:COM} -adv_options {VCCI_1.5_VOLTR:COM} -adv_options {VCCI_1.8_VOLTR:COM} -adv_options {VCCI_2.5_VOLTR:COM} -adv_options {VCCI_3.3_VOLTR:COM} -adv_options {VOLTR:COM} 
		source ./import/components/M2S090TS-FG484/AHB/import_component_and_constraints_sf2_eval_kit_ts_ahb.tcl    
		save_project
        base_design_built
	}
} elseif {"$target" == "AXI"} then {
	if {[file exists $project_dir_axi] == 1} then { 
		project_exists
	} else {
		create_new_project_label_axi
		new_project -location $project_dir_axi -name $Libero_project_name_axi -project_description {} -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -hdl {VERILOG} -family {SmartFusion2} -die {M2S090TS} -package {484 FBGA} -speed {STD} -die_voltage {1.2} -part_range {COM} -adv_options {IO_DEFT_STD:LVCMOS 2.5V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {TEMPR:COM} -adv_options {UNUSED_MSS_IO_RESISTOR_PULL:None} -adv_options {VCCI_1.2_VOLTR:COM} -adv_options {VCCI_1.5_VOLTR:COM} -adv_options {VCCI_1.8_VOLTR:COM} -adv_options {VCCI_2.5_VOLTR:COM} -adv_options {VCCI_3.3_VOLTR:COM} -adv_options {VOLTR:COM} 
		source ./import/components/M2S090TS-FG484/AXI/import_component_and_constraints_sf2_eval_kit_ts_axi.tcl 
		save_project
        base_design_built
	}
} elseif {"$target" == "AXI"} then {
	if {[file exists $project_dir_axi] == 1} then { 
		project_exists
	} else {
		create_new_project_label_axi
		new_project -location $project_dir_axi -name $Libero_project_name_axi -project_description {} -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -hdl {VERILOG} -family {SmartFusion2} -die {M2S090TS} -package {484 FBGA} -speed {STD} -die_voltage {1.2} -part_range {COM} -adv_options {IO_DEFT_STD:LVCMOS 2.5V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {TEMPR:COM} -adv_options {UNUSED_MSS_IO_RESISTOR_PULL:None} -adv_options {VCCI_1.2_VOLTR:COM} -adv_options {VCCI_1.5_VOLTR:COM} -adv_options {VCCI_1.8_VOLTR:COM} -adv_options {VCCI_2.5_VOLTR:COM} -adv_options {VCCI_3.3_VOLTR:COM} -adv_options {VOLTR:COM} 
		source ./import/components/M2S090TS-FG484/AXI/import_component_and_constraints_sf2_eval_kit_ts_axi.tcl 
		save_project
        base_design_built
	}
} elseif {"$target" == "SYNTHESIZE"} then {
		invalid_argument
} elseif {"$target" == "PLACE_AND_ROUTE"} then {
		invalid_argument
} elseif {"$target" == "GENERATE_BITSTREAM"} then {
		invalid_argument
} elseif {"$target" == "EXPORT_PROGRAMMING_FILE"} then {
		invalid_argument
} else {
	if {[file exists $project_dir_ahb] == 1} then {
		project_exists
	} else {
		create_new_project_label_ahb
		new_project -location $project_dir_ahb -name $Libero_project_name_ahb -project_description {} -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -hdl {VERILOG} -family {SmartFusion2} -die {M2S090TS} -package {484 FBGA} -speed {STD} -die_voltage {1.2} -part_range {COM} -adv_options {IO_DEFT_STD:LVCMOS 2.5V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {TEMPR:COM} -adv_options {UNUSED_MSS_IO_RESISTOR_PULL:None} -adv_options {VCCI_1.2_VOLTR:COM} -adv_options {VCCI_1.5_VOLTR:COM} -adv_options {VCCI_1.8_VOLTR:COM} -adv_options {VCCI_2.5_VOLTR:COM} -adv_options {VCCI_3.3_VOLTR:COM} -adv_options {VOLTR:COM} 
		source ./import/components/M2S090TS-FG484/AHB/import_component_and_constraints_sf2_eval_kit_ts_ahb.tcl 
		save_project
        base_design_built
	}
}


if {"$design_flow_stage" == "SYNTHESIZE"} then {
    puts "-----------------------------------------------------------------------------------------------"
    puts "-------------------------Begin Synthesis---------------------------------------------"
    puts "-----------------------------------------------------------------------------------------------"

	# Configuring Place_and_Route tool for a timing pass.
	configure_tool -name {PLACEROUTE} -params {DELAY_ANALYSIS:MAX} -params {EFFORT_LEVEL:false} -params {INCRPLACEANDROUTE:false} -params {IOREG_COMBINING:true} -params {MULTI_PASS_CRITERIA:VIOLATIONS} -params {MULTI_PASS_LAYOUT:false} -params {NUM_MULTI_PASSES:5} -params {PDPR:false} -params {RANDOM_SEED:82287664} -params {REPAIR_MIN_DELAY:true} -params {SLACK_CRITERIA:WORST_SLACK} -params {SPECIFIC_CLOCK:} -params {START_SEED_INDEX:7} -params {STOP_ON_FIRST_PASS:false} -params {TDPR:true} 

	run_tool -name {SYNTHESIZE}
	save_project

    puts "-----------------------------------------------------------------------------------------------"
    puts "---------------------------Synthesis Complete-------------------------------------"
    puts "-----------------------------------------------------------------------------------------------"
	
} elseif {"$design_flow_stage" == "PLACE_AND_ROUTE"} then {

    puts "-----------------------------------------------------------------------------------------------"
    puts "----------------------Begin Place and Route--------------------------------------"
    puts "-----------------------------------------------------------------------------------------------"

	# Configuring Place_and_Route tool for a timing pass.
	configure_tool -name {PLACEROUTE} -params {DELAY_ANALYSIS:MAX} -params {EFFORT_LEVEL:false} -params {INCRPLACEANDROUTE:false} -params {IOREG_COMBINING:true} -params {MULTI_PASS_CRITERIA:VIOLATIONS} -params {MULTI_PASS_LAYOUT:false} -params {NUM_MULTI_PASSES:5} -params {PDPR:false} -params {RANDOM_SEED:82287664} -params {REPAIR_MIN_DELAY:true} -params {SLACK_CRITERIA:WORST_SLACK} -params {SPECIFIC_CLOCK:} -params {START_SEED_INDEX:7} -params {STOP_ON_FIRST_PASS:false} -params {TDPR:true} 
	
	run_tool -name {PLACEROUTE}
	save_project
	
    puts "-----------------------------------------------------------------------------------------------"
    puts "----------------------Place and Route Complete--------------------------------"
    puts "-----------------------------------------------------------------------------------------------"
	
} elseif {"$design_flow_stage" == "GENERATE_BITSTREAM"} then {

    puts "-----------------------------------------------------------------------------------------------"
    puts "----------------------------Generating Bitstream----------------------------------"
    puts "-----------------------------------------------------------------------------------------------"

	# Configuring Place_and_Route tool for a timing pass.
	configure_tool -name {PLACEROUTE} -params {DELAY_ANALYSIS:MAX} -params {EFFORT_LEVEL:false} -params {INCRPLACEANDROUTE:false} -params {IOREG_COMBINING:true} -params {MULTI_PASS_CRITERIA:VIOLATIONS} -params {MULTI_PASS_LAYOUT:false} -params {NUM_MULTI_PASSES:5} -params {PDPR:false} -params {RANDOM_SEED:82287664} -params {REPAIR_MIN_DELAY:true} -params {SLACK_CRITERIA:WORST_SLACK} -params {SPECIFIC_CLOCK:} -params {START_SEED_INDEX:7} -params {STOP_ON_FIRST_PASS:false} -params {TDPR:true} 
	
    run_tool -name {GENERATEPROGRAMMINGDATA}
    run_tool -name {GENERATEPROGRAMMINGFILE}
    save_project
	
    puts "-----------------------------------------------------------------------------------------------"
    puts "-------------------------------Bitstream Generated---------------------------------"
    puts "-----------------------------------------------------------------------------------------------"

} elseif {"$design_flow_stage" == "EXPORT_PROGRAMMING_FILE"} then {

    puts "-----------------------------------------------------------------------------------------------"
    puts "----------------------Exporting Programming Files----------------------------"
    puts "-----------------------------------------------------------------------------------------------"

	# Configuring Place_and_Route tool for a timing pass.
	configure_tool -name {PLACEROUTE} -params {DELAY_ANALYSIS:MAX} -params {EFFORT_LEVEL:false} -params {INCRPLACEANDROUTE:false} -params {IOREG_COMBINING:true} -params {MULTI_PASS_CRITERIA:VIOLATIONS} -params {MULTI_PASS_LAYOUT:false} -params {NUM_MULTI_PASSES:5} -params {PDPR:false} -params {RANDOM_SEED:82287664} -params {REPAIR_MIN_DELAY:true} -params {SLACK_CRITERIA:WORST_SLACK} -params {SPECIFIC_CLOCK:} -params {START_SEED_INDEX:7} -params {STOP_ON_FIRST_PASS:false} -params {TDPR:true} 
	
	# pre-requisite to enable exporting programming file function
		run_tool -name {GENERATEPROGRAMMINGDATA}
		run_tool -name {GENERATEPROGRAMMINGFILE}
	
	if {"$target" == "AHB"} then {
		export_prog_job \
			-job_file_name {SF2_EVAL_KIT_TS_MiV_AHB_BaseDesign} \
			-export_dir {./MiV_AHB_BD/designer/BaseDesign/export} \
			-bitstream_file_type {TRUSTED_FACILITY} \
			-bitstream_file_components {}
		save_project
		
	} else {
		export_prog_job \
			-job_file_name {SF2_EVAL_KIT_TS_MiV_AXI_BaseDesign} \
			-export_dir {./MiV_AXI_BD/designer/BaseDesign/export} \
			-bitstream_file_type {TRUSTED_FACILITY} \
			-bitstream_file_components {}
		save_project
	}
	
    puts "-----------------------------------------------------------------------------------------------"
    puts "--------------------Programming Files Exported-------------------------------"
    puts "-----------------------------------------------------------------------------------------------"

} else {
    puts "-----------------------------------------------------------------------------------------------"
    puts "------------No Design Flow  Stage Selected at run time------------------"
    puts "-----------------------------------------------------------------------------------------------"   

}
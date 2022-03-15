set projDir "D:/repos/alu_checkoff/work/vivado"
set projName "alu_checkoff"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/repos/alu_checkoff/work/verilog/au_top_0.v" "D:/repos/alu_checkoff/work/verilog/reset_conditioner_1.v" "D:/repos/alu_checkoff/work/verilog/button_conditioner_2.v" "D:/repos/alu_checkoff/work/verilog/edge_detector_3.v" "D:/repos/alu_checkoff/work/verilog/manualTester_4.v" "D:/repos/alu_checkoff/work/verilog/multiSevenSegment_5.v" "D:/repos/alu_checkoff/work/verilog/pipeline_6.v" "D:/repos/alu_checkoff/work/verilog/alu_7.v" "D:/repos/alu_checkoff/work/verilog/counter_8.v" "D:/repos/alu_checkoff/work/verilog/sevenSegment_9.v" "D:/repos/alu_checkoff/work/verilog/decoder_10.v" "D:/repos/alu_checkoff/work/verilog/adder_11.v" "D:/repos/alu_checkoff/work/verilog/boolean_12.v" "D:/repos/alu_checkoff/work/verilog/shifter_13.v" "D:/repos/alu_checkoff/work/verilog/compare_14.v" "D:/repos/alu_checkoff/work/verilog/multiplier_15.v" "D:/repos/alu_checkoff/work/verilog/minimum_16.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/repos/alu_checkoff/work/constraint/alchitry.xdc" "D:/repos/alu_checkoff/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

set projDir "C:/Users/fauza/Desktop/Echo2_final/work/vivado"
set projName "Echo2"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/fauza/Desktop/Echo2_final/work/verilog/au_top_0.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/reset_conditioner_1.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/button_conditioner_2.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/edge_detector_3.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/counter_4.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/game_miniBeta_5.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/pipeline_6.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/alu_16_7.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/addValue_8.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/game_cu_9.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/game_miniRegfile_10.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/arith_16_11.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/bool_16_12.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/shift_16_13.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/comp_16_14.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/multi_seven_seg_15.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/counter_16.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/seven_seg_17.v" "C:/Users/fauza/Desktop/Echo2_final/work/verilog/decoder_18.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "E:/Program\ Files/library/components/au.xdc" "C:/Users/fauza/Desktop/Echo2_final/work/constraint/io.xdc" "C:/Users/fauza/Desktop/Echo2_final/work/constraint/alchitry.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1

onerror {quit -f}
vlib work
vlog -work work DEMUX_1x2.vo
vlog -work work DEMUX_1x2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.DEMUX_1x2_vlg_vec_tst
vcd file -direction DEMUX_1x2.msim.vcd
vcd add -internal DEMUX_1x2_vlg_vec_tst/*
vcd add -internal DEMUX_1x2_vlg_vec_tst/i1/*
add wave /*
run -all

onerror {quit -f}
vlib work
vlog -work work FND_Decorder.vo
vlog -work work FND_Decorder.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.FND_Decorder_vlg_vec_tst
vcd file -direction FND_Decorder.msim.vcd
vcd add -internal FND_Decorder_vlg_vec_tst/*
vcd add -internal FND_Decorder_vlg_vec_tst/i1/*
add wave /*
run -all

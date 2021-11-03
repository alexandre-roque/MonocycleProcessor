transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/altera/projetos/Aula10/processadorNrisc {F:/altera/projetos/Aula10/processadorNrisc/processadorNrisc.v}
vlog -vlog01compat -work work +incdir+F:/altera/projetos/Aula10/processadorNrisc {F:/altera/projetos/Aula10/processadorNrisc/controle.v}
vlog -vlog01compat -work work +incdir+F:/altera/projetos/Aula10/processadorNrisc {F:/altera/projetos/Aula10/processadorNrisc/extensor.v}
vlog -vlog01compat -work work +incdir+F:/altera/projetos/Aula10/processadorNrisc {F:/altera/projetos/Aula10/processadorNrisc/mux.v}
vlog -vlog01compat -work work +incdir+F:/altera/projetos/Aula10/processadorNrisc {F:/altera/projetos/Aula10/processadorNrisc/ula.v}
vlog -vlog01compat -work work +incdir+F:/altera/projetos/Aula10/processadorNrisc {F:/altera/projetos/Aula10/processadorNrisc/registradores.v}
vlog -vlog01compat -work work +incdir+F:/altera/projetos/Aula10/processadorNrisc {F:/altera/projetos/Aula10/processadorNrisc/pc.v}
vlog -vlog01compat -work work +incdir+F:/altera/projetos/Aula10/processadorNrisc {F:/altera/projetos/Aula10/processadorNrisc/extensor5to8.v}
vlog -vlog01compat -work work +incdir+F:/altera/projetos/Aula10/processadorNrisc {F:/altera/projetos/Aula10/processadorNrisc/extensor2to8.v}

vlog -vlog01compat -work work +incdir+F:/altera/projetos/Aula10/processadorNrisc {F:/altera/projetos/Aula10/processadorNrisc/simula.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  simula

add wave *
view structure
view signals
run -all

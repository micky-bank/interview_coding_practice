vcs '-sverilog'  tb_byte2_pkt_finder.sv  byte2_pkt_finder.sv  -debug_access+nomemcbk+dmptf -debug_region+cell -l logfile -R +dumpvars+dump.vcd

# xrun -f design.sv -f testbench.sv -sysv -top testbench -run 500ns

#vlog -work work arbiter2.sv  
#vlog -work work tb_arbiter.sv
###################################################################

# Created by write_sdc on Mon Apr 21 15:17:26 2025

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
group_path -name FEEDTHROUGH  -from [list [get_ports data] [get_ports reset] [get_ports clk]]  -to [list [get_ports P] [get_ports N]]
group_path -name REGIN  -from [list [get_ports data] [get_ports reset] [get_ports clk]]
group_path -name REGOUT  -to [list [get_ports P] [get_ports N]]

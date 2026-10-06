onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tbw_rrc/clk
add wave -noupdate -format Literal -radix hexadecimal /tbw_rrc/inw0
add wave -noupdate -format Literal -radix hexadecimal /tbw_rrc/inw1
add wave -noupdate -format Literal -radix hexadecimal /tbw_rrc/outw0
add wave -noupdate -format Logic -radix hexadecimal /tbw_rrc/uut/ce_cf
add wave -noupdate -format Logic -radix hexadecimal /tbw_rrc/uut/ce_nf
add wave -noupdate -format Logic -radix hexadecimal /tbw_rrc/uut/ce_ovf
add wave -noupdate -format Logic -radix hexadecimal /tbw_rrc/uut/ce_zf
add wave -noupdate -format Logic -radix hexadecimal /tbw_rrc/uut/cf
add wave -noupdate -format Logic -radix hexadecimal /tbw_rrc/uut/nf
add wave -noupdate -format Logic -radix hexadecimal /tbw_rrc/uut/ovf
add wave -noupdate -format Logic -radix hexadecimal /tbw_rrc/uut/zf
add wave -noupdate -format Literal -radix binary /tbw_rrc/uut/aluop
add wave -noupdate -format Literal -radix hexadecimal /tbw_rrc/uut/u_file_regs/wrreg
add wave -noupdate -format Literal -radix hexadecimal /tbw_rrc/uut/u_file_regs/wrdata
add wave -noupdate -format Literal -radix hexadecimal /tbw_rrc/uut/u_file_regs/s16regs16
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {997286 ps} {1000143 ps}

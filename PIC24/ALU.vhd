----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:09:40 04/09/2023 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( 
			Clk: in STD_LOGIC;
			RdData1 : in  STD_LOGIC_VECTOR (15 downto 0); -- read data 1  instr(18-15)  registru baza
         RdData2 : in  STD_LOGIC_VECTOR (15 downto 0); -- read data 2 inst(3-0) registru sursa
         ALUOP : in  STD_LOGIC_VECTOR (2 downto 0); -- generat folosind opcode
         Y : out  STD_LOGIC_VECTOR (15 downto 0);
         ZF : out  STD_LOGIC;  -- z flag
		   NF : out STD_LOGIC; -- n flag
			CF : out std_logic;  --c flag
         OVF : out std_logic; --ovf flag
         CE_ZF : in std_logic;   --flags enable
         CE_NF : in std_logic;
         CE_OVF : in std_logic;
         CE_CF : in std_logic
              );
end ALU;

architecture Behavioral of ALU is


signal OP1 : std_logic_vector(16 downto 0); --semnal op1 
signal OP2 : std_logic_vector(16 downto 0); --semnal op2
signal sY : std_logic_vector(16 downto 0); -- Y va fii o copie a lui sY
signal sZ : std_logic;  
signal sN : std_logic;
signal sOV : std_logic;
signal Carry :std_logic;
signal Shift :std_logic_vector(15 downto 0);
signal FFoneL: std_logic_vector(16 downto 0); --FF1L 

begin

-- asignare operanzi
OP1 <= '0' & RdData1 when ALUOP = "000" else '1' & RdData1;
OP2 <= '0' & RdData2;

Y <= sY(15 downto 0);
-- nf flag bit semn
NF <= sY(15) when rising_edge(Clk) and CE_NF = '1';
-- zf flag iesire 0
ZF <= sZ when rising_edge(Clk) and CE_ZF = '1';
-- ovf flag depasire de format
OVF <= sOV when rising_edge(Clk) and CE_OVF = '1';
-- carry 
Carry <= sY(16) when rising_edge(Clk)and CE_CF = '1';
CF <= Carry ;


--FF1L Ws,Wnd

Shift <= x"0001" when OP2(15)='1' else
			 x"0002" when OP2(14)='1' else
			 x"0003" when OP2(13)='1' else
			 x"0004" when OP2(12)='1' else
			 x"0005" when OP2(11)='1' else
			 x"0006" when OP2(10)='1' else
			 x"0007" when OP2(9)='1' else
			 x"0008" when OP2(8)='1' else
			 x"0009" when OP2(7)='1' else
			 x"000A" when OP2(6)='1' else
			 x"000B" when OP2(5)='1' else
			 x"000C" when OP2(4)='1' else
			 x"000D" when OP2(3)='1' else
			 x"000E" when OP2(2)='1' else
			 x"000F" when OP2(1)='1' else
			 x"0010" when OP2(0)='1' else
			 x"0000";
		FFoneL <= '1' & Shift when Shift = x"0000" else
					 '0' & Shift;
		
with ALUOP select
     sY <= (OP1 + OP2) when "000",  -- ADD Wb,Ws,Wd 
           (OP1 - OP2) when "001", -- SUB Wb,Ws,Wd
           (OP1 and OP2) when "010", --AND Wb,Ws,Wd
           (OP1 or OP2) when "011",  -- IOR Wb, Ws, Wd
			  '0' & x"FFFF" when "101",			  --setM WD seteaza toti biti pe 1 ai registrului specificat destinatie
			  OP2(0) & Carry & OP2(15 downto 1) when "111",   -- rrc WS,WD deplaseaza bitul cel mai putin semnificativ din registru sursa spre dreapta prin C si este plasat pe pozitia cea mai semnificativa, iar c este subscris cu bitul cel mai putin semnificativ 
			  FFoneL when "100", -- gaseste primul bit de 1 si semnalizeaza prin carry, 0 a gasit, 1 nu a gasit
			  (OP1 - OP2 - not(Carry)) when "110",  --SUBB Wb,Ws,Wd
			  '0' & x"0000" when others;


sZ  <= '1' when sY(15 downto 0 )= x"0000" else '0';

sOV <= '1' when(OP1(15)='0' and OP2(15)='0' and sY(15)='1' and ALUOP="000") OR  -- adunam doi operanzi pozitivi si ne rezulta negativ
  (OP1(15)='1'  and OP2(15)='1' and sY(15)='0' and ALUOP="000") OR --adunam doi operanzi negativi si ne rezulta pozitiv
  (OP1(15)='0'  and OP2(15)='1' and sY(15)='1' and (ALUOP="001" OR ALUOP="110")) OR --scadem dintr-un pozitiv un negativ si rezultatul este negativ
  (OP1(15)='1'  and OP2(15)='0' and sY(15)='0' and (ALUOP="001" OR ALUOP="110")) --scadam dintr-un negativ un pozitiv si rezultatul este pozitiv
else '0';

end Behavioral;

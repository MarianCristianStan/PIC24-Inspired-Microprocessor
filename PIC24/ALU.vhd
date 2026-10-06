----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date:    
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

entity ALU is
    Port (
			  RdData1 : in  STD_LOGIC_VECTOR (15 downto 0); 
           Clk: in STD_LOGIC;
           RdData2 : in  STD_LOGIC_VECTOR (15 downto 0); 
           ALUOP : in  STD_LOGIC_VECTOR (2 downto 0); 
           CE_ZF : in std_logic; 
           CE_NF : in std_logic;
           CE_OVF : in std_logic;
           CE_CF : in std_logic;
           NF : out STD_LOGIC; 
           CF : out std_logic;
           OVF : out std_logic;
           ZF : out  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (15 downto 0);
			  LIT5 : in STD_LOGIC_VECTOR (4 downto 0);
			  LLIT5 : in STD_LOGIC_VECTOR (4 downto 0);
			  LIT10 : in std_logic_vector(9 downto 0)
            );
				
				
				
end ALU;

architecture Behavioral of ALU is
signal OP1 : std_logic_vector(16 downto 0); 
signal OP2 : std_logic_vector(16 downto 0); 
signal sY : std_logic_vector(16 downto 0);
signal sZ : std_logic; 
signal sN : std_logic;
signal sOV : std_logic;
signal sC : std_logic;
signal Carry: std_logic; 
signal sShift: std_logic_vector (4 downto 0);
signal sLSR: std_logic_vector (15 downto 0);
signal dLSR: std_logic_vector (16 downto 0);
signal cCary: std_logic;
signal sSUBBR : std_logic_vector (16 downto 0);
signal sXOR : std_logic_vector (15 downto 0);
signal sADDC : std_logic_vector (15 downto 0);



begin

	 OP1 <= '0'& RdData1 when ALUOP = "000" else '1' & RdData1;
	 OP2 <= '0'& RdData2;
    
	 ZF <= '1' when (RdData1 = RdData2) else '0';
	 sZ  <= '1' when sY(15 downto 0)=x"0000" else '0';
	 sOV <= '1' when(OP1(15)='0' and OP2(15)='0' and sY(15)='1' and ALUOP="000") OR
    (OP1(15)='1'  and OP2(15)='1' and sY(15)='0' and ALUOP="000") OR
    (OP1(15)='0'  and OP2(15)='1' and sY(15)='1' and ALUOP="001") OR
    (OP1(15)='1'  and OP2(15)='0' and sY(15)='0' and ALUOP="001")
     else '0';
   
	
	with ALUOP select 
        sY <=  ('0'&OP1 + '0'&OP2) when "000",
               ('0'&OP2 - '0'&OP1) when "001",
               ('1'&OP1 and '1'&OP2) when "010",
               ('0'&OP1 or '0'&OP2) when "011",
					 '0'&LIT5 - '1'&RdData2 when "100",
					 dLSR when "101",
					 '1'&sXOR when others;
					
					
--LSR, Wb, Wns, Wnd

sShift <= RdData1 (4 downto 0);
sLSR <= RdData2 when sShift = "00000" else
'0' & RdData2(15 downto 1) when conv_integer(sShift) = 1 else
"00" & RdData2(15 downto 2) when conv_integer(sShift) = 2 else
"000" & RdData2(15 downto 3) when conv_integer(sShift) = 3 else
"0000" & RdData2(15 downto 4) when conv_integer(sShift) = 4 else
"00000" & RdData2(15 downto 5) when conv_integer(sShift) = 5 else
"000000" & RdData2(15 downto 6) when conv_integer(sShift) = 6 else
"0000000" & RdData2(15 downto 7) when conv_integer(sShift) = 7 else
"00000000" & RdData2(15 downto 8) when conv_integer(sShift) = 8 else
"000000000" & RdData2(15 downto 9) when conv_integer(sShift) = 9 else
"0000000000" & RdData2(15 downto 10) when conv_integer(sShift) = 10 else
"00000000000" & RdData2(15 downto 11) when conv_integer(sShift) = 11 else
"000000000000" & RdData2(15 downto 12) when conv_integer(sShift) = 12 else
"0000000000000" & RdData2(15 downto 13) when conv_integer(sShift) = 13 else
"00000000000000" & RdData2(15 downto 14) when conv_integer(sShift) = 14 else
"000000000000000" & RdData2(15 downto 15) when conv_integer(sShift) = 15 else
"0000000000000000";
dLSR<= '0' & sLSR;

--SUBBR Wb,#lit5,Wd;

sY <='0' & sY(15 downto 0);
sC <= sY(16) when rising_edge(Clk) and CE_CF = '1';

--ADDC Wb,#lit5,Wd;

sADDC <= (RdData2 + "00000000000"&LLIT5 + sC);

--XOR #lit10,Wn;

sXOR <= (RdData1 xor "000000"&LIT10);

end Behavioral;

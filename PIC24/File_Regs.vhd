----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:08 11/16/2023 
-- Design Name: 
-- Module Name:    File_Regs - Behavioral 
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

entity File_Regs is
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           RdReg1 : in  STD_LOGIC_VECTOR (3 downto 0);
           RdReg2 : in  STD_LOGIC_VECTOR (3 downto 0);
           WrReg : in  STD_LOGIC_VECTOR (3 downto 0);
           WrData : in  STD_LOGIC_VECTOR (15 downto 0);
           RdData1 : out  STD_LOGIC_VECTOR (15 downto 0);
           RdData2 : out  STD_LOGIC_VECTOR (15 downto 0));
end File_Regs;

architecture Behavioral of File_Regs is

type tRegs is array (0 to 15) of std_logic_vector(15 downto 0);
signal s16Regs16 : tRegs;
signal RdData1_lcl : std_logic_vector(15 downto 0);
signal RdData2_lcl : std_logic_vector(15 downto 0);


begin

RdData1_lcl <= s16Regs16(conv_integer(RdReg1));
RdData2_lcl <= s16Regs16(conv_integer(RdReg2));

s16Regs16 (conv_integer(WrReg)) <= WrData when rising_edge (Clk) and WrEn = '1';
RdData1 <= RdData1_lcl;
RdData2 <= RdData2_lcl;

end Behavioral;


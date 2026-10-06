----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:23:22 04/01/2023 
-- Design Name: 
-- Module Name:    PC_Update - Behavioral 
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

entity PC_Update is
 Port ( 
     PC : in  STD_LOGIC_VECTOR (5 downto 0);
     Offset : in STD_LOGIC_VECTOR(4 downto 0); --depl
     Branch : in STD_LOGIC;
     BranchType : in STD_LOGIC_VECTOR (2 downto 0);
     New_PC : out  STD_LOGIC_VECTOR (5 downto 0);
     OVF : in STD_LOGIC;
     CF  : in STD_LOGIC;
     NF  : in STD_LOGIC;
     ZF  : in STD_LOGIC

              );
end PC_Update;

architecture Behavioral of PC_Update is

signal PC_p2 : STD_LOGIC_VECTOR(5 downto 0);
signal depl : std_logic_vector (5 downto 0); --deplasament

begin

PC_p2 <= PC + 2;
depl <= Offset & '0';


    New_PC <= PC_p2 + depl when Branch = '1' and BranchType = "111" else  --BRA
              PC_p2 + depl when Branch = '1' and BranchType = "000" and OVF = '1' else  --BRA OV
				  PC_p2 + depl when Branch = '1' and BranchType = "001" and CF = '1' else   --BRA C
              PC_p2 + depl when Branch = '1' and BranchType = "011" and NF = '1' else   --BRA N
              PC_p2 + depl when Branch = '1' and BranchType = "010" and ZF = '1' else   --BRA Z
              PC_p2;

end Behavioral;
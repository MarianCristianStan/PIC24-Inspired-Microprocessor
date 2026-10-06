----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    ctrl - Behavioral 
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

entity ctrl is
    Port ( OP 		 : in std_logic_vector (4 downto 0);
			  ALUOP   : out std_logic_vector (2 downto 0);
           MemWr 	 : out std_logic;
           Mem2Reg : out std_logic;
           RegWr 	 : out std_logic;
           RegDest : out std_logic;
			  RegBase : out std_logic;
			  Branch  : out std_logic;
           CE_ZF : out std_logic; --flag enable
           CE_NF : out std_logic;--flag enable
           CE_OVF : out std_logic;--flag enable
           CE_CF : out std_logic
			  );--flag enable
end ctrl;

architecture Behavioral of ctrl is 

begin

	MemWr <= '1' when OP = b"10001" else '0'; 
	
	Mem2Reg <= '1' when OP = b"10000" else '0'; 
	
	RegWr <= '0' when OP = "10001" or OP = "00110" else '1'; 
	
	RegBase <= '0' when OP = "11011" else '1';
	
	RegDest <= '0' when OP = "10000" else '1'; 
			
	CE_ZF <= '1' when (OP = "01000" or   -- ADD Wb, Ws, Wd
						    OP = "01010"  or  -- SUB Wb, Ws, Wd
						    OP = "01100"  or	 --AND Wb, Ws, Wd
						    OP = "01110"  or  --IOR Wb, Ws, Wd
							 OP = "11010" or	 --LSR Wb,Wns,Wnd
							 OP = "00011" or	 --SUBBR Wb,#lit5,Wd
							 OP = "01001" or   --ADDC Wb,#lit5,Wd
							 OP = "10110") else   --XOR #lit10,Wn
						  '0';
						  
	CE_NF <= '1' when (OP = "01000" or     -- ADD Wb, Ws, Wd
	                   OP = "01010" or     -- SUB Wb, Ws, Wd
	                   OP = "01100" or     -- AND Wb, Ws, Wd
	                   OP = "01110" or     -- IOR Wb, Ws, Wd 
	                   OP = "11010" or     --LSR Wb,Wns,Wnd
	                   OP = "00011" or	   --SUBBR Wb,#lit5,Wd
							 OP = "01001" or     --ADDC Wb,#lit5,Wd
							 OP = "10110") else  --XOR #lit10,Wn
						   '0';
  		  
	CE_OVF <= '1' when (OP = "01000" or   -- ADD Wb, Ws, Wd
	                 OP = "01010" or     -- SUB Wb, Ws, Wd
						  OP = "01001" or     -- ADDC Wb,#lit5,Wd
	                 OP = "00011") else     -- SUBBR Wb,#lit5,Wd
						  '0';        

   CE_CF <= '1' when (OP = "01000" or     -- ADD Wb, Ws, Wd
						    OP = "01010" or     -- SUB Wb, Ws, Wd
							 OP = "01001" or     -- ADDC Wb,#lit5,Wd
	                   OP = "00011") else  -- SUBBR Wb,#lit5,Wd
							'0';
		
	ALUOP <= "000" when OP = "01000" else    -- ADD Wb, Ws, Wd
			   "001" when OP = "01010" else    -- SUB Wb, Ws, Wd
			   "010" when OP = "01100" else  	-- AND Wb, Ws, Wd
			   "011" when OP = "01110" else    -- IOR Wb, Ws, Wd
			   "100" when OP = "11010" else    -- LSR Wb,Wns,Wnd
				"101" when OP = "00011" else    -- SUBBR Wb,#lit5,Wd
				"110" when OP = "01001" else    -- ADDC Wb,#lit5,Wd
			   "111" when OP = "10110";        -- XOR #lit10,Wn
				
	Branch <= '1' when (OP = "10100") else 
				 '0';
				 
end Behavioral;

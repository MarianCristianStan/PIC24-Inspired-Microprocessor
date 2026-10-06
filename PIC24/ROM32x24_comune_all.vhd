----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:45:30 04/01/2023 
-- Design Name: 
-- Module Name:    ROM32x32 - Behavioral 
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

entity ROM32x24 is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : out  STD_LOGIC_VECTOR (23 downto 0));
end ROM32x24;

architecture Behavioral of ROM32x24 is
type tROM is array (0 to 31) of std_logic_vector(23 downto 0);

constant ROM : tROM :=(			-- LOOP:  
              x"808101",  --0   mov 0x1020, w1 ;INW0=aaab  
				  x"808112",  --1   mov 0x1022, w2 ;INW1=5555  
				  x"408182",  --2   add w1,w2,w3  
				  x"508202",  --3   sub w1,w2,w4  
				  x"608282",  --4   and w1,w2,w5  
				  x"708302",  --5   ior w1,w2,w6  
				  x"888121",  --6   mov w1,0x1024  
				  x"888122",  --7   mov w2,0x1024  
				  x"888123",  --8   mov w3,0x1024  
				  x"888124",  --9   mov w4,0x1024  
				  x"888125",  --10  mov w5,0x1024  
				  x"888126",  --11  mov w6,0x1024  
				  x"37FFF3",  --12  bra LOOP
				  x"002000",  --13 
				  x"004000",  --14 
				  x"008000",  --15
				  x"010000",  --16
				  x"020000",  --17
				  x"040000",  --18
				  x"080000",  --19
				  x"100000",  --20
				  x"200000",  --21
				  x"400000",  --22
				  x"800000",  --23
				  x"000000",  --24
				  x"000000",  --25
				  x"000000",  --26
				  x"000000",  --27
				  x"000000",  --28
				  x"000000",  --29
				  x"000000",  --30
				  x"000000"  	--31
					);

begin

	Data <= ROM(conv_integer(Addr));
      


end Behavioral;


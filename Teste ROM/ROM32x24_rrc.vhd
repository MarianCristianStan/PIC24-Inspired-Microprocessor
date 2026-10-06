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

constant ROM : tROM :=(			--LOOP: 
              x"808101",  --0       mov 0x1020, w1 ;INW0=aaab
				  x"808112",  --1       mov 0x1022, w2 ;INW1=5555
				  x"408182",  --2       add w1,w2,w3 ; w3=0000 , c = 1 pregatire rrc c = 1
				  x"D38202",  --3       rrc w2,w4	;w4=aaaa, c = 1 , n = 1 , z = 0 
				  x"D38284",  --4       rrc w4,w5	;w5=d555 c = 0 , n = 1, z = 0  
				  x"D38305",  --5       rrc w5,w6;   w6 = 6aaa, c = 1 , n = 0 , z = 0; 
				  x"410383",  --6       add w2,w3,w7 ;w7 = 5555 c  = 0 pregatire pt z = 1
				  x"D38383",  --7       rrc w3,w7 ; w7 = 0000 , c = 0 , n = 0 , z = 1;
				  x"888121",  --8       mov w1, 0x1024  
				  x"888122",  --9       mov w2, 0x1024  
				  x"888123",  --10      mov w3, 0x1024  
				  x"888124",  --11      mov w4, 0x1024 
				  x"888125",  --12      mov w5, 0x1024 
				  x"888126",  --13      mov w6, 0x1024
				  x"888127",  --14      mov w7, 0x1024
				  x"37FFF0",  --15      bra LOOP
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


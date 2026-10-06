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

constant ROM : tROM :=(       --LOOP:  
              x"808101",  --0    mov 0x1020, w1 ;INW0=7fff  
				  x"808112",  --1    mov 0x1022, w2 ;INW1=0001  
				  x"408182",  --2    add w1,w2,w3 ;w3=8000, OV=1  
				  x"410402",  --3    add w2,w2,w8 ;w8=0002, OV=0  
				  x"418203",  --4    add w3,w3,w4 ;w4=0000, OV=1   
				  x"418402",  --5    add w3,w2,w8 ;w8=8001, OV=0   
				  x"510283",  --6    sub w2,w3,w5 ;w5=8001, OV=1  
				  x"508402",  --7    sub w1,w2,w8 ;w8=7ffe, OV=0  
				  x"528381",  --8    sub w5,w1,w7 ;w7=0002, OV=1  
				  x"608282",  --9    and w1,w2,w5 ;w5=0001, OV=1 nemodificat  
				  x"708302",  --10   ior w1,w2,w6 ;w6=7fff, OV=1 nemodificat  
				  x"888121",  --11   mov w1, 0x1024  
				  x"888122",  --12   mov w2, 0x1024  
				  x"888123",  --13   mov w3, 0x1024  
				  x"888124",  --14   mov w4, 0x1024  
				  x"888125",  --15   mov w5, 0x1024  
				  x"37FFEF",  --16   bra LOOP 
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


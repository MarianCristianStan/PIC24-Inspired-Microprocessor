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
              x"808101",  --0       mov 0x1020, w1 ;INW0=7fff
				  x"808112",  --1       mov 0x1022, w2 ;INW1=0001
				  x"410182",  --2       add w2,w2,w3 ; w3= 0002 , C=0 initializare c
				  x"590201",  --3       subb w2,w1,w4 ;w4=8001 , n=1, ov = 0, c = 0
				  x"300004",  --4       bra OV,STOP ; no jump to next ov=0
				  x"588284",  --5       subb w1,w4,w5; w5 = fffd, n=1, ov = 1 c = 0
				  x"590201",  --6       subb w2,w1,w4 ;w4=8001 , n=1, ov = 0, c = 0
				  x"5A0282",  --7       subb w4,w2,w5;w5=7fff n= 0 ov = 1 c = 1
				  x"300001",  --8       bra OV,NEXT ; jump to next ov =1 
				  x"37FFFF",  --9   STOP: bra STOP ; infinite loop
				  x"888121",  --10  NEXT: mov w1, 0x1024  
				  x"888122",  --11      mov w2, 0x1024  
				  x"888123",  --12      mov w3, 0x1024  
				  x"888124",  --13      mov w4, 0x1024  
				  x"888125",  --14      mov w5, 0x1024   
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


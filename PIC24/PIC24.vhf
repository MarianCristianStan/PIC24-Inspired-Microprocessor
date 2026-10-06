--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.04i
--  \   \         Application : sch2vhdl
--  /   /         Filename : PIC24.vhf
-- /___/   /\     Timestamp : 01/11/2024 21:42:10
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx92i\bin\nt\sch2vhdl.exe -intstyle ise -family aspartan3 -flat -suppress -w Z:/PROIECT/PIC24/PIC24.sch PIC24.vhf
--Design Name: PIC24
--Device: aspartan3
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity PIC24 is
   port ( Clk   : in    std_logic; 
          INW0  : in    std_logic_vector (15 downto 0); 
          INW1  : in    std_logic_vector (15 downto 0); 
          OUTW0 : out   std_logic_vector (15 downto 0));
end PIC24;

architecture BEHAVIORAL of PIC24 is
   signal ALUOP      : std_logic_vector (2 downto 0);
   signal ALUOut     : std_logic_vector (15 downto 0);
   signal Branch     : std_logic;
   signal BranchType : std_logic_vector (18 downto 16);
   signal CE_CF      : std_logic;
   signal CE_NF      : std_logic;
   signal CE_OVF     : std_logic;
   signal CE_ZF      : std_logic;
   signal CF         : std_logic;
   signal Instr      : std_logic_vector (23 downto 0);
   signal MemOut     : std_logic_vector (15 downto 0);
   signal MemWr      : std_logic;
   signal Mem2Reg    : std_logic;
   signal New_PC     : std_logic_vector (5 downto 0);
   signal NF         : std_logic;
   signal OVF        : std_logic;
   signal PC         : std_logic_vector (5 downto 0);
   signal RdData1    : std_logic_vector (15 downto 0);
   signal RegBase    : std_logic;
   signal RegDest    : std_logic;
   signal RegWr      : std_logic;
   signal RgData1    : std_logic_vector (15 downto 0);
   signal RgData2    : std_logic_vector (15 downto 0);
   signal WrData     : std_logic_vector (15 downto 0);
   signal XLXN_23    : std_logic_vector (3 downto 0);
   signal XLXN_25    : std_logic_vector (3 downto 0);
   signal ZF         : std_logic;
   component PC_Update
      port ( ZF         : in    std_logic; 
             OVF        : in    std_logic; 
             NF         : in    std_logic; 
             CF         : in    std_logic; 
             Branch     : in    std_logic; 
             Offset     : in    std_logic_vector (4 downto 0); 
             PC         : in    std_logic_vector (5 downto 0); 
             BranchType : in    std_logic_vector (2 downto 0); 
             New_PC     : out   std_logic_vector (5 downto 0));
   end component;
   
   component ProgCnt
      port ( Clk    : in    std_logic; 
             New_PC : in    std_logic_vector (5 downto 0); 
             PC     : out   std_logic_vector (5 downto 0));
   end component;
   
   component ROM32x24
      port ( Addr : in    std_logic_vector (4 downto 0); 
             Data : out   std_logic_vector (23 downto 0));
   end component;
   
   component MUX2V5
      port ( Sel : in    std_logic; 
             I0  : in    std_logic_vector (3 downto 0); 
             I1  : in    std_logic_vector (3 downto 0); 
             Y   : out   std_logic_vector (3 downto 0));
   end component;
   
   component File_Regs
      port ( Clk     : in    std_logic; 
             WrEn    : in    std_logic; 
             RdReg1  : in    std_logic_vector (3 downto 0); 
             RdReg2  : in    std_logic_vector (3 downto 0); 
             WrReg   : in    std_logic_vector (3 downto 0); 
             WRData  : in    std_logic_vector (15 downto 0); 
             RdData1 : out   std_logic_vector (15 downto 0); 
             RdData2 : out   std_logic_vector (15 downto 0));
   end component;
   
   component ALU
      port ( Clk     : in    std_logic; 
             CE_ZF   : in    std_logic; 
             CE_NF   : in    std_logic; 
             CE_OVF  : in    std_logic; 
             CE_CF   : in    std_logic; 
             RdData1 : in    std_logic_vector (15 downto 0); 
             RdData2 : in    std_logic_vector (15 downto 0); 
             ALUOP   : in    std_logic_vector (2 downto 0); 
             LIT5    : in    std_logic_vector (4 downto 0); 
             LLIT5   : in    std_logic_vector (4 downto 0); 
             LIT10   : in    std_logic_vector (9 downto 0); 
             NF      : out   std_logic; 
             CF      : out   std_logic; 
             OVF     : out   std_logic; 
             ZF      : out   std_logic; 
             Y       : out   std_logic_vector (15 downto 0));
   end component;
   
   component DataMem
      port ( Clk     : in    std_logic; 
             Wr      : in    std_logic; 
             INW0    : in    std_logic_vector (15 downto 0); 
             INW1    : in    std_logic_vector (15 downto 0); 
             Addr    : in    std_logic_vector (4 downto 0); 
             DataIn  : in    std_logic_vector (15 downto 0); 
             OUTW0   : out   std_logic_vector (15 downto 0); 
             DataOut : out   std_logic_vector (15 downto 0));
   end component;
   
   component MUX2V16
      port ( Sel : in    std_logic; 
             I0  : in    std_logic_vector (15 downto 0); 
             I1  : in    std_logic_vector (15 downto 0); 
             Y   : out   std_logic_vector (15 downto 0));
   end component;
   
   component ctrl
      port ( OP      : in    std_logic_vector (4 downto 0); 
             MemWr   : out   std_logic; 
             Mem2Reg : out   std_logic; 
             RegWr   : out   std_logic; 
             RegDest : out   std_logic; 
             RegBase : out   std_logic; 
             Branch  : out   std_logic; 
             CE_ZF   : out   std_logic; 
             CE_NF   : out   std_logic; 
             CE_OVF  : out   std_logic; 
             CE_CF   : out   std_logic; 
             ALUOP   : out   std_logic_vector (2 downto 0));
   end component;
   
begin
   XLXI_1 : PC_Update
      port map (Branch=>Branch,
                BranchType(2 downto 0)=>BranchType(18 downto 16),
                CF=>CF,
                NF=>NF,
                Offset(4 downto 0)=>Instr(4 downto 0),
                OVF=>OVF,
                PC(5 downto 0)=>PC(5 downto 0),
                ZF=>ZF,
                New_PC(5 downto 0)=>New_PC(5 downto 0));
   
   XLXI_2 : ProgCnt
      port map (Clk=>Clk,
                New_PC(5 downto 0)=>New_PC(5 downto 0),
                PC(5 downto 0)=>PC(5 downto 0));
   
   XLXI_3 : ROM32x24
      port map (Addr(4 downto 0)=>PC(5 downto 1),
                Data(23 downto 0)=>Instr(23 downto 0));
   
   XLXI_4 : MUX2V5
      port map (I0(3 downto 0)=>Instr(10 downto 7),
                I1(3 downto 0)=>Instr(3 downto 0),
                Sel=>RegDest,
                Y(3 downto 0)=>XLXN_23(3 downto 0));
   
   XLXI_5 : MUX2V5
      port map (I0(3 downto 0)=>Instr(18 downto 15),
                I1(3 downto 0)=>Instr(14 downto 11),
                Sel=>RegBase,
                Y(3 downto 0)=>XLXN_25(3 downto 0));
   
   XLXI_6 : File_Regs
      port map (Clk=>Clk,
                RdReg1(3 downto 0)=>Instr(3 downto 0),
                RdReg2(3 downto 0)=>XLXN_25(3 downto 0),
                WRData(15 downto 0)=>WrData(15 downto 0),
                WrEn=>RegWr,
                WrReg(3 downto 0)=>XLXN_23(3 downto 0),
                RdData1(15 downto 0)=>RgData1(15 downto 0),
                RdData2(15 downto 0)=>RgData2(15 downto 0));
   
   XLXI_8 : ALU
      port map (ALUOP(2 downto 0)=>ALUOP(2 downto 0),
                CE_CF=>CE_CF,
                CE_NF=>CE_NF,
                CE_OVF=>CE_OVF,
                CE_ZF=>CE_ZF,
                Clk=>Clk,
                LIT5(4 downto 0)=>Instr(4 downto 0),
                LIT10(9 downto 0)=>Instr(9 downto 0),
                LLIT5(4 downto 0)=>Instr(4 downto 0),
                RdData1(15 downto 0)=>RgData1(15 downto 0),
                RdData2(15 downto 0)=>RgData2(15 downto 0),
                CF=>CF,
                NF=>NF,
                OVF=>OVF,
                Y(15 downto 0)=>ALUOut(15 downto 0),
                ZF=>ZF);
   
   XLXI_9 : DataMem
      port map (Addr(4 downto 0)=>Instr(8 downto 4),
                Clk=>Clk,
                DataIn(15 downto 0)=>RdData1(15 downto 0),
                INW0(15 downto 0)=>INW0(15 downto 0),
                INW1(15 downto 0)=>INW1(15 downto 0),
                Wr=>MemWr,
                DataOut(15 downto 0)=>MemOut(15 downto 0),
                OUTW0(15 downto 0)=>OUTW0(15 downto 0));
   
   XLXI_10 : MUX2V16
      port map (I0(15 downto 0)=>ALUOut(15 downto 0),
                I1(15 downto 0)=>MemOut(15 downto 0),
                Sel=>Mem2Reg,
                Y(15 downto 0)=>WrData(15 downto 0));
   
   XLXI_11 : ctrl
      port map (OP(4 downto 0)=>Instr(23 downto 19),
                ALUOP(2 downto 0)=>ALUOP(2 downto 0),
                Branch=>Branch,
                CE_CF=>CE_CF,
                CE_NF=>CE_NF,
                CE_OVF=>CE_OVF,
                CE_ZF=>CE_ZF,
                MemWr=>MemWr,
                Mem2Reg=>Mem2Reg,
                RegBase=>RegBase,
                RegDest=>RegDest,
                RegWr=>RegWr);
   
end BEHAVIORAL;



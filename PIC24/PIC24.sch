VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "aspartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL New_PC(5:0)
        SIGNAL PC(5:0)
        SIGNAL ZF
        SIGNAL OVF
        SIGNAL NF
        SIGNAL CF
        SIGNAL BranchType(18:16)
        SIGNAL XLXN_9(5:0)
        SIGNAL PC(5:1)
        SIGNAL Instr(23:0)
        SIGNAL Branch
        SIGNAL Instr(10:7)
        SIGNAL Instr(3:0)
        SIGNAL RegDest
        SIGNAL Instr(18:15)
        SIGNAL Instr(14:11)
        SIGNAL RegBase
        SIGNAL Instr(23:19)
        SIGNAL Instr(4:0)
        SIGNAL Clk
        SIGNAL XLXN_23(3:0)
        SIGNAL XLXN_25(3:0)
        SIGNAL RegWr
        SIGNAL MemWr
        SIGNAL Mem2Reg
        SIGNAL ALUOP(2:0)
        SIGNAL CE_ZF
        SIGNAL CE_NF
        SIGNAL CE_OVF
        SIGNAL CE_CF
        SIGNAL RgData1(15:0)
        SIGNAL RgData2(15:0)
        SIGNAL INW0(15:0)
        SIGNAL INW1(15:0)
        SIGNAL OUTW0(15:0)
        SIGNAL MemOut(15:0)
        SIGNAL ALUOut(15:0)
        SIGNAL RdData1(15:0)
        SIGNAL Instr(8:4)
        SIGNAL Instr(9:0)
        SIGNAL WrData(15:0)
        PORT Input Clk
        PORT Input INW0(15:0)
        PORT Input INW1(15:0)
        PORT Output OUTW0(15:0)
        BEGIN BLOCKDEF PC_Update
            TIMESTAMP 2024 1 11 18 59 19
            LINE N 112 208 52 208 
            LINE N 112 256 52 256 
            LINE N 112 304 52 304 
            LINE N 112 352 52 352 
            RECTANGLE N 52 388 112 412 
            LINE N 112 400 52 400 
            LINE N 112 16 52 16 
            LINE N 112 64 52 64 
            LINE N 112 112 52 112 
            LINE N 112 160 52 160 
            RECTANGLE N 372 -252 432 -228 
            LINE N 432 -240 372 -240 
            RECTANGLE N 48 -220 112 -196 
            LINE N 112 -208 48 -208 
            LINE N 112 -160 52 -160 
            LINE N 112 -80 52 -80 
            RECTANGLE N 52 -44 112 -20 
            LINE N 112 -32 52 -32 
            RECTANGLE N 112 -280 372 428 
        END BLOCKDEF
        BEGIN BLOCKDEF ProgCnt
            TIMESTAMP 2024 1 11 19 0 54
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF ROM32x24
            TIMESTAMP 2024 1 11 18 59 34
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V5
            TIMESTAMP 2024 1 11 18 59 10
            RECTANGLE N 64 -192 320 0 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF File_Regs
            TIMESTAMP 2024 1 11 18 58 43
            RECTANGLE N 64 -384 384 100 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 384 -364 448 -340 
            LINE N 384 -352 448 -352 
            RECTANGLE N 0 -204 64 -180 
            LINE N 64 -192 0 -192 
            RECTANGLE N 0 -140 64 -116 
            LINE N 64 -128 0 -128 
            RECTANGLE N 384 -316 448 -292 
            LINE N 384 -304 448 -304 
            RECTANGLE N 0 52 64 76 
            LINE N 64 64 0 64 
            RECTANGLE N 0 4 64 28 
            LINE N 64 16 0 16 
        END BLOCKDEF
        BEGIN BLOCKDEF ALU
            TIMESTAMP 2024 1 11 18 58 18
            LINE N 64 112 0 112 
            LINE N 64 192 0 192 
            LINE N 64 272 0 272 
            LINE N 64 352 0 352 
            LINE N 64 432 0 432 
            RECTANGLE N 0 500 64 524 
            LINE N 64 512 0 512 
            RECTANGLE N 0 580 64 604 
            LINE N 64 592 0 592 
            RECTANGLE N 0 660 64 684 
            LINE N 64 672 0 672 
            LINE N 320 112 384 112 
            LINE N 320 192 384 192 
            LINE N 320 272 384 272 
            LINE N 320 352 384 352 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -252 64 -228 
            LINE N 64 -240 0 -240 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
            RECTANGLE N 64 -320 320 688 
        END BLOCKDEF
        BEGIN BLOCKDEF DataMem
            TIMESTAMP 2024 1 11 18 58 29
            RECTANGLE N 0 68 64 92 
            LINE N 64 80 0 80 
            RECTANGLE N 0 132 64 156 
            LINE N 64 144 0 144 
            RECTANGLE N 384 132 448 156 
            LINE N 384 144 448 144 
            LINE N 64 16 0 16 
            RECTANGLE N 64 -240 384 188 
            LINE N 64 -208 0 -208 
            RECTANGLE N 0 -156 64 -132 
            LINE N 64 -144 0 -144 
            RECTANGLE N 384 -156 448 -132 
            LINE N 384 -144 448 -144 
            RECTANGLE N 0 -92 64 -68 
            LINE N 64 -80 0 -80 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V16
            TIMESTAMP 2024 1 11 18 58 57
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            RECTANGLE N 0 -60 64 -36 
            LINE N 64 -48 0 -48 
            RECTANGLE N 0 -124 64 -100 
            LINE N 64 -112 0 -112 
        END BLOCKDEF
        BEGIN BLOCKDEF ctrl
            TIMESTAMP 2024 1 11 18 59 43
            LINE N 320 96 384 96 
            LINE N 320 160 384 160 
            LINE N 320 224 384 224 
            LINE N 320 288 384 288 
            LINE N 320 352 384 352 
            LINE N 320 32 384 32 
            RECTANGLE N 0 -364 64 -340 
            LINE N 64 -352 0 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 64 -444 320 376 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 PC_Update
            PIN ZF ZF
            PIN OVF OVF
            PIN NF NF
            PIN CF CF
            PIN Branch Branch
            PIN Offset(4:0) Instr(4:0)
            PIN PC(5:0) PC(5:0)
            PIN BranchType(2:0) BranchType(18:16)
            PIN New_PC(5:0) New_PC(5:0)
        END BLOCK
        BEGIN BLOCK XLXI_2 ProgCnt
            PIN Clk Clk
            PIN New_PC(5:0) New_PC(5:0)
            PIN PC(5:0) PC(5:0)
        END BLOCK
        BEGIN BLOCK XLXI_3 ROM32x24
            PIN Addr(4:0) PC(5:1)
            PIN Data(23:0) Instr(23:0)
        END BLOCK
        BEGIN BLOCK XLXI_4 MUX2V5
            PIN Sel RegDest
            PIN I0(3:0) Instr(10:7)
            PIN I1(3:0) Instr(3:0)
            PIN Y(3:0) XLXN_23(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 MUX2V5
            PIN Sel RegBase
            PIN I0(3:0) Instr(18:15)
            PIN I1(3:0) Instr(14:11)
            PIN Y(3:0) XLXN_25(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_6 File_Regs
            PIN Clk Clk
            PIN WrEn RegWr
            PIN RdReg1(3:0) Instr(3:0)
            PIN RdReg2(3:0) XLXN_25(3:0)
            PIN WrReg(3:0) XLXN_23(3:0)
            PIN WRData(15:0) WrData(15:0)
            PIN RdData1(15:0) RgData1(15:0)
            PIN RdData2(15:0) RgData2(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_8 ALU
            PIN Clk Clk
            PIN CE_ZF CE_ZF
            PIN CE_NF CE_NF
            PIN CE_OVF CE_OVF
            PIN CE_CF CE_CF
            PIN RdData1(15:0) RgData1(15:0)
            PIN RdData2(15:0) RgData2(15:0)
            PIN ALUOP(2:0) ALUOP(2:0)
            PIN LIT5(4:0) Instr(4:0)
            PIN LLIT5(4:0) Instr(4:0)
            PIN LIT10(9:0) Instr(9:0)
            PIN NF NF
            PIN CF CF
            PIN OVF OVF
            PIN ZF ZF
            PIN Y(15:0) ALUOut(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_9 DataMem
            PIN Clk Clk
            PIN Wr MemWr
            PIN INW0(15:0) INW0(15:0)
            PIN INW1(15:0) INW1(15:0)
            PIN Addr(4:0) Instr(8:4)
            PIN DataIn(15:0) RdData1(15:0)
            PIN OUTW0(15:0) OUTW0(15:0)
            PIN DataOut(15:0) MemOut(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_10 MUX2V16
            PIN Sel Mem2Reg
            PIN I0(15:0) ALUOut(15:0)
            PIN I1(15:0) MemOut(15:0)
            PIN Y(15:0) WrData(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_11 ctrl
            PIN OP(4:0) Instr(23:19)
            PIN MemWr MemWr
            PIN Mem2Reg Mem2Reg
            PIN RegWr RegWr
            PIN RegDest RegDest
            PIN RegBase RegBase
            PIN Branch Branch
            PIN CE_ZF CE_ZF
            PIN CE_NF CE_NF
            PIN CE_OVF CE_OVF
            PIN CE_CF CE_CF
            PIN ALUOP(2:0) ALUOP(2:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        BEGIN INSTANCE XLXI_1 192 368 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_2 240 1216 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_6 2240 544 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_8 2944 416 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_9 3744 400 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_10 4592 448 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_11 1472 1696 R0
        END INSTANCE
        BEGIN BRANCH New_PC(5:0)
            WIRE 160 1024 160 1184
            WIRE 160 1184 240 1184
            WIRE 160 1024 624 1024
            WIRE 624 1024 704 1024
            WIRE 624 128 704 128
            WIRE 704 128 704 224
            WIRE 704 224 704 1024
            BEGIN DISPLAY 624 1024 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PC(5:0)
            WIRE 80 32 80 160
            WIRE 80 160 240 160
            WIRE 80 32 752 32
            WIRE 752 32 752 224
            WIRE 752 224 752 320
            WIRE 752 320 752 400
            WIRE 752 400 752 640
            WIRE 624 1120 720 1120
            WIRE 720 320 720 1120
            WIRE 720 320 752 320
            BEGIN DISPLAY 752 400 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ZF
            WIRE 192 576 224 576
            WIRE 224 576 240 576
            BEGIN DISPLAY 224 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OVF
            WIRE 192 624 224 624
            WIRE 224 624 240 624
            BEGIN DISPLAY 224 624 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH NF
            WIRE 192 672 224 672
            WIRE 224 672 240 672
            BEGIN DISPLAY 224 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CF
            WIRE 192 720 224 720
            WIRE 224 720 240 720
            BEGIN DISPLAY 224 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BranchType(18:16)
            WIRE 192 768 208 768
            WIRE 208 768 224 768
            WIRE 224 768 240 768
            BEGIN DISPLAY 224 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_3 896 256 R0
        END INSTANCE
        BUSTAP 752 224 848 224
        BEGIN BRANCH PC(5:1)
            WIRE 848 224 864 224
            WIRE 864 224 896 224
            BEGIN DISPLAY 864 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(23:0)
            WIRE 1280 224 1312 224
            WIRE 1312 224 1344 224
            WIRE 1344 224 1344 272
            WIRE 1344 272 1344 336
            WIRE 1344 336 1344 496
            WIRE 1344 496 1344 688
            WIRE 1344 688 1344 752
            WIRE 1344 752 1344 960
            WIRE 1344 960 1344 1008
            WIRE 1344 1008 1344 1056
            WIRE 1344 1056 1344 1120
            WIRE 1344 1120 1344 1344
            WIRE 1344 1344 1344 1616
            BEGIN DISPLAY 1312 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch
            WIRE 176 16 176 288
            WIRE 176 288 208 288
            WIRE 208 288 240 288
            WIRE 176 16 1952 16
            WIRE 1952 16 1952 1728
            WIRE 1856 1728 1952 1728
            BEGIN DISPLAY 208 288 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 336 1440 336
        BEGIN INSTANCE XLXI_4 1536 432 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_5 1536 848 R0
        END INSTANCE
        BUSTAP 1344 272 1440 272
        BEGIN BRANCH Instr(10:7)
            WIRE 1440 272 1456 272
            WIRE 1456 272 1536 272
            BEGIN DISPLAY 1456 272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(3:0)
            WIRE 1440 336 1472 336
            WIRE 1472 336 1536 336
            WIRE 1472 192 1472 336
            WIRE 1472 192 1984 192
            WIRE 1984 192 1984 352
            WIRE 1984 352 2240 352
            BEGIN DISPLAY 1472 336 ATTR Name
                ALIGNMENT SOFT-TCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegDest
            WIRE 1456 400 1504 400
            WIRE 1504 400 1536 400
            BEGIN DISPLAY 1504 400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 688 1440 688
        BUSTAP 1344 752 1440 752
        BEGIN BRANCH Instr(18:15)
            WIRE 1440 688 1472 688
            WIRE 1472 688 1536 688
            BEGIN DISPLAY 1472 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(14:11)
            WIRE 1440 752 1472 752
            WIRE 1472 752 1536 752
            BEGIN DISPLAY 1472 752 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBase
            WIRE 1472 816 1504 816
            WIRE 1504 816 1536 816
            BEGIN DISPLAY 1504 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 1344 1440 1344
        BEGIN BRANCH Instr(23:19)
            WIRE 1440 1344 1456 1344
            WIRE 1456 1344 1472 1344
            BEGIN DISPLAY 1456 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 496 1440 496
        BEGIN BRANCH Instr(4:0)
            WIRE 112 336 240 336
            WIRE 112 336 112 896
            WIRE 112 896 1072 896
            WIRE 1072 896 1520 896
            WIRE 1440 496 1520 496
            WIRE 1520 496 1520 896
            BEGIN DISPLAY 1072 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 192 1120 240 1120
        END BRANCH
        IOMARKER 192 1120 Clk R180 28
        BEGIN BRANCH XLXN_23(3:0)
            WIRE 1920 272 2080 272
            WIRE 2080 272 2080 560
            WIRE 2080 560 2240 560
        END BRANCH
        BEGIN BRANCH XLXN_25(3:0)
            WIRE 1920 688 2064 688
            WIRE 2064 416 2064 688
            WIRE 2064 416 2240 416
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 2144 192 2176 192
            WIRE 2176 192 2240 192
            BEGIN DISPLAY 2176 192 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 2144 256 2176 256
            WIRE 2176 256 2240 256
            BEGIN DISPLAY 2176 256 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 1856 1408 1904 1408
            WIRE 1904 1408 2016 1408
            BEGIN DISPLAY 1904 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 1856 1472 1904 1472
            WIRE 1904 1472 2016 1472
            BEGIN DISPLAY 1904 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 1856 1536 1904 1536
            WIRE 1904 1536 2016 1536
            BEGIN DISPLAY 1904 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegDest
            WIRE 1856 1600 1920 1600
            WIRE 1920 1600 2016 1600
            BEGIN DISPLAY 1920 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 1856 1664 1936 1664
            WIRE 1936 1664 2016 1664
            BEGIN DISPLAY 1936 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBase
            WIRE 1856 1792 1920 1792
            WIRE 1920 1792 2016 1792
            BEGIN DISPLAY 1920 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_ZF
            WIRE 1856 1856 1904 1856
            WIRE 1904 1856 2016 1856
            BEGIN DISPLAY 1904 1856 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_NF
            WIRE 1856 1920 1920 1920
            WIRE 1920 1920 2016 1920
            BEGIN DISPLAY 1920 1920 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_OVF
            WIRE 1856 1984 1920 1984
            WIRE 1920 1984 2016 1984
            BEGIN DISPLAY 1920 1984 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_CF
            WIRE 1856 2048 1920 2048
            WIRE 1920 2048 2016 2048
            BEGIN DISPLAY 1920 2048 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 2864 528 2912 528
            WIRE 2912 528 2944 528
            BEGIN DISPLAY 2912 528 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_ZF
            WIRE 2864 608 2912 608
            WIRE 2912 608 2944 608
            BEGIN DISPLAY 2912 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_NF
            WIRE 2864 688 2896 688
            WIRE 2896 688 2944 688
            BEGIN DISPLAY 2896 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_OVF
            WIRE 2864 768 2912 768
            WIRE 2912 768 2944 768
            BEGIN DISPLAY 2912 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_CF
            WIRE 2864 848 2912 848
            WIRE 2912 848 2944 848
            BEGIN DISPLAY 2912 848 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH NF
            WIRE 3328 528 3344 528
            WIRE 3344 528 3424 528
            BEGIN DISPLAY 3344 528 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CF
            WIRE 3328 608 3360 608
            WIRE 3360 608 3424 608
            BEGIN DISPLAY 3360 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OVF
            WIRE 3328 688 3360 688
            WIRE 3360 688 3424 688
            BEGIN DISPLAY 3360 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ZF
            WIRE 3328 768 3360 768
            WIRE 3360 768 3424 768
            BEGIN DISPLAY 3360 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 3648 192 3680 192
            WIRE 3680 192 3744 192
            BEGIN DISPLAY 3680 192 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 2832 320 2880 320
            WIRE 2880 320 2944 320
            BEGIN DISPLAY 2880 320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RgData1(15:0)
            WIRE 2688 192 2816 192
            WIRE 2816 128 2816 192
            WIRE 2816 128 2848 128
            WIRE 2848 128 2944 128
            BEGIN DISPLAY 2848 128 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RgData2(15:0)
            WIRE 2688 240 2832 240
            WIRE 2832 176 2832 240
            WIRE 2832 176 2864 176
            WIRE 2864 176 2944 176
            BEGIN DISPLAY 2864 176 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH INW0(15:0)
            WIRE 3712 256 3744 256
        END BRANCH
        IOMARKER 3712 256 INW0(15:0) R180 28
        BEGIN BRANCH INW1(15:0)
            WIRE 3712 320 3744 320
        END BRANCH
        IOMARKER 3712 320 INW1(15:0) R180 28
        BEGIN BRANCH OUTW0(15:0)
            WIRE 4192 256 4224 256
        END BRANCH
        IOMARKER 4224 256 OUTW0(15:0) R0 28
        BEGIN BRANCH MemWr
            WIRE 3648 416 3680 416
            WIRE 3680 416 3744 416
            BEGIN DISPLAY 3680 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemOut(15:0)
            WIRE 4192 544 4256 544
            WIRE 4256 544 4384 544
            WIRE 4384 336 4384 544
            WIRE 4384 336 4592 336
            BEGIN DISPLAY 4256 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 4512 288 4560 288
            WIRE 4560 288 4592 288
            BEGIN DISPLAY 4560 288 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOut(15:0)
            WIRE 3328 320 3392 320
            WIRE 3392 320 3392 672
            WIRE 3392 672 3584 672
            WIRE 3584 672 4256 672
            WIRE 4256 400 4256 672
            WIRE 4256 400 4592 400
            BEGIN DISPLAY 3584 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RdData1(15:0)
            WIRE 3680 544 3696 544
            WIRE 3696 544 3712 544
            WIRE 3712 544 3744 544
            BEGIN DISPLAY 3712 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 960 1440 960
        BUSTAP 1344 1008 1440 1008
        BUSTAP 1344 1056 1440 1056
        BUSTAP 1344 1120 1440 1120
        BEGIN BRANCH Instr(8:4)
            WIRE 1440 960 1520 960
            WIRE 1520 960 1520 1168
            WIRE 1520 1168 2240 1168
            WIRE 2240 1168 3376 1168
            WIRE 3376 480 3376 1168
            WIRE 3376 480 3744 480
            BEGIN DISPLAY 2240 1168 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(4:0)
            WIRE 1440 1008 2192 1008
            WIRE 2192 928 2192 1008
            WIRE 2192 928 2576 928
            WIRE 2576 928 2944 928
            BEGIN DISPLAY 2576 928 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(4:0)
            WIRE 1440 1056 2208 1056
            WIRE 2208 1008 2208 1056
            WIRE 2208 1008 2320 1008
            WIRE 2320 1008 2944 1008
            BEGIN DISPLAY 2320 1008 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(9:0)
            WIRE 1440 1120 2192 1120
            WIRE 2192 1088 2192 1120
            WIRE 2192 1088 2528 1088
            WIRE 2528 1088 2944 1088
            BEGIN DISPLAY 2528 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrData(15:0)
            WIRE 2160 32 2160 608
            WIRE 2160 608 2240 608
            WIRE 2160 32 5040 32
            WIRE 5040 32 5040 288
            WIRE 4976 288 5008 288
            WIRE 5008 288 5040 288
            BEGIN DISPLAY 5008 288 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC

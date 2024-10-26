`timescale 1ns/1ns

module ISA_TB ();

reg [20:0] TB_instruccion;
wire [31:0] TB_salida;

reg [20:0] codigoASM [0:20];

ISA DUV(.instruccion(TB_instruccion), .salida(TB_salida));

initial 
    begin
        $readmemb("CodigoASM", codigoASM);

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   2      7       0         2         3         1
        //  00010_00111_0_010_00011_1
        TB_instruccion = codigoASM[0];
        #200;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   3      4       0         2         4         1
        //  00111_00010_0_011_00000_1
        TB_instruccion = codigoASM[1];
        #100;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   6      1       0         2         5         1
        TB_instruccion = codigoASM[2];
        #100;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   7      2       0         3         0         1
        //  00111_00010_0_011_00000_1
        TB_instruccion = codigoASM[3];
        #100;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   2      5       0         3         1         1
        //  00010_00101_0_011_00001_1
        TB_instruccion = codigoASM[4];
        #100;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   1      3       0         3         2         1
        //  00001_00011_0_011_00010_1
        TB_instruccion = codigoASM[5];
        #100;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   4      6       0         0         6         1
        //  00100_00110_0_000_00110_1
        TB_instruccion = codigoASM[6];
        #100;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   0      2       0         1         7         1
        //  00000_00010_0_001_00111_1
        TB_instruccion = codigoASM[7];
        #100;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   4      5       0         4        10         1
        //  00100_00101_0_100_01010_1
        TB_instruccion = codigoASM[8];
        #100;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   X      X       X         X         0         0
        //  00000_1
        TB_instruccion = codigoASM[9];
        #100;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   X      X       X         X         3         0
        //  00011_1
        TB_instruccion = codigoASM[10];
        #100;

        //  OP1    Op2    WE_BR    ALU_OP    Dir_RAM    WE_RAM
        //   X      X       X         X        10         0
        //  01010_1
        TB_instruccion = codigoASM[11];
        #100;
        $stop;
    end

endmodule

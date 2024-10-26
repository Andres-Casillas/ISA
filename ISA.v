module ISA (
    input [20:0] instruccion,
    output [31:0] salida
);

wire [31:0] op1BR_op1ALU;
wire [31:0] op2BR_op2ALU;
wire [31:0] resALU_deRAM;

BR iBR (.DL1(instruccion[19:15]), .DL2(instruccion[14:10]), 
        .Dir(0), .Dato(0), 
        .WE(instruccion [9]), .op1(op1BR_op1ALU), .op2(op2BR_op2ALU));

ALU iALU (.Op1(op1BR_op1ALU), .Op2(op2BR_op2ALU), .AluOp(instruccion[8:6]), .Resultado(resALU_deRAM));

RAM iRAM (.WE(instruccion[0]), .Dir(instruccion[5:1]), .DatoEntrada(resALU_deRAM), .DatoLeido(salida));

endmodule
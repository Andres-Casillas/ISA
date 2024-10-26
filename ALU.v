`timescale 1ns/1ns

module ALU (
    input [31:0] Op1,
    input [31:0] Op2,
    input [2:0] AluOp,
    output reg [31:0] Resultado
);


always @*
    begin
        case (AluOp)
            3'b000:
            begin 
                Resultado = Op1 & Op2;
            end
            3'b001:
            begin
                Resultado = Op1 | Op2;
            end
            3'b010: 
            begin
                Resultado = Op1 + Op2;
            end
            3'b011: 
            begin
                Resultado = Op1 - Op2;
            end
            3'b100: 
            begin
                Resultado = Op1 > Op2 ? 1 : 0;
            end
        endcase
    end

endmodule
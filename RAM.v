`timescale 1ns/1ns

module RAM (
    input WE,
    input [4:0] Dir,
    input [31:0] DatoEntrada,
    output reg [31:0] DatoLeido
);

reg [31:0] memRAM[0:31];

always @*
    begin
        if (WE) begin
            memRAM[Dir] = DatoEntrada;
        end else begin
            DatoLeido = memRAM[Dir];
        end

    end
    
endmodule
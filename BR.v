`timescale 1ns/1ns

module BR (
    input [4:0] DL1,
    input [4:0] DL2,
    input [4:0] Dir,
    input [31:0] Dato,
    input WE,
    output reg [31:0] op1,
    output reg [31:0] op2
);

reg [31:0] memBR[0:31];

initial begin
    $readmemb("FILE", memBR);
end

always @*
    begin
        if (WE) begin
            memBR[Dir] = Dato;
        end

        op1 = memBR[DL1];
        op2 = memBR[DL2];
    end

endmodule
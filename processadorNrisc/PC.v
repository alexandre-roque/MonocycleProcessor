/*
Implementação em Verilog dos componentes do nRisc que armazenam estado.
Aluno: Alexandre Roque.
Disciplina: Arquitetura e Organização de Computadores.
Professor: Mateus Felipe Tymburibá Ferreira.
*/
module PC (proxPC, PC_exit, SinalEscPC, clock, reset);
    input SinalEscPC, clock, reset;
	 input [7:0] proxPC;
    reg [7:0] PC;
	 output [7:0] PC_exit;
	 
	 assign PC_exit = PC;
	 
    always 
        @(negedge clock) begin
        if (SinalEscPC)
            PC <= proxPC;
    end //always
	 
endmodule


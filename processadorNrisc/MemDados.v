/*
Implementação em Verilog dos componentes do nRisc que armazenam estado.
Aluno: Alexandre Roque.
Disciplina: Arquitetura e Organização de Computadores.
Professor: Mateus Felipe Tymburibá Ferreira.
*/
module MemDados(Endereco, DadoPraEscrever, DadoLido, LerMemoria, EscreveMemoria, clock, reset);
	input LerMemoria, EscreveMemoria, clock, reset;
	input [7:0] DadoPraEscrever, Endereco;
	integer i;
	output reg [7:0] DadoLido;
	reg [7:0] memoria [255:0];

	initial begin
		for(i=0;i<=255;i=i+1)
			memoria[i]=0;
	end//initial
	
	always  begin
			@(posedge clock)
			if (LerMemoria)
            DadoLido <= memoria[Endereco];
	
			@(negedge clock)
			if (EscreveMemoria)
            memoria[Endereco] = DadoPraEscrever;
    end
		
	
endmodule

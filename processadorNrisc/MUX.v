/*
Implementação em Verilog dos componentes do nRisc que armazenam estado.
Aluno: Alexandre Roque.
Disciplina: Arquitetura e Organização de Computadores.
Professor: Mateus Felipe Tymburibá Ferreira.
*/

module MUX(ResultA, ResultB, Chave, ResultFinal);
 
	input [7:0] ResultA, ResultB; 
	input Chave;
	output wire [7:0] ResultFinal;
	 
	assign ResultFinal = (Chave) ? ResultB : ResultA;
 
endmodule

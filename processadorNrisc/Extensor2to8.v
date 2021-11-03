/*
Implementação em Verilog dos componentes do nRisc que armazenam estado.
Aluno: Alexandre Roque.
Disciplina: Arquitetura e Organização de Computadores.
Professor: Mateus Felipe Tymburibá Ferreira.
*/

module Extensor2to8 (Not_Estendido, Estendido);
	input  [1:0] Not_Estendido;
	output [7:0] Estendido;
	assign Estendido = Not_Estendido;
endmodule

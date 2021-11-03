/*
Implementação em Verilog dos componentes do nRisc que armazenam estado.
Aluno: Alexandre Roque.
Disciplina: Arquitetura e Organização de Computadores.
Professor: Mateus Felipe Tymburibá Ferreira.
*/

module ULA(Dado1,Dado2,ULAOp,Result,Zero);
	
	input [7:0] Dado1,Dado2;
	input [2:0] ULAOp;
	
	output [7:0] Result;
	output Zero;
	
	reg [7:0] Resultado_ULA;
   reg zerotmp;
	
   assign Result = Resultado_ULA;
   assign Zero = zerotmp;
	 
   always @(*)
   begin // inicio
       case(ULAOp) //begin case
		 
			3'b000: // Addi
			Resultado_ULA = Dado1 + Dado2 ;
				
			3'b001: // Add
			Resultado_ULA = Dado1 + Dado2 ;
				
			3'b010: // Subi
			Resultado_ULA = Dado1 - Dado2 ;
				
			3'b011: // BEQ
			begin // inicio
				if(Dado2 == 0 | Dado1 == 0)
					zerotmp = 1;
				else
					zerotmp = 0;
			end// fim
			
			3'b101: // SW
			Resultado_ULA = Dado1 - Dado2 ;
			
			3'b111: // LI
			Resultado_ULA = Dado2 ;
			
			//3'b100: // JUMP
			//Resultado_ULA = 8'b00010110;
			
			
	  endcase // end case
    end //fim
endmodule

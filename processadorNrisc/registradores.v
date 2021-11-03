/*
Implementação em Verilog dos componentes do nRisc que armazenam estado.
Aluno: Alexandre Roque.
Disciplina: Arquitetura e Organização de Computadores.
Professor: Mateus Felipe Tymburibá Ferreira.
*/

module registradores(Reg1,Reg2,RegWrite,DadoPraEscrever,Reg1Write,Dado1,Dado2,clock,reset);
	 input [1:0] Reg1,Reg2,Reg1Write; // the register numbers to read or write
	 input [7:0] DadoPraEscrever; // data to write
	 input RegWrite, clock, reset; // the clock to trigger write
	 integer i;
	 
	 output [7:0] Dado1, Dado2; // the register values read
	 reg [7:0] banco [3:0]; // 4 registers each 8 bits long
	 
	 initial begin
       for(i=0;i<=3;i=i+1) 
          banco[i] = 0;
    end
	 
	 always begin
		 // write the register with new value if Regwrite is high
		 @(negedge clock) 
			if (RegWrite) 
				banco[Reg1Write] <= DadoPraEscrever;
	 end//always
	 
	 assign Dado1 = banco[Reg1];
	 assign Dado2 = banco[Reg2];
	 
	 
endmodule




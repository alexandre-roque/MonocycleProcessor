/*
Implementação em Verilog dos componentes do nRisc que armazenam estado.
Aluno: Alexandre Roque.
Disciplina: Arquitetura e Organização de Computadores.
Professor: Mateus Felipe Tymburibá Ferreira.
*/

module Controle (opcode,reset,EscPC, FonteReg, Jump, EscreverMemoria, 
									LerMemoria, ULAOp, ULAFonte, BEQ, RegWrite);

input[2:0] opcode;
input reset;
output reg[2:0] ULAOp;
output reg EscPC, FonteReg, Jump, EscreverMemoria, LerMemoria, ULAFonte, BEQ, RegWrite; 

	always @(*)
	begin
		case(opcode)

		3'b000: // ADDI
		begin
			EscPC 				<= 1'b1;		FonteReg 			<= 1'b0;
			Jump 					<= 1'b0;		EscreverMemoria	<= 1'b0;
			LerMemoria 			<= 1'b0;		ULAFonte				<= 1'b1;
			BEQ 					<= 1'b0;		RegWrite				<= 1'b1;
			ULAOp					<= 3'b000;		
		end
		
		3'b001: // ADD
		begin
			EscPC 				<= 1'b1;		FonteReg 			<= 1'b0;
			Jump 					<= 1'b0;		EscreverMemoria	<= 1'b0;
			LerMemoria 			<= 1'b0;		ULAFonte				<= 1'b0;
			BEQ 					<= 1'b0;		RegWrite				<= 1'b1;
			ULAOp					<= 3'b001;		
		end
		
		3'b010: // SUBI
		begin
			EscPC 				<= 1'b1;		FonteReg 			<= 1'b0;
			Jump 					<= 1'b0;		EscreverMemoria	<= 1'b0;
			LerMemoria 			<= 1'b0;		ULAFonte				<= 1'b1;
			BEQ 					<= 1'b0;		RegWrite				<= 1'b1;
			ULAOp					<= 3'b010;		
		end
		
		3'b011: // BEQ
		begin
			EscPC 				<= 1'b1;		FonteReg 			<= 1'b0;
			Jump 					<= 1'b0;		EscreverMemoria	<= 1'b0;
			LerMemoria 			<= 1'b0;		ULAFonte				<= 1'b1;
			BEQ 					<= 1'b1;		RegWrite				<= 1'b0;
			ULAOp					<= 3'b011;		
		end
		
		3'b100: // JUMP
		begin
			EscPC 				<= 1'b1;		FonteReg 			<= 1'b0;
			Jump 					<= 1'b1;		EscreverMemoria	<= 1'b0;
			LerMemoria 			<= 1'b0;		ULAFonte				<= 1'b1;
			BEQ 					<= 1'b0;		RegWrite				<= 1'b0;
			ULAOp					<= 3'b100;		
		end

		3'b110: // HALT
		begin
			EscPC 				<= 1'b0;		FonteReg 			<= 1'b0;
			Jump 					<= 1'b0;		EscreverMemoria	<= 1'b0;
			LerMemoria 			<= 1'b0;		ULAFonte				<= 1'b0;
			BEQ 					<= 1'b0;		RegWrite				<= 1'b0;
			ULAOp					<= 3'b000;		
		end
		
		3'b101: // SW
		begin
			EscPC 				<= 1'b1;		FonteReg 			<= 1'b0;
			Jump 					<= 1'b0;		EscreverMemoria	<= 1'b1;
			LerMemoria 			<= 1'b0;		ULAFonte				<= 1'b0;
			BEQ 					<= 1'b0;		RegWrite				<= 1'b0;
			ULAOp					<= 3'b101;		
		end
		
		3'b111: // LI
		begin
			EscPC 				<= 1'b1;		FonteReg 			<= 1'b1;
			Jump 					<= 1'b0;		EscreverMemoria	<= 1'b0;
			LerMemoria 			<= 1'b1;		ULAFonte				<= 1'b1;
			BEQ 					<= 1'b0;		RegWrite				<= 1'b1;
			ULAOp					<= 3'b111;		
		end

	endcase
end
endmodule

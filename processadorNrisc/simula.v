`include "MemInstrucao.v"
`include "MemDados.v"
//`include "processadorNrisc.v"

module simula;

	reg clock;
	wire [7:0] instr; 
	wire [7:0] DadoLido;
	wire [7:0] EnderecoInstrucaoPC;
	wire [7:0] Endereco;
	wire [7:0] DadoPraEscrever;
	wire EscreverMemoria, LerMemoria;

	//module MemInstrucao(Endereco, instr, clock);
	MemInstrucao memIns(EnderecoInstrucaoPC, instr, clock);

	//module MemDados(Endereco, DadoPraEscrever, DadoLido, LerMemoria, EscreverMemoria, clock, reset);
	MemDados memDados(Endereco, DadoPraEscrever, DadoLido, LerMemoria, EscreverMemoria, clock, reset);

	//module processadornrisc(instr, DadoLido, PC, Endereco, DadoPraEscrever, 
	//										clock, reset, EscreverMemoria, LerMemoria);
	processadorNrisc nrisc(instr, DadoLido, EnderecoInstrucaoPC, Endereco, DadoPraEscrever, clock, reset, EscreverMemoria, LerMemoria);
	
	initial
		begin
			nrisc.PC_module.PC = 20;
			
			memDados.memoria[0] = 8'b00001111;
			
			memIns.memoria[20]  = 8'b11100000; //li $s0, $s0, 15
			memIns.memoria[21]  = 8'b00001111; //addi $s1, $s1, 7
			memIns.memoria[22]  = 8'b01101011; //beq $s1, $zero, Sair
			memIns.memoria[23]  = 8'b00110000; //add $s2, $s2, $s0
			memIns.memoria[24]  = 8'b01001001; //subi $s1,$s1,1
			memIns.memoria[25]  = 8'b10110001; //sw $s2, 1
			memIns.memoria[26]  = 8'b10010110; //j LOOP
			memIns.memoria[3]   = 8'b11000000; //halt

			
			clock = 0;
			
		end
		
		initial
			begin
				forever
					begin       
						#1;	
						clock = ~clock;
			end //begin
		end //initial
		
		initial begin
		  forever
		  begin

			$display("");
			$display("+++++++++++++++++++++++++++++++++++++++++++++++++");
			
			
			$display("PC E INSTRUCAO");
			
			$display("Instrucao = %b", instr);
			$display("Clock = %b", clock);
			$display("PC = %b -> @d", nrisc.PC_module.PC,nrisc.PC_module.PC);
			
			$display("-------------------------------------------------");
			
			$display("Controle");
			$display("EscPC = %b", nrisc.controle.EscPC);
			$display("FonteReg = %b", nrisc.controle.FonteReg);
			$display("Jump = %b", nrisc.controle.Jump);
			$display("EscreverMemoria = %b", nrisc.controle.EscreverMemoria);
			$display("LerMemoria = %b", nrisc.controle.LerMemoria);
			$display("ULAFonte = %b", nrisc.controle.ULAFonte);
			$display("BEQ = %b", nrisc.controle.BEQ);
			$display("ULAOp = %b", nrisc.controle.ULAOp);
			
			$display("-------------------------------------------------");

			$display("Registradores");
			$display("Reg00 = %d", nrisc.banco_reg.banco[0]);
			$display("Reg01 = %d", nrisc.banco_reg.banco[1]);
			$display("Reg02 = %d", nrisc.banco_reg.banco[2]);
			$display("Reg03 = %d", nrisc.banco_reg.banco[3]);
			$display("Sinal RegWrite = %b", nrisc.banco_reg.RegWrite);
			$display("REG 1 = %d", nrisc.banco_reg.Reg1);
			$display("REG 2 = %d", nrisc.banco_reg.Reg2);
			$display("DadoPraEscrever = %d", nrisc.banco_reg.DadoPraEscrever);
			$display("RegEscrito = %d", nrisc.banco_reg.Reg1Write);
			$display("Dado1 = %d", nrisc.banco_reg.Dado1);
			$display("Dado2 = %d", nrisc.banco_reg.Dado2);
			
			
			/*$display("-------------------------------------------------");
			
			$display("MUX PREULA");
			$display("DADO A = %d", nrisc.muxPreULA.ResultA);
			$display("DADO B = %d", nrisc.muxPreULA.ResultB);
			$display("RESULTADO = %d", nrisc.muxPreULA.ResultFinal);
			$display("CHAVE = %d", nrisc.muxPreULA.Chave);*/
			
			$display("-------------------------------------------------");
			
			$display("ULA");
			$display("DADO 1 = %d", nrisc.Ula.Dado1);
			$display("DADO 2 = %d", nrisc.Ula.Dado2);
			$display("RESULT = %d", nrisc.Ula.Result);
			$display("ZERO   = %d", nrisc.Ula.Zero);	
	
			$display("-------------------------------------------------");
			
			$display("MEM_DADOS");

			$display("memoria[0] = %d     ", memDados.memoria[0]);
			$display("memoria[1] = %d     ", memDados.memoria[1]);
			$display("memoria[2] = %d     ", memDados.memoria[2]);
			
			//module MemDados(Endereco, DadoPraEscrever, DadoLido, LerMemoria, EscreveMemoria, clock, reset);
			/*$display("Endereco = %d     ", memDados.Endereco);
			$display("DadoLido = %d     ", memDados.DadoLido);
			$display("DadoEscrito = %d     ", memDados.DadoPraEscrever);
			$display("EscMEM = %d     ", memDados.EscreveMemoria);
			$display("LerMEM = %d     ", memDados.LerMemoria);
			
			$display("-------------------------------------------------");
			
			$display("MUX POSULA");
			$display("DADO A = %d", nrisc.muxPosULA.ResultA);
			$display("DADO B = %d", nrisc.muxPosULA.ResultB);
			$display("RESULTADO = %d", nrisc.muxPosULA.ResultFinal);
			$display("CHAVE = %d", nrisc.muxPosULA.Chave);
			
			$display("-------------------------------------------------");
			
			$display("MUX JUMP");
			$display("DADO A = %d", nrisc.muxJUMP.ResultA);
			$display("DADO B = %d", nrisc.muxJUMP.ResultB);
			$display("RESULTADO = %d", nrisc.muxJUMP.ResultFinal);
			$display("CHAVE = %d", nrisc.muxJUMP.Chave);*/
			
			$display("-------------------------------------------------");
			
			
			$display("+++++++++++++++++++++++++++++++++++++++++++++++++");
			$display("");
			#1;
			end
		  end
		
		
		initial
			begin
				forever
					begin       
						if(instr == 8'b11000000)
						$finish;
						#1;
			end //begin
		end //initial

endmodule

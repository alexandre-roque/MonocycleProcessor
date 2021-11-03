/*
Implementação em Verilog dos componentes do nRisc que armazenam estado.
Aluno: Alexandre Roque.
Disciplina: Arquitetura e Organização de Computadores.
Professor: Mateus Felipe Tymburibá Ferreira.
*/
module processadorNrisc(instr, DadoLido, PC, Endereco, DadoPraEscrever, clock, reset, EscreverMemoria, LerMemoria);

	input [7:0] instr, DadoLido;
	output [7:0] PC,Endereco,DadoPraEscrever;
	input clock,reset;
	output EscreverMemoria, LerMemoria;

	// Para a implementação do controle, precisamos de todos os sinais.

	wire EscPC, FonteReg, Jump, EscreverMemoria, LerMemoria, ULAFonte, BEQ, RegWrite;
	wire [2:0] ULAOp;

	//Controle (opcode,reset,EscPC, FonteReg, Jump, EscreverMemoria,LerMemoria, ULAOp, ULAFonte, BEQ, RegWrite);

	Controle controle(instr[7:5],reset,EscPC,FonteReg, Jump, EscreverMemoria, LerMemoria, ULAOp,ULAFonte, BEQ, RegWrite);

	// Criando os dados
	wire [7:0] Dado1, Dado2;
	wire [7:0] Dado2Mem;


	//Estendendo os sinais

	wire [7:0] imediatoEstendido;
	Extensor extensor(instr[2:0], imediatoEstendido);

	//Buscando o resultado que irá entrar na ULA
	wire [7:0] resultadoMuxEntradaULA;
	MUX muxPreULA(Dado2, imediatoEstendido, ULAFonte, resultadoMuxEntradaULA);

	//Implementando a ULA
	wire Zero;
	wire [7:0] resultadoULA;
	
	//module ULA(Dado1,Dado2,ULAOp,Result,Zero);
	ULA Ula(Dado1,resultadoMuxEntradaULA, ULAOp, resultadoULA, Zero);

	//Buscando o resultado que irá entrar na memória de dados
	assign Endereco = imediatoEstendido; //resultadoULA
	assign DadoPraEscrever = Dado1;

	//MUX depois da memória de dados e ULA
	wire [7:0] resultadoMuxPosULA;
	MUX muxPosULA(resultadoULA, DadoLido, FonteReg, resultadoMuxPosULA);

	//implementando os registradores
	//module registradores(Reg1,Reg2,RegWrite,DadoPraEscrever,Reg1Write,Dado1,Dado2,clock,reset);
	registradores banco_reg(instr[4:3],instr[2:1],RegWrite,resultadoMuxPosULA,instr[4:3], Dado1, Dado2, clock, reset);


	//implementando PC
	//module PC (proxPC, PC_exit, SinalEscPC, clock, reset);
	wire [7:0] proxPC, PCnow, PCnowSoma;
	PC PC_module(proxPC,PCnow,EscPC,clock,reset);

	//soma pc
	assign PC = PCnow;
	assign PCnowSoma = PCnow + 1;

	//implementando os dois multiplexadores faltantes
	wire[7:0] resultadoMuxBEQ;
	wire[7:0] resultadoMuxJUMP;
	wire[7:0] resultadoPCjumpEstendido;
	wire[7:0] resultadoPCBeqEstendido;
	
	Extensor5to8 extensorJump(instr[4:0], resultadoPCjumpEstendido);
	Extensor2to8 extensorBEQ(instr[1:0], resultadoPCBeqEstendido);

	MUX muxBEQ(PCnowSoma,resultadoPCBeqEstendido , (Zero & BEQ), resultadoMuxBEQ);
	MUX muxJUMP(resultadoMuxBEQ, resultadoPCjumpEstendido, Jump, proxPC);


endmodule

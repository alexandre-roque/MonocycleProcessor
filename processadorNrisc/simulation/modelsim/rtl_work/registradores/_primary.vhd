library verilog;
use verilog.vl_types.all;
entity registradores is
    port(
        Reg1            : in     vl_logic_vector(1 downto 0);
        Reg2            : in     vl_logic_vector(1 downto 0);
        RegWrite        : in     vl_logic;
        DadoPraEscrever : in     vl_logic_vector(7 downto 0);
        Reg1Write       : in     vl_logic_vector(1 downto 0);
        Dado1           : out    vl_logic_vector(7 downto 0);
        Dado2           : out    vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        reset           : in     vl_logic
    );
end registradores;

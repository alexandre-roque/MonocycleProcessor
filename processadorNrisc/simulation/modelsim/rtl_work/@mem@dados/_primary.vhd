library verilog;
use verilog.vl_types.all;
entity MemDados is
    port(
        Endereco        : in     vl_logic_vector(7 downto 0);
        DadoPraEscrever : in     vl_logic_vector(7 downto 0);
        DadoLido        : out    vl_logic_vector(7 downto 0);
        LerMemoria      : in     vl_logic;
        EscreveMemoria  : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic
    );
end MemDados;

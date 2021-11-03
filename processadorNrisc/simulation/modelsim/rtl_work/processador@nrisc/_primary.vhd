library verilog;
use verilog.vl_types.all;
entity processadorNrisc is
    port(
        instr           : in     vl_logic_vector(7 downto 0);
        DadoLido        : in     vl_logic_vector(7 downto 0);
        PC              : out    vl_logic_vector(7 downto 0);
        Endereco        : out    vl_logic_vector(7 downto 0);
        DadoPraEscrever : out    vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        EscreverMemoria : out    vl_logic;
        LerMemoria      : out    vl_logic
    );
end processadorNrisc;

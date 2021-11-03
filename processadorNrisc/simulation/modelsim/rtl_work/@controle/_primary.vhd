library verilog;
use verilog.vl_types.all;
entity Controle is
    port(
        opcode          : in     vl_logic_vector(2 downto 0);
        reset           : in     vl_logic;
        EscPC           : out    vl_logic;
        FonteReg        : out    vl_logic;
        Jump            : out    vl_logic;
        EscreverMemoria : out    vl_logic;
        LerMemoria      : out    vl_logic;
        ULAOp           : out    vl_logic_vector(2 downto 0);
        ULAFonte        : out    vl_logic;
        BEQ             : out    vl_logic;
        RegWrite        : out    vl_logic
    );
end Controle;

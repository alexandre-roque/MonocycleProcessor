library verilog;
use verilog.vl_types.all;
entity MUX is
    port(
        ResultA         : in     vl_logic_vector(7 downto 0);
        ResultB         : in     vl_logic_vector(7 downto 0);
        Chave           : in     vl_logic;
        ResultFinal     : out    vl_logic_vector(7 downto 0)
    );
end MUX;

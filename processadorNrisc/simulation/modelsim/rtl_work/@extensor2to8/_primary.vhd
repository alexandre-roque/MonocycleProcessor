library verilog;
use verilog.vl_types.all;
entity Extensor2to8 is
    port(
        Not_Estendido   : in     vl_logic_vector(1 downto 0);
        Estendido       : out    vl_logic_vector(7 downto 0)
    );
end Extensor2to8;

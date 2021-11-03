library verilog;
use verilog.vl_types.all;
entity MemInstrucao is
    port(
        Endereco        : in     vl_logic_vector(7 downto 0);
        instr           : out    vl_logic_vector(7 downto 0);
        clock           : in     vl_logic
    );
end MemInstrucao;

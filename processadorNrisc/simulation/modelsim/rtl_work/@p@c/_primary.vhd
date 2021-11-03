library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        proxPC          : in     vl_logic_vector(7 downto 0);
        PC_exit         : out    vl_logic_vector(7 downto 0);
        SinalEscPC      : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic
    );
end PC;

library verilog;
use verilog.vl_types.all;
entity ProcessorMIPS_vlg_sample_tst is
    port(
        GClock          : in     vl_logic;
        GResetBar       : in     vl_logic;
        ValueSelect     : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end ProcessorMIPS_vlg_sample_tst;

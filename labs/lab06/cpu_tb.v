module cpu_tb();

cpu_sc_part cpu();

initial begin
    #200 $finish;
end

endmodule
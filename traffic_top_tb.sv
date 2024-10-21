`timescale 1ns/1ps

module traffic_top_tb; 

    logic clk; 
    logic rst; 

    logic [1:0] es_light; 
    logic [1:0] ns_light; 

    traffic_top DUT(
        .clk(clk), 
        .rst(rst),
         
        .es_light(es_light),
        .ns_light(ns_light)
    ); 

    always #5 clk = ~clk; 
    
    initial begin
        clk =0; 
        rst =0; 

        repeat(2) @(negedge clk); 

        rst =1; 
    end
    
endmodule
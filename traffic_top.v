module traffic_top (
    input wire clk, 
    input wire rst, 

    output [1:0] es_light,
    output [1:0] ns_light
); 

    traffic_light TL( 
        .clk(clk), 
        .rst(rst), 
        .count_10(count_10), 
        .count_2(count_2),

        .es_light(es_light),
        .ns_light(ns_light)
    ); 

    counter COUNT(
        .clk(clk), 
        .rst(rst), 
        .count_10(count_10), 
        .count_2(count_2)
    );


endmodule
module traffic_light (
    input wire clk, 
    input wire rst, 
    input wire count_10, 
    input wire count_2,

    output reg [1:0] es_light,
    output reg [1:0] ns_light
); 

reg [1:0] pstate, nstate; 

parameter [1:0] es_green_ns_red     = 2'b00, 
                es_red_ns_yellow    = 2'b01,
                es_red_ns_green     = 2'b10,
                es_yellow_ns_green  = 2'b11;               


always @(*) begin : NSOL 
    begin : NSL
        case (pstate)
            es_green_ns_red :   nstate = count_10 ? es_red_ns_yellow : es_green_ns_red; 
            es_red_ns_yellow :  nstate = count_2 ? es_red_ns_green : es_red_ns_yellow;
            es_red_ns_green :   nstate = count_10 ? es_yellow_ns_green : es_red_ns_green;
            es_yellow_ns_green : nstate = count_2 ? es_green_ns_red : es_yellow_ns_green;
            default: nstate = 2'bx; 
        endcase
    end

    begin : OL
        case(pstate) 
            es_green_ns_red:  begin 
                                es_light = 2'b00; 
                                ns_light = 2'b01; 
                            end
            es_red_ns_yellow: begin 
                                es_light = 2'b01; 
                                ns_light = 2'b10; 
                            end
            es_red_ns_green: begin 
                                es_light = 2'b01; 
                                ns_light = 2'b00; 
                            end
            es_yellow_ns_green: begin 
                                es_light = 2'b10; 
                                ns_light = 2'b00; 
                            end
        endcase
    end
end


always@(posedge clk) begin

        if(~rst) 
            pstate = es_green_ns_red; 
        else 
            pstate = nstate; 

end


endmodule 
module counter (
    input wire clk, 
    input wire rst, 

    output reg count_10, 
    output reg count_2
);

    reg [3:0] count; 
always@(posedge clk) begin
    if(~rst) begin
        count = 0;
        count_10 = 0; 
        count_2 = 0 ; 
    end 

    else 
        count = count+1; 
    
    if(count==2)
        count_2 = 1; 

    else if(count == 10) begin
        count_10 = 1; 
        count = 0; 
    end
    
    else begin
        count_10 = 0;
        count_2 = 0;
    end
end
endmodule
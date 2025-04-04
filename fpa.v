`timescale 1ns / 1ps
module fpa(
    input [3:0]ca,
    input[1:0]ea,
    input sa,
    input[3:0]cb,
    input[1:0]eb,
    input sb,
    output[8:0]co,
    output[2:0]eo
    );
    reg [8:0]c1,c2;
    reg [8:0]adjusted,c3;
    reg [2:0]e3;
    reg [1:0]e1,e2,e_diff;
    always @(*) begin
     c1[7:4]=ca;
     c1[3:0]=3'b0;
     c1[8]=1'b0;
     c2[7:4]=cb;
     c2[3:0]=3'b0;
     c2[8]=1'b0;
    e1=ea;
    e2=eb;
    if (ea>eb) begin
    e_diff=ea-eb;
    adjusted=c2>>e_diff;
    e3=ea;
    c3=(sb?-adjusted:adjusted)+(sa?-c1:c1);
    end else begin
     e_diff=eb-ea;
     e3=eb;
    adjusted=c1>>e_diff;
    c3=(sa?-adjusted:adjusted)+(sb?-c2:c2);
    end
    if (c3[8]==1) begin
     c3=c3>>1;
     e3=e3+1;
    end
    end
    assign co=c3;
    assign eo=e3;




endmodule
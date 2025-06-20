`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/12 02:02:55
// Design Name: 
// Module Name: encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module encoder(
    input data,
    input reset,
    input clk, 
    output reg P,
    output reg N
    );
    reg [3:0] arr = 4'b1111;  
    reg pre = 1'b1;
    reg par = 1'b0;
    reg [3:0] pout = 4'b0000; 
    reg [3:0] nout = 4'b0000; 
    always @ (posedge clk)

        begin
            if (reset) begin
                P = 1'b0;
                N = 1'b0;
                arr = 4'b1111;
                pre = 1'b1;
                par = 1'b0;
                pout = 4'b0000;
                nout = 4'b0000;
            end
            else begin   
                P = 1'b0;
                N = 1'b0;             
                arr[3] = arr[2];
                arr[2] = arr[1];
                arr[1] = arr[0];
                arr[0] = data;
            if(pout[3] == 1 && nout[3] == 1)begin
                if(pre == 0)begin
                    N = 1'b1;
                    pre=1;
                    par = ~par;
                end
                else begin
                    P = 1'b1;
                    pre=0;
                    par = ~par;
                end
            end
            else begin
                P=pout[3];
                if(pout[3] == 1)begin
                    pre=0;
                    par = ~par;
                end
                N=nout[3];
                if(nout[3] == 1)begin
                    pre=1;
                    par = ~par;
                end
            end
            pout[3] = pout[2];
            pout[2] = pout[1];
            pout[1] = pout[0];
            pout[0] = data;

            nout[3] = nout[2];
            nout[2] = nout[1];
            nout[1] = nout[0];
            nout[0] = data;
            if(arr == 4'b0000 && par ==0)begin
                if(pre == 1)begin
                    pout = 4'b1001;
//                    P = 1'b1;
                    pre = 0;
                end
                else begin
                    nout = 4'b1001;
//                    N = 1'b1;
                    pre = 1;
                end
                arr = 4'b1111;
            end
            if(arr == 4'b0000 && par ==1)begin
                if(pre == 0)begin
                    pout = 4'b0001;
//                    P = 1'b1;
                    pre = 0;
                end
                else begin
                    nout = 4'b0001;
//                    N = 1'b1;
                    pre = 1;
                end
                arr = 4'b1111;
            end
            
            end
        end
endmodule
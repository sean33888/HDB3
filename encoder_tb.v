`timescale 1ns / 1ps

module encoder_tb;
    reg data;
    wire P;
    wire N;
    reg clk;
    reg reset;
    
    // Instantiate the encoder module
    encoder test (.data(data), .reset(reset), .clk(clk), .P(P), .N(N));
    
    // Clock generation: 500 ns period (2 MHz)
    initial begin
        clk = 0;
        forever #250 clk = ~clk;
    end
    
    // Stimulus
    initial begin
        // Initialize signals
        reset = 1'b1;
        data = 1'b0;
        
        // Apply reset for one clock cycle
        #500;
        reset = 1'b0;
        
        // Apply 67-bit data sequence synchronized with posedge clk
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        
        // Wait a few cycles and finish
        #1000;
        $finish;
    end
    
    // Monitor signals for debugging
    initial begin
        $monitor("Time=%0t clk=%b reset=%b data=%b P=%b N=%b", 
                 $time, clk, reset, data, P, N);
    end
endmodule

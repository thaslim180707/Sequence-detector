`timescale 1ns/1ps

module sequence_detector_tb;

reg clk;
reg reset;
reg x;

wire y;

sequence_detector uut(
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y)
);

// Clock Generation
always #5 clk = ~clk;

initial
begin

    $dumpfile("sequence_detector.vcd");
    $dumpvars(0, sequence_detector_tb);

    clk = 0;
    reset = 1;
    x = 0;

    #10 reset = 0;

    // Input Stream : 1011011
    x=1; #10;
    x=0; #10;
    x=1; #10;
    x=1; #10;
    x=0; #10;
    x=1; #10;
    x=1; #10;

    #20;

    $finish;

end

initial
begin
    $monitor("Time=%0t Input=%b Output=%b",$time,x,y);
end

endmodule
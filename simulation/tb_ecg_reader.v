`timescale 1ns / 1ps

module tb_ecg_reader;

    reg clk;
    reg signed [11:0] ecg_sample;
    wire abnormal;

    integer i;

    // Device Under Test (DUT)
    top_neuromorphic_ecg dut (
        .clk(clk),
        .ecg_sample(ecg_sample),
        .abnormal(abnormal)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;

        // Simulate ECG waveform
        for (i = 0; i < 100; i = i + 1) begin
            ecg_sample = $random % 2000 - 1000;
            #10;

            $display("Sample %0d = %0d | Abnormal = %b",
                     i, ecg_sample, abnormal);
        end

        $finish;
    end

endmodule

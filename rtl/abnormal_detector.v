`timescale 1ns / 1ps

module abnormal_detector #(
    parameter integer WINDOW_SIZE = 50,
    parameter integer FIRE_TH     = 2
)(
    input  wire clk,
    input  wire fire_in,
    output reg  abnormal
);

    integer fire_count   = 0;
    integer sample_count = 0;

    always @(posedge clk) begin

        // Count samples
        sample_count <= sample_count + 1;

        // Count neuron firing events
        if (fire_in)
            fire_count <= fire_count + 1;

        // Default output
        abnormal <= 1'b0;

        // Check after one observation window
        if (sample_count >= WINDOW_SIZE) begin

            if (fire_count >= FIRE_TH)
                abnormal <= 1'b1;
            else
                abnormal <= 1'b0;

            // Reset counters for next window
            sample_count <= 0;
            fire_count   <= 0;
        end
    end

endmodule

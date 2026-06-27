`timescale 1ns / 1ps

module top_neuromorphic_ecg(
    input wire clk,
    input wire signed [11:0] ecg_sample,
    output wire abnormal
);

wire spike;
wire fire;

// Spike Encoder
spike_encoder u_spike (
    .ecg_sample(ecg_sample),
    .spike(spike)
);

// LIF Neuron
lif_neuron u_lif (
    .clk(clk),
    .spike_in(spike),
    .fire(fire)
);

// Abnormal Detector
abnormal_detector u_abn (
    .clk(clk),
    .fire_in(fire),
    .abnormal(abnormal)
);

endmodule

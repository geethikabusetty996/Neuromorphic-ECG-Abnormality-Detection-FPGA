`timescale 1ns / 1ps
module spike_encoder #(
parameter THRESHOLD = 200
)(
input wire signed [11:0] ecg_sample,
output reg spike
);
always @(*) begin
if (ecg_sample > THRESHOLD)
spike = 1'b1;
else
spike = 1'b0;
end
endmodule

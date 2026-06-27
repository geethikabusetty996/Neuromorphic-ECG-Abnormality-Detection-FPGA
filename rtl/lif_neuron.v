`timescale 1ns / 1ps
module lif_neuron #(
parameter THRESHOLD = 5,
parameter LEAK = 1
)(
input wire clk,
input wire spike_in,
output reg fire
  );
integer membrane = 0;
always @(posedge clk) begin
// leak
if (membrane > 0)
membrane <= membrane - LEAK;
// integrate
if (spike_in)
membrane <= membrane + 1;
// fire condition
if (membrane >= THRESHOLD) begin
fire <= 1'b1;
membrane <= 0; // reset after fire
end else begin
fire <= 1'b0;
end
end
endmodule

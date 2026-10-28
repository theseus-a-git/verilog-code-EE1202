
module seven_segment (
    input [3:0] bcd,
    output reg [6:0] seg
);

    always @(*) begin
        seg = 7'b0000000;

        case (bcd)
            4'b0000: seg = 7'b1111110; // 0
            4'b0001: seg = 7'b0110000; // 1
            4'b0010: seg = 7'b1101101; // 2
            4'b0011: seg = 7'b1111001; // 3
            4'b0100: seg = 7'b0110011; // 4
            4'b0101: seg = 7'b1011011; // 5
            4'b0110: seg = 7'b1011111; // 6
            4'b0111: seg = 7'b1110000; // 7
            4'b1000: seg = 7'b1111111; // 8
            4'b1001: seg = 7'b1111011; // 9
            default: seg = 7'b0000000;
        endcase
    end

endmodule


module ss_tb;

    reg [3:0] bcd;
    wire [6:0] seg;

    seven_segment uut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        $monitor("Time=%0t | BCD=%d | Segments=%b", $time, bcd, seg);

        bcd = 4'd0; #1;
        bcd = 4'd1; #1;
        bcd = 4'd2; #1;
        bcd = 4'd3; #1;
        bcd = 4'd4; #1;
        bcd = 4'd5; #1;
        bcd = 4'd6; #1;
        bcd = 4'd7; #1;
        bcd = 4'd8; #1;
        bcd = 4'd9; #1;
        bcd = 4'd10; #1;

        $finish;
    end

endmodule

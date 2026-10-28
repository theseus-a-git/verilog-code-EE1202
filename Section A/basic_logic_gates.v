module logic_gates (
    a,b,y_and,y_or,y_nand,y_nor,y_xor, y_xnor
);
    input a,b;
    output reg y_and,y_or,y_nand,y_nor,y_xor, y_xnor;

    assign y_and = a & b;
    assign y_or = a | b;
    assign y_nand = ~(a & b);
    assign y_nor = ~(a | b);
    assign y_xor = a ^ b;
    assign y_xnor = ~(a ^ b);

endmodule


module lg_tb;
    reg a, b;
    wire y_and, y_or, y_nand, y_nor, y_xor, y_xnor;

    // Instantiate the module being tested
    logic_gates uut (
        .a(a),
        .b(b),
        .y_and(y_and),
        .y_or(y_or),
        .y_nand(y_nand),
        .y_nor(y_nor),
        .y_xor(y_xor),
        .y_xnor(y_xnor)
    );

    initial begin
        $monitor("a=%b b=%b | AND=%b OR=%b NAND=%b NOR=%b XOR=%b XNOR=%b",
                 a, b, y_and, y_or, y_nand, y_nor, y_xor, y_xnor);

        a = 0; b = 0;
        #1;

        a = 0; b = 1;
        #1;

        a = 1; b = 0;
        #1;

        a = 1; b = 1;
        #1;

        $finish;
    end

endmodule



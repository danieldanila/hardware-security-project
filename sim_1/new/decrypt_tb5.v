`timescale 1ns / 1ps

module decrypt_tb5;

parameter p_cipher_length = 6;
parameter p_secret_length = 6;

reg [(p_cipher_length * 8) - 1:0] i_r_cipher;
reg [(p_secret_length * 8) - 1:0] i_r_secret;

wire [(p_cipher_length * 8) - 1:0] o_w_text;

decrypt #(
    .p_cipher_length(p_cipher_length),
    .p_secret_length(p_secret_length)
) d_tb5 (
    .o_r_text(o_w_text),
    .i_w_cipher(i_r_cipher),
    .i_w_secret(i_r_secret)
);

initial begin    
    $dumpfile("test.vcd");
    // dumpp all variables
    $dumpvars;
    
    i_r_cipher = 0;
    i_r_secret = 0;
    
    $monitor(
        "Time = %0t, ", $time,
        "i_r_cipher=%b, ", i_r_cipher,
        "i_r_secret=%s, ", i_r_secret,
        "o_w_text=%s, ", o_w_text
    );
    
    /*
    LLIITT		DANILA		SUMA	BITS

    L = 21		D = 11		32	    00100000		
    L = 21		A = 12		33	    00100001
    I = 14		N = 13		27	    00011011
    I = 14		I = 14		28	    00011100
    T = 44		L = 21		65	    01000001
    T = 44		A = 12		56	    00111000
    */ 
    // Testbench 5
    #10;
    i_r_cipher = 56'b001000000010000100011011000111000100000100111000;       
    i_r_secret = "DANILA";            
    
    #10;
    $finish;  
end

endmodule

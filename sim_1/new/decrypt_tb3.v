`timescale 1ns / 1ps

module decrypt_tb3;

parameter p_cipher_length = 6;
parameter p_secret_length = 6;

reg [(p_cipher_length * 8) - 1:0] i_r_cipher;
reg [(p_secret_length * 8) - 1:0] i_r_secret;

wire [(p_cipher_length * 8) - 1:0] o_w_text;

decrypt #(
    .p_cipher_length(p_cipher_length),
    .p_secret_length(p_secret_length)
) d_tb3 (
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
    DANILA		DANILA		SUMA	BITS

    D = 11		D = 11		22	    00010110		
    A = 12		A = 12		24	    00011000
    N = 13		N = 13		26	    00011010
    I = 14		I = 14		28	    00011100
    L = 21		L = 21		42	    00101010
    A = 12		A = 12		24	    00011000
    */
    
    // Testbench 3
    #10;
    i_r_cipher = 56'b000101100001100000011010000111000010101000011000;       
    i_r_secret = "DANILA";          
    
    #10;
    $finish;  
end

endmodule

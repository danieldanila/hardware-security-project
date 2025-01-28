`timescale 1ns / 1ps

module decrypt_tb1;

parameter p_cipher_length = 1;
parameter p_secret_length = 6;

reg [(p_cipher_length * 8) - 1:0] i_r_cipher;
reg [(p_secret_length * 8) - 1:0] i_r_secret;

wire [(p_cipher_length * 8) - 1:0] o_w_text;

decrypt #(
    .p_cipher_length(p_cipher_length),
    .p_secret_length(p_secret_length)
) d_tb1 (
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
    E		    DANILA		SUMA	BITS

    E = 15		D = 11		26	    00011010
    */
    
    // Testbench 1
    #10;
    i_r_cipher = 8'b00011010;  
    i_r_secret = "DANILA";     
    
    #10;
    $finish;  
end

endmodule

`timescale 1ns / 1ps

module encrypt_tb7;

parameter p_message_length = 15;
parameter p_secret_length = 6;

reg [(p_message_length * 8) - 1:0] i_r_text;
reg [(p_secret_length * 8) - 1:0] i_r_secret;

wire [(p_message_length * 8) - 1:0] o_w_cipher;

encrypt #(
    .p_message_length(p_message_length),
    .p_secret_length(p_secret_length)
) e_tb7 (
    .o_r_cipher(o_w_cipher),
    .i_w_text(i_r_text),
    .i_w_secret(i_r_secret)
);

initial begin    
    $dumpfile("test.vcd");
    // dumpp all variables
    $dumpvars;
    
    i_r_text = 0;
    i_r_secret = 0;
    
    $monitor(
        "Time = %0t, ", $time,
        "i_r_text=%s, ", i_r_text,
        "i_r_secret=%s, ", i_r_secret,
        "o_w_cipher=%b, ", o_w_cipher
    );
       
    /*
    TOPSECRET	DANILA		SUMA	BITS

    T = 44		D = 11		55	    00110111		
    O = 34		A = 12		46	    00101110
    P = 35		N = 13		48	    00110000
    S = 43		I = 14		57	    00111001
    E = 15		L = 21		36	    00100100
    C = 23		A = 12		35	    00100011
    R = 42		D = 11		53	    00110101
    E = 15		A = 12		27	    00011011
    T = 44		N = 13		57	    00111001
    ! = 33		I = 14		47	    00101111
      = 32		L = 21		53	    00110101
    @ = 64		A = 12		76	    01001100
    # = 35		D = 11		46	    00101110
    $ = 36		A = 12		48	    00110000
    % = 37		N = 13		50	    00110010
    
    */
    
    // Testbench 2
    #10;
    i_r_text = "TOPSECRET@$%";      
    i_r_secret = "DANILA";    
       
    #10;
    $finish;  
end

endmodule

`timescale 1ns / 1ps

module encrypt_tb4;

parameter p_message_length = 27;
parameter p_secret_length = 6;

reg [(p_message_length * 8) - 1:0] i_r_text;
reg [(p_secret_length * 8) - 1:0] i_r_secret;

wire [(p_message_length * 8) - 1:0] o_w_cipher;

encrypt #(
    .p_message_length(p_message_length),
    .p_secret_length(p_secret_length)
) e_tb4 (
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
    TEXTFOARTELUNGDEMULTELITERE	    DANILA		SUMA	BITS

    T = 44				            D = 11		55	    00110111		
    E = 15				            A = 12		27	    00011011
    X = 53				            N = 13		66	    01000010
    T = 44				            I = 14		58	    00111010
    F = 24				            L = 21		45	    00101101
    O = 34				            A = 12		46	    00101110
    A = 12				            D = 11		23	    00010111
    R = 42				            A = 12		54	    00110110
    T = 44				            N = 13		57	    00111001
    E = 15				            I = 14		29	    00011101
    L = 21				            L = 21		42	    00101010
    U = 45				            A = 12		57	    00111001
    N = 13				            D = 11		24	    00011000
    G = 25				            A = 12		37	    00100101
    D = 11				            N = 13		24	    00011000
    E = 15				            I = 14		29	    00011101
    M = 33				            L = 21		54	    00110110
    U = 45				            A = 12		57	    00111001
    L = 21				            D = 11		32	    00100000
    T = 44				            A = 12		56	    00111000
    E = 15				            N = 13		28	    00011100
    L = 21				            I = 14		35	    00100011
    I = 14				            L = 21		35	    00100011
    T = 44				            A = 12		56	    00111000
    E = 15				            D = 11		26	    00011010
    R = 42				            A = 12		54	    00110110
    E = 15				            N = 13		28	    00011100
    */
           
    // Testbench 4
    #10;
    i_r_text = "TEXTFOARTELUNGDEMULTELITERE"; // 27 letters      
    i_r_secret = "DANILA";     
        
    #10;
    $finish;  
end

endmodule

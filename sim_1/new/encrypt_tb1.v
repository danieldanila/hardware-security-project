`timescale 1ns / 1ps

module encrypt_tb1;

parameter p_message_length = 1;
parameter p_secret_length = 6;

reg [(p_message_length * 8) - 1:0] i_r_text;
reg [(p_secret_length * 8) - 1:0] i_r_secret;

wire [(p_message_length * 8) - 1:0] o_w_cipher;

encrypt #(
    .p_message_length(p_message_length),
    .p_secret_length(p_secret_length)
) e_tb1 (
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
    E		    DANILA		SUMA	BITS

    E = 15		D = 11		26	    00011010
    */
    
    // Testbench 1
    #10;
    i_r_text = "E";     
    i_r_secret = "DANILA";     
    
    #10;
    $finish;  
end

endmodule

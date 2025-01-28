`timescale 1ns / 1ps

module encrypt #(
    parameter p_message_length = 7,
    parameter p_secret_length = 6
)(
    // The message and the secret can have multiple letters, so the number of bits is multiplied with the word length
    // Text and secret are passed as string and each letter is stored on 8 bits ASCI character
    output reg [(p_message_length * 8) - 1:0] o_r_cipher,
    input wire [(p_message_length * 8) - 1:0] i_w_text,
    input wire [(p_secret_length * 8) - 1:0] i_w_secret
);
    
    reg [7:0] m [4:0][4:0]; // first name 5x5 matrix

     /*
      12345
    1 DANIE
    2 LBCFG
    3 HKMOP
    4 QRSTU
    5 VWXYZ
    */
    
    initial begin
        m[0][0] = "D"; m[0][1] = "A"; m[0][2] = "N"; m[0][3] = "I"; m[0][4] = "E";
        m[1][0] = "L"; m[1][1] = "B"; m[1][2] = "C"; m[1][3] = "F"; m[1][4] = "G";
        m[2][0] = "H"; m[2][1] = "K"; m[2][2] = "M"; m[2][3] = "O"; m[2][4] = "P";
        m[3][0] = "Q"; m[3][1] = "R"; m[3][2] = "S"; m[3][3] = "T"; m[3][4] = "U";
        m[4][0] = "V"; m[4][1] = "W"; m[4][2] = "X"; m[4][3] = "Y"; m[4][4] = "Z";
    end
         
    function [7:0] get_letter_position;
        input [7:0] letter; 
        integer i, j;
        integer row, col;
        reg found;
        reg [7:0] normalized_letter;
        begin
            found = 0; 
            
            if (letter >= "a" && letter <= "z")
                normalized_letter = letter - 8'd32; // Convert to uppercase
            else
                normalized_letter = letter;
                
            for (i = 0; i < 5; i = i + 1) begin
                for (j = 0; j < 5; j = j + 1) begin
                    if (m[i][j] == normalized_letter) begin
                        row = i + 1;
                        col = j + 1;
                        found = 1;
                        get_letter_position = {row * 10 + col}; 
                    end
                end
            end
            if (!found) begin
                get_letter_position = 8'b0;  
            end
        end
    endfunction
         
    integer i;
    integer j = 0;
    
    reg [7:0] letter_text, letter_secret;
    reg [7:0] text_position, secret_position;

    always @(*) begin 
        o_r_cipher = 0;
        
        for (i = 0; i < p_message_length; i = i + 1) begin
            j = i % p_secret_length;
            
            // e.g. if TOPSECRET is passed to i_w_text, then 'POT' is located in LSB and 'TER' in MSB    
            letter_text = i_w_text[((p_message_length - i - 1) * 8) +: 8];
            letter_secret = i_w_secret[((p_secret_length - j - 1) * 8) +: 8];
               
            // A-Z or a-z   
            if ((letter_text >= 8'd65 && letter_text <= 8'd90) || (letter_text >= 8'd97 && letter_text <= 8'd122))  
                text_position = get_letter_position(letter_text);
            else
                // If special character, then encrypt using the ASCII code
                text_position = letter_text;
            
            secret_position = get_letter_position(letter_secret);     
                
            // e.g. (i * 8) +: 8, i = 0 => 7:0, i = 1 => 15:8 etc
            o_r_cipher[(i * 8) +: 8] = text_position + secret_position;

            $display(
                "i: %0d, j: %0d, letter_text: %c, letter_secret: %c, text_pos: %d, secret_pos: %d, sum: %d",
                i, j, letter_text, letter_secret,
                text_position, secret_position,
                text_position + secret_position
            );
        end
    end
endmodule

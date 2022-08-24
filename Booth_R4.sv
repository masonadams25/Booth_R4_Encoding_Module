
module Booth_R4 
    #(parameter width = 8)
    (input logic [width-1:0] x_in, output logic [(width/2)*3-1:0] y_out);

    logic [width:0] x_extn;
    logic [(width/2)*3-1:0] y_temp;

    assign x_extn = x_in & "0";

    // partition 1
    // sign bit
    assign y_temp[2] = x_extn[2];
    // bit two
    assign y_temp[1] = (x_extn[2] & (!(x_extn[1] || x_extn[0]))) || ( !(x_extn[2]) & x_extn[1] & x_extn[0]);
    // bit one
    assign y_temp[0] = x_extn[1] ^ x_extn[0];

    // partition 2
    // sign bit
    assign y_temp[5] = x_extn[4];
    // bit two
    assign y_temp[4] = (x_extn[4] & (!(x_extn[3] || x_extn[2]))) || ( !(x_extn[4]) & x_extn[3] & x_extn[2]);
    // bit one
    assign y_temp[3] = x_extn[3] ^ x_extn[2];

    // partition 3
    // sign bit
    assign y_temp[8] = x_extn[6];
    // bit two
    assign y_temp[7] = (x_extn[6] & (!(x_extn[5] || x_extn[4]))) || ( !(x_extn[6]) & x_extn[5] & x_extn[4]);
    // bit one
    assign y_temp[6] = x_extn[5] ^ x_extn[4];

    // partition 4
    // sign bit
    assign y_temp[11] = x_extn[8];
    // bit two
    assign y_temp[10] = (x_extn[8] & (!(x_extn[8] || x_extn[7]))) || ( !(x_extn[8]) & x_extn[7] & x_extn[6]);
    // bit one
    assign y_temp[9] = x_extn[7] ^ x_extn[1];

    assign y_out = y_temp;

endmodule
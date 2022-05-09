/*
 * File: sim_helper_random.sv
 * Project: helper
 * Created Date: 25/03/2022
 * Author: Shun Suzuki
 * -----
 * Last Modified: 25/03/2022
 * Modified By: Shun Suzuki (suzuki@hapis.k.u-tokyo.ac.jp)
 * -----
 * Copyright (c) 2022 Hapis Lab. All rights reserved.
 * 
 */

`timescale 1ns / 1ps
module sim_helper_random;

int seed = 0;

task init();
    int p_file;
    int result;
    int r;
    p_file = $fopen("rand.txt", "r");
    result = $fscanf(p_file, "%d", seed);
    $fclose(p_file);
    r = $random(seed);
endtask

function automatic int range(int max, int min);
    range = ($unsigned($random()) % (max - min + 1)) + min;
endfunction

endmodule
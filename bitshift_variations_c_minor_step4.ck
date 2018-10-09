// original c array "BY}6YB6%"
// original c array "Qj}6jQ6%"
[[66, 89, 125, 54, 89, 66, 54, 37],
 [81, 106, 125, 54, 106, 81, 54, 37]
] @=> int seq[][];


fun int g(int i, int x, int t, int o){
    1 => int idx;
    if (3&(i>>16)){
        0 => idx;
    }

    return (3&x&(i*(seq[idx][t%8]+51)>>o))<<4;
}


fun void main(){
    0 => int n;
    0 => int s;

    Step step[4];
    int chan_sample[4];
    int prev_sample[4];
    int next_sample[4];

    // initialize channels
    for (0 => int i; i < step.size(); i++) {
        step[i] => dac;
        .25 => step[i].gain;
        0 => prev_sample[i];
        0 => next_sample[i];
    }


    for (0 => int i; 1 ; i++){
        i>>14 => n;
        g(i, 1, n, 12) => chan_sample[0];
        i>>17 => s;
        g(i, s, n^i>>13, 10) => chan_sample[1];
        g(i, s/3, n+(i>>11)%3, 10) => chan_sample[2];
        g(i, s/5, 8+n-(i>>10)%3, 9) => chan_sample[3];

        for (0 => int j; j < chan_sample.size(); j++) {
            // prevent clipping
            chan_sample[j] >> 4 => next_sample[j];
            if (next_sample[j] != prev_sample[j]) {
                next_sample[j] => step[j].next;
                next_sample[j] => prev_sample[j];
            }
        }
        1::samp => now;
    }
}

main();
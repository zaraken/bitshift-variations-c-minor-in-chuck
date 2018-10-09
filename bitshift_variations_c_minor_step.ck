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
    int chan1, chan2, chan3, chan4;

    Step step => dac;
    .25 => step.gain;

    0 => int prev_sample;
    0 => int next_sample;

    for(0 => int i; 1 ; i++){
        i>>14 => n;
        g(i, 1, n, 12) => chan1;
        i>>17 => s;
        g(i, s, n^i>>13, 10) => chan2;
        g(i, s/3, n+(i>>11)%3, 10) => chan3;
        g(i, s/5, 8+n-(i>>10)%3, 9) => chan4;

        // prevent clipping
        (chan1+chan2+chan3+chan4) >> 4 => next_sample;
        if (next_sample != prev_sample) {
            next_sample => step.next;
            next_sample => prev_sample;
        }
        1::samp => now;
    }
}

main();

SinOsc s => dac; // (1) Connects (ChucKs) a sine wav oscillator to the dac (sound out)
0.6 => s.gain;   // (2) Sets oscillator gain to 0.6
220 => s.freq;   // (3) Sets oscillator frequency to 220
second => now;   // (4) Lets it play for one second
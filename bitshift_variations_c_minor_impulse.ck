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

    Impulse imp => dac;
    .25 => imp.gain;

    for(0 => int i; 1 ; i++){
        i>>14 => n;
        g(i, 1, n, 12) => chan1;
        i>>17 => s;
        g(i, s, n^i>>13, 10) => chan2;
        g(i, s/3, n+(i>>11)%3, 10) => chan3;
        g(i, s/5, 8+n-(i>>10)%3, 9) => chan4;

        (chan1+chan2+chan3+chan4)>>4 => imp.next;
        1::samp => now;
    }
}

main();
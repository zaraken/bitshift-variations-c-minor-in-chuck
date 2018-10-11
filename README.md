# bitshift-variations-c-minor-in-chuck
Bitshift Variations in C Minor by Robert Miles implemented in Chuck

## Sources
Original code http://txti.es/bitshiftvariationsincminor

Youtube video https://www.youtube.com/watch?v=MqZgoNRERY8

Impulse, step & pulseOsc implemntations sound like the original.
This algorithm is not very suitable for live music generation in chuck as it produces a lot of artifacts at least on my laptop. But once recorded into a wav file, playing that file sounds just fine.

## Usage
`chuck --srate8000 bitshift_variations_c_minor_step.ck` to play live.
`chuck --srate8000 bitshift_variations_c_minor_step.ck rec_auto.ck` or with the chuck shell script in the project `./chuck.sh bitshit_variations_c_minor_step.ck ` to also record to wav file.

It's important to set the sample rate as this will determine how fast the music will play. In chuck you could do it with the `--srate` parameter. In miniAudicle you have to go somewhere in the settings. To get same results as the original the sample rate has to be 8000.



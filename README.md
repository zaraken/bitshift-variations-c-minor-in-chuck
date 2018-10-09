# bitshift-variations-c-minor-in-chuck
Bitshift Variations in C Minor by Robert Miles implemented in Chuck

Original code http://txti.es/bitshiftvariationsincminor

Youtube video https://www.youtube.com/watch?v=MqZgoNRERY8

Impulse, step & pulseOsc implemntations sound like the original.
This algorithm is not very suitable for live music generation in chuck as it produces a lot of artifacts at least on my laptop. But once recorded into a wav file, playing that file sounds just fine.

It's important to set the sample rate as this will determine how fast the music will play. In chuck you could do it with the `--srate` parameter. In miniAudicle you have to go somewhere in the settings. To get same results as the original the sample rate has to be 8000.

if you have chuck installed and on the path you can run ``` ./chuck bitshit_variations_c_minor_step.ck ``` to play.

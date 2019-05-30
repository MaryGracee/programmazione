import("stdfaust.lib");

envelop   = abs : max ~ -(1.0/ma.SR) : max(ba.db2linear(-70)) : ba.linear2db;
vmeter(x) = attach(x, envelop(x) : vbargraph("[03][unit:dB]", -70, +5));

oscgroup(x)   = vgroup("[02] f1", x);

frq = vslider("[01] f [style:knob] [unit:Hz]", 440,100,20000,1); 

pan = oscgroup(vslider("[01] PAN [style:knob]", 0.5,0,1,0.01));  

vol = oscgroup(vslider("[02] VOL ", 0.0,0.0,1.0,0.01));

oscill(o) = os.oscsin(frq*o) :  hgroup("[02] OSC %o",  *(vol)  <:  *(sqrt(1-pan)), *(sqrt(pan)) : vmeter, vmeter);

process = hgroup("OSCILLATORS BANK", par(i, 4, oscill(i))) :> _,_ ;
//STEREO OUT DECENTE 
// NUMERAZIONE DA 1
//MOLTIPLICAZIONE PARTENDO DA 1
	
			

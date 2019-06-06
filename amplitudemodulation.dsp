import("stdfaust.lib");

modulator = hgroup("[01] M", os.oscsin(frq): *(vol) : +(offset))
  with{ 
    oscgroup(x)   = vgroup("[02] f1", x);
    frq    = oscgroup(vslider("[01] FREQ [style:knob] [unit:Hz]", 1.0,0.1,20000.0,0.1));  
    vol    = oscgroup(vslider("[02] VOL   [style:knob]", 0.0,0.0,1.0,0.01));
    offset = oscgroup(vslider("[03] OFFSET   [style:knob]", 0.0,0.0,0.5,0.01));
 };

carrier = hgroup("[01] C", os.oscsin(frq): *(modulator))
  with{ 
    oscgroup(x)   = vgroup("[02] f1", x);
    frq = oscgroup(vslider("[01] FREQ [style:knob] [unit:Hz]", 440,20,20000,1));  
};   

 process = carrier ;

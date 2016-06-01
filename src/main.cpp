#include "MidiFile.h"
#include "Options.h"
#include <iostream>
using namespace std;

int main(int argc, char** argv) {
   Options options;
   options.process(argc, argv);
   if (options.getArgCount() != 1) {
      cerr << "At least one MIDI filename is required.\n";
      exit(1);
   }
   MidiFile midifile;
   midifile.read(options.getArg(1));
   if (!midifile.status()) {
      cerr << "Error reading MIDI file " << options.getArg(1) << endl;
      exit(1);
   }
   midifile.joinTracks();
   int track = 0;
   int k = 0;
   for (int i=0; i<midifile[track].size(); i++) {

      if(!(midifile[track][i].isNoteOff() ||midifile[track][i].isNoteOn()))
         continue;

      
         cout << midifile[track][i].tick << " ";

      if (midifile[track][i].isNoteOff()) {
         k--;
      } 

      for(int l = 0 ; l < k ; l++)
         cout << "\t";

      cout << (int)midifile[track][i][1] << " "
           << endl;

      if (midifile[track][i].isNoteOn()) {
         k++;
      }
   }
}
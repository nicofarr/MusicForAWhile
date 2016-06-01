
\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 244.15" }
      piece = \markup { \hspace #9 \fontsize #2 \bold \column \center-align { \line { "Herzlich tut mich verlangen" }
                     \line { \italic "old: O Haupt voll Blut und Wunden" }
                 } }
      maintainer = "Ph. Hardy"
      maintainerEmail = "superbonus.project@free.fr"
      lastupdated = "2011/Jul/20"
      tagline = \markup { \fontsize #3 \bold "Free Art License" }
      copyright = \markup { \fontsize #3  \bold   \override #'(box-padding .  1.0) \override #'(baseline-skip . 2.9) \box \column { \center-align { \fontsize #-2 \line { • \hspace #0.5 Copyleft 2011/01: cette oeuvre est libre, vous pouvez la (photo)copier, } \line { \fontsize #-2 \line {la diffuser ou la modifier, selon les termes de la Licence Art Libre, voir: } } \line { \fontsize #-2 \with-url #"http://www.artlibre.org/licence/lal/" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://www.artlibre.org/licence/lal/ [en, de, es, pt, it] } } \line { \fontsize #-2 \line { Créé avec GNU LilyPond 2.14.1 \with-url #"http://www.LilyPond.org" \line { \with-color #blue \fontsize #1 \hspace #1.0 \with-color #blue http://www.LilyPond.org } } } \line { \hspace #1.0 \fontsize #-2 \line {par Ph. Hardy. } \line { \fontsize #-2 \with-url #"http://superbonus.project.free.fr" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://superbonus.project.free.fr } } } } } }

	  }

  guidemidi = {
	\repeat volta 2 {
	r4 |
	R1 |
	r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
	R1 |
	\tempo 4 = 40 r2. \tempo 4 = 78 } %fin du repeat
        r4 |
	R1 |
	r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
	R1 |
	\tempo 4 = 40 r2. \tempo 4 = 78 r4 |
	R1 |
	r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
	R1 |
	\tempo 4 = 40 r2. 
	}

  upper = {
	\time 4/4
	\key d \major
	\clef treble
	\partial 4
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
	fis4 |
	b4 a g fis |
	e2 fis4\fermata cis' |
	d4 d cis8 b cis4 |
	b2.\fermata } %fin du repeat
        d4 |
	cis8 b a4 b cis |
	d2 d4\fermata a |
	b4 a g g |
	fis2.\fermata d'!4 |
	cis8 d e4 d cis |
	b2 cis4\fermata fis, |
	g4 fis e a |
	fis2.\fermata 
	\bar "|."
	} % fin de relative
	}

%	\context Voice="1" { \voiceTwo 
%	% ALTO
%	\set Voice.midiInstrument = "acoustic grand"
%	\relative c' {
%	\repeat volta 2 {
%	d4 |
%	d4 d d8 e e d |
%	d4 cis d e |
%	d8 e fis4 fis fis8 e |
%	d2. } %fin du repeat
%        b'8 a! |
%	g4 fis8 e d4 g |
%	g4 fis8 e fis4 fis |
%	g4 fis fis e |
%	dis2. e4 |
%	e4 e fis e |
%	fis4 e e d |
%	d8 cis d4 d cis |
%	d2. 
%	\bar "|."
%	} % fin de relative
%	\oneVoice
%	} >>
 >>
	}

    lower = {
	\key d \major
	\clef treble
	\clef bass
	\partial 4
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
	a4 |
	g4 a b8 a a4 |
	b4 a a ais |
	fis4 b b ais |
	b2.\fermata } %fin du repeat
        fis'4 |
	e8 d cis4 b8 a g a |
	b4 a8 g a4 d |
	d4 d8 cis b4 b |
	b2. b4 |
	a4 a8 gis a b cis a |
	fis8 b gis4 a a |
	g4 a b e,8 a |
	a2. 
	\bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c {
	\repeat volta 2 {
	d4 |
	g4 fis b,8 cis d4 |
	g,4 a d\fermata cis |
	b8 cis d e fis4 fis, |
	b2. } %fin du repeat
        b'4 |
	e,4 fis g8 fis e4 |
	d2 d4\fermata d |
	g4 d e8 fis g a |
	b2.\fermata gis4 |
	a4 cis, fis8 gis! a4 |
	d,4 e a,\fermata d8 cis |
	b4 a g a |
	d,2.\fermata
	\bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "98." }
	\new Staff = "upper" \upper
%	\new Staff = "lower" \lower
	>>

    \layout {
%	ragged-last = ##f
	   }

         } % fin de score

  \score {
\unfoldRepeats { << \guidemidi \upper >> }
    \midi {
    \context {
     \Staff
      \remove "Staff_performer"
               }

     \context {
      \Voice
       \consists "Staff_performer"
                }

     \context { 
      \Score
      tempoWholesPerMinute = #(ly:make-moment 78 4)
		}
	    }
	}



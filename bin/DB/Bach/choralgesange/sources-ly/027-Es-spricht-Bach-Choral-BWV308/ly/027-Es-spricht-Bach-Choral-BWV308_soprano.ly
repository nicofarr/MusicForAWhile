
\version "2.14.1"

  \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

  \header {
      opus = \markup { \bold "BWV 308" }
      piece = \markup { \hspace #9 \fontsize #2 \bold "Es spricht der Unweisen Mund" }
      maintainer = "Ph. Hardy"
      maintainerEmail = "superbonus.project@free.fr"
      lastupdated = "2011/Jul/20"
      tagline = \markup { \fontsize #3 \bold "Free Art License" }
      copyright = \markup { \fontsize #3  \bold   \override #'(box-padding .  1.0) \override #'(baseline-skip . 2.9) \box \column { \center-align { \fontsize #-2 \line { • \hspace #0.5 Copyleft 2011/01: cette oeuvre est libre, vous pouvez la (photo)copier, } \line { \fontsize #-2 \line {la diffuser ou la modifier, selon les termes de la Licence Art Libre, voir: } } \line { \fontsize #-2 \with-url #"http://www.artlibre.org/licence/lal/" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://www.artlibre.org/licence/lal/ [en, de, es, pt, it] } } \line { \fontsize #-2 \line { Créé avec GNU LilyPond 2.14.1 \with-url #"http://www.LilyPond.org" \line { \with-color #blue \fontsize #1 \hspace #1.0 \with-color #blue http://www.LilyPond.org } } } \line { \hspace #1.0 \fontsize #-2 \line {par Ph. Hardy. } \line { \fontsize #-2 \with-url #"http://superbonus.project.free.fr" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://superbonus.project.free.fr } } } } } }

	  }

  guidemidi = {
	\repeat volta2 {
	r4 |
	R1 |
	r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
	R1 |
	r2 \tempo 4 = 30 r4 \tempo 4 = 78 } % fin du repeat
        r4 |
	R1 |
	r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
	R1 |
	r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
	R1 |
	r4 r4 \tempo 4 = 30 r4 
	}

  upper = {
	\time 4/4
	\key bes \major
	\clef treble
	\partial 4
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
	\repeat volta2 {
	bes4 |
	bes4 a8 g f4 bes |
	c4 d bes\fermata f |
	bes4 c d es |
	c8 bes c4 bes\fermata } % fin du repeat
        bes4 |
	g4 a bes8 a g4 |
	f4 e f\fermata f4 |
	bes4 c d es |
	d4 c d\fermata c4 |
	d4 es f8 es d4 |
	c8 bes c4 bes4\fermata
	\bar "|."
	} % fin de relative
	}

%	\context Voice="1" { \voiceTwo 
%	% ALTO
%	\set Voice.midiInstrument = "acoustic grand"
%	\relative c' {
%	\repeat volta2 {
%	f4 |
%	f4 es d d |
%	es4 f es c |
%	f4 f f g |
%	f2 f4 } % fin du repeat
%        f4 |
%	e4 f ~ f e!8 d |
%	c4 c c c |
%	f8 g a4 bes c4 ~ |
%	c8 bes4 a8 bes4 f |
%	f4 g a f |
%	f2 f4
%	\bar "|."
%	} % fin de relative
%	\oneVoice
%	} >>
 >>
	}

  lower = {
	\time 4/4
	\key bes \major
	\clef bass
	\partial 4
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta2 {
	d4 |
	d4 c4 ~ c8 bes bes4 ~ |
	bes8 a8 bes aes g4 a |
	bes4 es d8 c bes4 ~ |
	bes8 a16 g a4 d } % fin du repeat
        d4 |
	c4 c d g,8 a16 bes |
	c8 bes16 a g8 a16 bes a4 a |
	bes4 es f g8 f |
	f4 f f f8 es |
	d8 c bes4 c4 ~ c8 bes8 ~ |
	bes8 a16 g a4 d4
	\bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c {
	\repeat volta2 {
	bes4 |
	bes4 c d g |
	f4 bes, es\fermata es4 |
	d4 a bes es |
	f2 bes,4\fermata } % fin du repeat
        bes4 ~ |
	bes4 a4 g c8 bes |
	a8 bes c4 f,\fermata f'8 es! |
	d8 es d c bes bes'4 a8 |
	bes4 f bes,\fermata a' |
	bes8 a g4 f bes |
	f2 bes,4\fermata
	\bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}


  \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "27." }
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



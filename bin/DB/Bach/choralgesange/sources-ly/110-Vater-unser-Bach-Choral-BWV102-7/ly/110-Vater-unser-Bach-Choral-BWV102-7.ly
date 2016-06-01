
\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 102.7" }
      piece = \markup { \hspace #9 \fontsize #2 \bold "Vater unser im Himmelreich" }
      maintainer = "Ph. Hardy"
      maintainerEmail = "superbonus.project@free.fr"
      lastupdated = "2011/Jul/20"
      tagline = \markup { \fontsize #3 \bold "Free Art License" }
      copyright = \markup { \fontsize #3  \bold   \override #'(box-padding .  1.0) \override #'(baseline-skip . 2.9) \box \column { \center-align { \fontsize #-2 \line { • \hspace #0.5 Copyleft 2011/01: cette oeuvre est libre, vous pouvez la (photo)copier, } \line { \fontsize #-2 \line {la diffuser ou la modifier, selon les termes de la Licence Art Libre, voir: } } \line { \fontsize #-2 \with-url #"http://www.artlibre.org/licence/lal/" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://www.artlibre.org/licence/lal/ [en, de, es, pt, it] } } \line { \fontsize #-2 \line { Créé avec GNU LilyPond 2.14.1 \with-url #"http://www.LilyPond.org" \line { \with-color #blue \fontsize #1 \hspace #1.0 \with-color #blue http://www.LilyPond.org } } } \line { \hspace #1.0 \fontsize #-2 \line {par Ph. Hardy. } \line { \fontsize #-2 \with-url #"http://superbonus.project.free.fr" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://superbonus.project.free.fr } } } } } }

	  }

  guidemidi = {
        r4 |
        R1 |
        r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
        R1 |
        r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
        R1 |
        r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
        R1 |
        r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
        R1 |
        r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
        R1 |
        r2 \tempo 4 = 30 r4 
	}

  upper = {
	\time 4/4
        \key c \dorian % bes \major
	\clef treble
	\partial 4
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
        g4 |
        g4 es f g8 f |
        es4 d c\fermata g' |
        g4 f bes g8 f |
        es4 f g\fermata g8 a! |
        bes4 c8 d es4 d |
        c4 b c\fermata c |
        d4 c bes a |
        g4 a g\fermata c |
        bes4 a bes8 aes g4 |
        g4 f es\fermata g |
        aes4 g8 f es4 f |
        es4 d c\fermata
        \bar "|."
	} % fin de relative
	}

	\context Voice="1" { \voiceTwo 
	% ALTO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
        es4 |
        d4 c c8 d es d |
        c4 b g es' |
        es4 d8 es f4 es8 d |
        c8 b c d b4 es |
        d4 es8 f g4 f |
        es8 f g4 g f |
        f4 fis g g8 fis! |
        g4 fis d f |
        f4 es d es8 d |
        c4 d bes c |
        f4 es8 d c4 d8 c |
        b8 c c b g4
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}

    lower = {
	\time 4/4
	\key c \dorian % bes \major
	\clef bass
	\partial 4
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
        c4 |
        g4 g c c8 aes! |
        g4 g8 f es4 c' |
        bes4 bes bes bes |
        c4 aes! d, c' |
        bes4 aes g a8 b |
        c4 d es a, |
        bes4 c d es8 d |
        d8 c c b b4 a |
        bes4 c f, es |
        es4 bes'8 aes g4 c |
        c4 b c8 bes aes!4 |
        g4 g8 f e4
        \bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c {
        c4 |
        b4 c aes' es8 f |
        g4 g, c\fermata c' |
        g8 aes bes4 d, es |
        aes4 aes, g\fermata c |
        g'4 f es f8 g |
        aes4 g c,\fermata f |
        bes4 a g c,8 d |
        es4 d g,\fermata f'8 es |
        d4 c bes c8 bes |
        aes4 bes es\fermata e |
        f4 g aes8 g f4 |
        g4 g, c\fermata
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "110." }
	\new Staff = "upper" \upper
	\new Staff = "lower" \lower
	>>

    \layout {
%	ragged-last = ##f
	   }

         } % fin de score

  \score {
    \unfoldRepeats { << \guidemidi \upper \lower >> }
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


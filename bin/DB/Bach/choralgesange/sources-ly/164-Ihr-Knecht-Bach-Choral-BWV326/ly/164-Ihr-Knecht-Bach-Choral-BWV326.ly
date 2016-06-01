
\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 326" }
      piece = \markup { \hspace #9 \fontsize #2 \bold \column \center-align { \line { "Ihr Knecht des Herren allzugleich" }
                     \line { \italic "old: Herr Gott, dich loben alle wir" }
                 } }
      maintainer = "Ph. Hardy"
      maintainerEmail = "superbonus.project@free.fr"
      lastupdated = "2011/Jul/20"
      tagline = \markup { \fontsize #3 \bold "Free Art License" }
      copyright = \markup { \fontsize #3  \bold   \override #'(box-padding .  1.0) \override #'(baseline-skip . 2.9) \box \column { \center-align { \fontsize #-2 \line { • \hspace #0.5 Copyleft 2011/01: cette oeuvre est libre, vous pouvez la (photo)copier, } \line { \fontsize #-2 \line {la diffuser ou la modifier, selon les termes de la Licence Art Libre, voir: } } \line { \fontsize #-2 \with-url #"http://www.artlibre.org/licence/lal/" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://www.artlibre.org/licence/lal/ [en, de, es, pt, it] } } \line { \fontsize #-2 \line { Créé avec GNU LilyPond 2.14.1 \with-url #"http://www.LilyPond.org" \line { \with-color #blue \fontsize #1 \hspace #1.0 \with-color #blue http://www.LilyPond.org } } } \line { \hspace #1.0 \fontsize #-2 \line {par Ph. Hardy. } \line { \fontsize #-2 \with-url #"http://superbonus.project.free.fr" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://superbonus.project.free.fr } } } } } }

	  }

  guidemidi = {
        r4 |
        R2. |
        R2. |
        R2. |
        r2 \tempo 4 = 30 r4 \tempo 4 = 78 |
        R2. |
        R2. |
        R2. |
        \tempo 4 = 34 r2 \tempo 4 = 78 r4 |
        R2. |
        R2. |
        R2. |
        \tempo 4 = 34 r2 \tempo 4 = 78 r4 |
        R2. |
        R2. |
        R2. |
        \tempo 4 = 34 r2 
	}

  upper = {
	\time 3/4
	\key bes \major
	\clef treble
	\partial 4
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
        bes4 |
        bes2 a4 |
        g2 f4 |
        bes4 c2 |
        d2 d4\fermata |
        d2 d4 |
        c2 d4 |
        es4 d2 |
        c2\fermata bes4 |
        c2 d4 |
        c2 bes4 |
        g4 a2 |
        bes2\fermata f'4 |
        d2 bes4 |
        c2 es4 |
        d4 c2 |
        bes2\fermata
        \bar "|."
	} % fin de relative
	}

	\context Voice="1" { \voiceTwo 
	% ALTO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
        f4 |
        g2 f4 |
        es2 d4 |
        d4 g f |
        f2 a4 |
        g2 g4 |
        g4 f f |
        f4 f2 |
        f2 g4 |
        f2 f8 bes |
        g4 f8 es d4 |
        g4 g fis |
        g2 f4 |
        f2 g4 |
        f2 f4 |
        f4 g f8 es |
        d2
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}

    lower = {
	\time 3/4
	\key bes \major
	\clef bass
	\partial 4
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
        d4 |
        d2 d4 |
        bes2 bes4 |
        bes2 a4 |
        bes2 a4 |
        bes2 bes4 |
        bes4 a bes |
        c4 bes2 |
        a2 d4 |
        c2 bes4 |
        bes4 a bes |
        bes8 d es4 d |
        d2 c4 |
        d2 d4 |
        a2 a4 |
        bes2 a4 |
        f2
        \bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c {
        bes8 a |
        g8 a bes c d bes |
        es8 f g a bes a |
        g8 f es d es f |
        bes,2\fermata fis4 |
        g8 d' g f es d |
        es8 c f es d c |
        bes8 a bes c d es |
        f2\fermata g4 |
        a8 f g a bes g |
        es8 d es f g d |
        es8 bes c a d d, |
        g2\fermata a'4 |
        bes8 c bes a g f |
        es8 g f es d c |
        bes8 d es c f f, |
        bes2\fermata
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "164." }
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


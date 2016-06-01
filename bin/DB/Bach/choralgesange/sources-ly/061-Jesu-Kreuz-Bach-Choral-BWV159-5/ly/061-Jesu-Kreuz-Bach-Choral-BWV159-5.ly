
\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 159.5" }
      piece = \markup { \hspace #9 \fontsize #2 \bold \column \center-align { \line { "Jesu Kreuz, Leiden und Pein" }
                     \line { \italic "old: Jesu Leiden, Pein und Tod" }
                 } }
      maintainer = "Ph. Hardy"
      maintainerEmail = "superbonus.project@free.fr"
      lastupdated = "2011/Jul/20"
      tagline = \markup { \fontsize #3 \bold "Free Art License" }
      copyright = \markup { \fontsize #3  \bold   \override #'(box-padding .  1.0) \override #'(baseline-skip . 2.9) \box \column { \center-align { \fontsize #-2 \line { • \hspace #0.5 Copyleft 2011/01: cette oeuvre est libre, vous pouvez la (photo)copier, } \line { \fontsize #-2 \line {la diffuser ou la modifier, selon les termes de la Licence Art Libre, voir: } } \line { \fontsize #-2 \with-url #"http://www.artlibre.org/licence/lal/" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://www.artlibre.org/licence/lal/ [en, de, es, pt, it] } } \line { \fontsize #-2 \line { Créé avec GNU LilyPond 2.14.1 \with-url #"http://www.LilyPond.org" \line { \with-color #blue \fontsize #1 \hspace #1.0 \with-color #blue http://www.LilyPond.org } } } \line { \hspace #1.0 \fontsize #-2 \line {par Ph. Hardy. } \line { \fontsize #-2 \with-url #"http://superbonus.project.free.fr" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://superbonus.project.free.fr } } } } } }

	  }

  guidemidi = {
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        r2 \tempo 4 = 34 r2 |
	}

  upper = {
	\time 4/4
	\key es \major
	\clef treble
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
        g4 f es f |
        g4 aes bes2\fermata |
        c4 bes aes g8 f |
        f2 es2\fermata |
        g4 bes aes g |
        f4 es d2\fermata |
        es4 f g g |
        aes2 g2\fermata |
        g4 aes bes aes |
        g4 f g2\fermata |
        f4 f g8 a bes4 |
        bes4 a bes2\fermata |
        bes4 g c bes |
        aes4 g f2\fermata |
        g8 aes bes4 aes g8 f |
        f2 es2\fermata |
        \bar "|."
	} % fin de relative
	}

	\context Voice="1" { \voiceTwo 
	% ALTO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
        es4 d4 ~ d8 c8 ~ c bes |
        bes4 aes4 des2 |
        es8 aes4 g f8 es4 ~ |
        es4 d bes2 |
        es4 f es8 f g es |
        d4 c b2 |
        c4 d es es4 ~ |
	es8 d16 es f8 d es2 |
        es4 es e f |
        des8 c c d e2 |
        c4 c8 d es4 des8 es |
        f2 f |
        f4 es8 f g4 g |
        es8 f bes, c d2 |
        es4. bes8 es f g c, |
        d8 es16 c d4 bes2 |
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}

    lower = {
	\time 4/4
	\key es \major
	\clef bass
        \mergeDifferentlyDottedOn
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
        bes4 bes8 aes g4 f |
        es8 es'8 ~ es des8 es2 |
        c4 d! es8 d es c |
        bes4. aes8 g2 |
        bes4 bes c8 d es c |
        aes8 g g4 g2 |
        g4 bes bes bes |
        c8 aes f bes bes2 |
        c4 c bes c |
        bes4 aes g2 |
        aes8 bes c bes bes4. c8 |
        des4 c d2 |
        bes4 bes es d8 bes |
        c8 d es4 bes2 |
        bes8 aes g f es d es4 |
        bes'4. aes8 g2 |
        \bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c {
        es4 bes c d |
        es4 f g2\fermata |
        aes4 bes c bes8 aes |
        bes4 bes, es2\fermata |
        es8 d d c c2 ~ |
        c8 b c es g2\fermata |
        c,8 c' bes aes g f es d |
        c8 f d bes es2\fermata |
        c4 bes8 aes g g'4 f8 ~ |
        f8 e f4 c2\fermata |
        f8 g aes4 g ges |
        f8 es f4 bes,2\fermata |
        d8 bes es4 ~ es8 c g'4 ~ |
        g8 f g aes bes2\fermata |
        es,4. d8 c4 bes8 aes |
        bes2 es,2\fermata |
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "61." }
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


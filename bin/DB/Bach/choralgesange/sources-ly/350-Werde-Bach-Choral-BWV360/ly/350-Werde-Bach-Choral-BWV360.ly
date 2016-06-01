
\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 360" }
      piece = \markup { \hspace #9 \fontsize #2 \bold \column \center-align { \line { "Werde munter, mein Gemüte" }
                     \line { \italic "old: Jesu, meiner Seelen Wonne" }
                 } }
      maintainer = "Ph. Hardy"
      maintainerEmail = "superbonus.project@free.fr"
      lastupdated = "2011/Jul/20"
      tagline = \markup { \fontsize #3 \bold "Free Art License" }
      copyright = \markup { \fontsize #3  \bold   \override #'(box-padding .  1.0) \override #'(baseline-skip . 2.9) \box \column { \center-align { \fontsize #-2 \line { • \hspace #0.5 Copyleft 2011/01: cette oeuvre est libre, vous pouvez la (photo)copier, } \line { \fontsize #-2 \line {la diffuser ou la modifier, selon les termes de la Licence Art Libre, voir: } } \line { \fontsize #-2 \with-url #"http://www.artlibre.org/licence/lal/" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://www.artlibre.org/licence/lal/ [en, de, es, pt, it] } } \line { \fontsize #-2 \line { Créé avec GNU LilyPond 2.14.1 \with-url #"http://www.LilyPond.org" \line { \with-color #blue \fontsize #1 \hspace #1.0 \with-color #blue http://www.LilyPond.org } } } \line { \hspace #1.0 \fontsize #-2 \line {par Ph. Hardy. } \line { \fontsize #-2 \with-url #"http://superbonus.project.free.fr" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://superbonus.project.free.fr } } } } } }

	  }

  guidemidi = {
	\repeat volta 2 {
        R1 |
        r2. \tempo 4 = 30 r4 \tempo 4 = 78 |
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 | } %fin du repeat
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        r2. \tempo 4 = 30 r4 \tempo 4 = 78 |
        R1 |
        r2. \tempo 4 = 30 r4 |
	}

  upper = {
	\time 4/4
	\key bes \major
	\clef treble
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
	\repeat volta 2 {
        d4 es f f |
        es4 d c c\fermata |
        d4 es f d |
        c4. c8 bes2\fermata | } %fin du repeat
\break
        c4 d es es |
        d4. c8 c2\fermata |
        es4 f g g |
        f4 f8. es16 es2\fermata |
        d4 es f bes, |
        es4 d c c\fermata |
        d4 es f d |
        c4 c bes bes4\fermata |
        \bar "|."
	} % fin de relative
	}

	\context Voice="1" { \voiceTwo 
	% ALTO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
	\repeat volta 2 {
        bes4 bes a bes8 a |
        g8 a bes4 a a |
        bes4 a8 g f4 g |
        g4 f f2 | } %fin du repeat
        a4 b c g |
        g4 f8 es es2 |
        g4 bes bes bes |
        bes4 bes8 aes g2 |
        g4 g f es |
        f4 f f f |
        f4 g f f |
        g4 f f f |
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}

    lower = {
	\time 4/4
	\key bes \major
	\clef bass
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        f4 bes,8 c d4 d |
        es4 f f f |
        f4 es d8 c bes4 |
        bes4 a d2 | } %fin du repeat
        f4 f, g c |
        c8 a b4 g2 |
        c4 d es es |
        es8 c d4 bes2 |
        bes4 bes bes8 aes g4 |
        c4 bes a! a |
        bes4 bes c bes |
        bes4 a d d |
        \bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        bes4 g d g |
        c,4 bes f' f\fermata |
        bes,4 c d g8 f |
        es4 f bes,2\fermata | } %fin du repeat
        f'4 d c8 d es f |
        g4 g, c2\fermata |
        c'4 bes8 aes g f es4 |
        bes'4 bes, es2\fermata |
        g4 f8 es d4 es |
        a,!4 bes f' f\fermata |
        bes4 a8 g a f bes4 |
        es,4 f bes, bes4\fermata |
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "350." }
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


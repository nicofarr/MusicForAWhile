
\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 296" }
      piece = \markup { \hspace #9 \fontsize #2 \bold "Die Nacht ist kommen, drin wir ruhen sollen" }
      maintainer = "Ph. Hardy"
      maintainerEmail = "superbonus.project@free.fr"
      lastupdated = "2011/Jul/20"
      tagline = \markup { \fontsize #3 \bold "Free Art License" }
      copyright = \markup { \fontsize #3  \bold   \override #'(box-padding .  1.0) \override #'(baseline-skip . 2.9) \box \column { \center-align { \fontsize #-2 \line { • \hspace #0.5 Copyleft 2011/01: cette oeuvre est libre, vous pouvez la (photo)copier, } \line { \fontsize #-2 \line {la diffuser ou la modifier, selon les termes de la Licence Art Libre, voir: } } \line { \fontsize #-2 \with-url #"http://www.artlibre.org/licence/lal/" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://www.artlibre.org/licence/lal/ [en, de, es, pt, it] } } \line { \fontsize #-2 \line { Créé avec GNU LilyPond 2.14.1 \with-url #"http://www.LilyPond.org" \line { \with-color #blue \fontsize #1 \hspace #1.0 \with-color #blue http://www.LilyPond.org } } } \line { \hspace #1.0 \fontsize #-2 \line {par Ph. Hardy. } \line { \fontsize #-2 \with-url #"http://superbonus.project.free.fr" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://superbonus.project.free.fr } } } } } }

	  }

  guidemidi = {
        r4 |
        R1 |
        \tempo 4 = 34 r2 \tempo 4 = 78 r2 |
        R1 |
        \tempo 4 = 34 r2 \tempo 4 = 78 r2 |
        R1 |
        \tempo 4 = 34 r2 \tempo 4 = 78 r2 |
        R1 |
        \tempo 4 = 34 r2 \tempo 4 = 78 r2 |
        R1 |
        \tempo 4 = 34 r2 \tempo 4 = 78 r2 |
        R1 |
        \tempo 4 = 34 r2 \tempo 4 = 78 r2 |
        R1 |
        \tempo 4 = 40 r2. 
	}

  upper = {
\displayLilyMusic \transpose c c {
	\time 4/4
	\key c \major
	\clef treble
	\partial 4
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
        g4 |
        a4 b c2 |
        b2\fermata a4 a4 |
        gis4 a b2 |
        a2\fermata r4 c |
        c4 c8 b a2 |
        d2\fermata r4 b |
        c4 a b a |
        g2\fermata r4 d' |
        d4 d c2 |
        a2\fermata r4 c |
        c4 b c8 b a4 |
        a2\fermata r4 d |
        c4 b a2 |
        g2.\fermata
        \bar "|."
	} % fin de relative
	}

%	\context Voice="1" { \voiceTwo 
%	% ALTO
%	\set Voice.midiInstrument = "acoustic grand"
%	\relative c' {
%        d4 |
%        d4 d e d |
%        d2 e4 d8 c |
%        b4 e f e8 d |
%        c2 r4 a' |
%        g8 f g4 ~ g8 f16 e16 f8 g8 |
%        a2 r4 g |
%        g4 a4 ~ a8 g8 ~ g8 fis8 |
%        d2 r4 g |
%        a8 d, g4 ~ g8 f8 g e |
%        f2 r4 g |
%        a4 ~ a8 g8 g4 g |
%        fis2 r4 g ~ |
%	g8 fis8 g4 g fis |
%        d2.
%        \bar "|."
%	} % fin de relative
%	\oneVoice
%	} >>
 >>
}
	}

    lower = {
\transpose c c {
	\time 4/4
	\key c \major
	\clef bass
	\partial 4
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
        b4 |
        a4 g g a |
        g2 g4 f!8 e |
        e4 e8 a a4 gis |
        a2 r4 e' |
        e8 d e4 c8 cis d e |
        f2 r4 d |
        e4 d d4. c8 |
        b2 r4 b |
        a4 b c2 |
        c2 r4 e |
        d4 d e8 d e4 |
        d2 r4 d |
        g,8 a b e a, d4 c8 |
        b2.
        \bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
        g4 |
        fis4 f e fis |
        g2\fermata cis,4 d ~ |
	d4 c!4 d e |
        a,2\fermata r4 a' |
        e4 c f8 g f e |
        d2\fermata r4 g8 f |
        e4 fis g d |
        g,2\fermata r4 g' |
        fis4 g8 f e d e c |
        f2\fermata r4 e |
        fis4 g c, cis |
        d2\fermata r4 b |
        e4 d8 c d4 d, |
        g2.\fermata
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
}
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "231." }
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




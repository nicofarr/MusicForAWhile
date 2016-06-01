
\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 395" }
      piece = \markup { \hspace #9 \fontsize #2 \bold \column \center-align { \line { "O Welt, ich muß dich lassen" }
                     \line { \italic "old: O Welt, sieh hier dein Leben" }
                 } }
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
        \tempo 4 = 40 r2. \tempo 4 = 78 r4 |
        R1 |
        r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
        R1 |
        r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
        R1 |
        r2 \tempo 4 = 30 r4 
	}

  upper = {
\displayLilyMusic \transpose a c {
	\time 4/4
	\key a \major
	\clef treble
	\partial 4
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
        cis4 |
        a4 b cis8 d e4 |
        d2 cis4\fermata cis8 d |
        e4 e b cis8 b |
        a2 gis4\fermata e |
        a4 b cis8 d16 e d8 cis |
        b2.\fermata cis4 |
        a4 b cis8 d e4 |
        d2 cis4\fermata cis8 d |
        e4 e b cis |
        a2 gis4\fermata e |
        a4 b cis8 d e d |
        cis4 b a\fermata
        \bar "|."
	} % fin de relative
	}

	\context Voice="1" { \voiceTwo 
	% ALTO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
        a4 |
        fis4 gis a8 b cis4 |
        cis4 b8 a gis4 fis |
        e4 a gis gis |
	gis8 fis8 e dis e4 b |
        e4 fis8 gis a b16 cis b8 a |
        gis2. gis4 |
        fis4. e8 e4 fis |
        fis4 f fis fis |
        e!4 a8 gis fis4 e8 dis16 cis |
        fis2 e4 b |
        e4 fis8 gis a2 ~ |
	a4 gis e4
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
}
	}

    lower = {
\transpose a c {
	\time 4/4
	\key a \major
	\clef bass
	\partial 4
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
        e4 |
        d4 d e8 d cis b |
        a4 b cis a |
        a4 e' e eis |
        cis4 b b gis |
        a4 d e fis |
        b,2. gis4 |
        cis4 b a8 b cis4 |
        b4 gis4 ais a |
        a4 a a gis |
        cis4 b b gis |
        a4 d e4. fis8 |
        e4 d cis
        \bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
        a4 |
        d4 cis8 b a4. g8 |
        fis4 gis!8 fis eis4\fermata fis |
        cis8 b cis d e d cis4 |
        fis4 b, e\fermata d |
        cis4 b a d |
        e2.\fermata eis4 |
        fis4 gis a ais |
        b2 fis4\fermata fis |
        cis8 b cis4 dis e |
        e4 dis e\fermata d |
        cis4 b a8 b cis d |
        e4 e a,\fermata
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
}
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "363." }
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



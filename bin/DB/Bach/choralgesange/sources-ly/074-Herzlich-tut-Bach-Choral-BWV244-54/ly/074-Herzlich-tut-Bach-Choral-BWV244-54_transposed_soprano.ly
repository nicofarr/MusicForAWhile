
\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 244.54" }
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
\displayLilyMusic \transpose f c {
	\time 4/4
	\key f \major
	\clef treble
	\partial 4
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
	\repeat volta 2 {
        a4 |
        d4 c bes a |
        g2 a4\fermata e' |
        f4 f e8 d e4 |
        d2.\fermata } %fin du repeat
        f4 |
        e8 d c4 d e |
        f2 f4\fermata c |
        d4 c bes8 a bes4 |
        a2.\fermata f'!4 |
        e8 f g4 f e |
        d2 e4\fermata a, |
        bes4 a g c |
        a2.\fermata
        \bar "|."
	} % fin de relative
	}

%	\context Voice="1" { \voiceTwo 
%	% ALTO
%	\set Voice.midiInstrument = "acoustic grand"
%	\relative c' {
%	\repeat volta 2 {
%        f4 |
%        f8 g a4 d,8 e f4 |
%        f4 e f a |
%        a4 a a a8 g |
%        f2. } %fin du repeat
%        a4 |
%        g4 g8 f f4 bes |
%        bes4 a8 g a4 a |
%        a8 g a4 g8 fis g4 |
%        fis2. g4 |
%        g4 c c c |
%        c4 b c f,8 e |
%        d8 e f4 f e |
%        f2. 
%        \bar "|."
%	} % fin de relative
%	\oneVoice
%	} >>
 >>
}
	}

    lower = {
\transpose f c {
	\time 4/4
	\key f \major
	\clef bass
	\partial 4
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        d4 |
        d8 e f4 g c, |
        d4 c c e |
        e4 d d cis |
        a2. } %fin du repeat
        d8 c |
        bes4 c c bes8 c |
        d4 c8 bes c4 f8 es |
        d4 d d d |
        d2. d4 |
        c8 d e4 f g |
        a4 g g c, |
        bes4 c c8 bes16 a g8 c |
        c2. 
        \bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        d8 c |
        bes4 a g f |
        bes,4 c f\fermata cis |
        d8 e f g a4 a, |
        d2.\fermata } %fin du repeat
        d4 |
        g4 a bes8 a g4 |
        f2 f4\fermata f |
        bes4 fis g g, |
        d'2.\fermata b4 |
        c4 c'8 b a4 g |
        f4 g c,\fermata f |
        g4 a8 bes c4 c, |
        f2.\fermata
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
}
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "74." }
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




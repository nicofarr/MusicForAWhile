
\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 87.7" }
      piece = \markup { \hspace #9 \fontsize #2 \bold "Jesu, meine Freude" }
      maintainer = "Ph. Hardy"
      maintainerEmail = "superbonus.project@free.fr"
      lastupdated = "2011/Jul/20"
      tagline = \markup { \fontsize #3 \bold "Free Art License" }
      copyright = \markup { \fontsize #3  \bold   \override #'(box-padding .  1.0) \override #'(baseline-skip . 2.9) \box \column { \center-align { \fontsize #-2 \line { • \hspace #0.5 Copyleft 2011/01: cette oeuvre est libre, vous pouvez la (photo)copier, } \line { \fontsize #-2 \line {la diffuser ou la modifier, selon les termes de la Licence Art Libre, voir: } } \line { \fontsize #-2 \with-url #"http://www.artlibre.org/licence/lal/" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://www.artlibre.org/licence/lal/ [en, de, es, pt, it] } } \line { \fontsize #-2 \line { Créé avec GNU LilyPond 2.14.1 \with-url #"http://www.LilyPond.org" \line { \with-color #blue \fontsize #1 \hspace #1.0 \with-color #blue http://www.LilyPond.org } } } \line { \hspace #1.0 \fontsize #-2 \line {par Ph. Hardy. } \line { \fontsize #-2 \with-url #"http://superbonus.project.free.fr" \line { \fontsize #1 \hspace #1.0 \with-color #blue http://superbonus.project.free.fr } } } } } }

	  }

  guidemidi = {
	\repeat volta 2 {
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        \tempo 4 = 40 r1 \tempo 4 = 78 | } %fin du repeat
        R1 |
        r2 \tempo 4 = 34 r2 \tempo 4 = 78 |
        R1 |
        R1 |
        \tempo 4 = 34 r2 \tempo 4 = 78 r2 |
        R1 |
        \tempo 4 = 40 r1 |
	}

  upper = {
\displayLilyMusic \transpose d c {
	\time 4/4
	\key d \minor
	\clef treble
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c'' {
	\repeat volta 2 {
        a4 a g f |
        e2 d\fermata |
        a'4 a b cis |
        d2 cis\fermata |
        d8 e f4 e e |
        d1\fermata | } %fin du repeat
        a4 a bes a |
        g8 a16 bes g4 f2\fermata |
        a4 b c a |
        d4 c8 b b2 |
        a2\fermata a4 d |
        g,4 f8 e e2 |
        d1\fermata |
        \bar "|."
	} % fin de relative
	}

%	\context Voice="1" { \voiceTwo 
%	% ALTO
%	\set Voice.midiInstrument = "acoustic grand"
%	\relative c' {
%	\repeat volta 2 {
%        f4 f e d |
%        d4 cis a2 |
%        f'4 f f8 d g4 |
%        a4 g a2 |
%        a4 a bes! a8 g |
%        f1 | } %fin du repeat
%        f8 g a4 a8 g f4 |
%        f4 e c2 |
%        f4 f g e |
%        a8 e e f e f e d |
%        cis2 d4 d |
%        d8 cis d4 d8 cis16 b cis4 |
%        a1 |
%        \bar "|."
%	} % fin de relative
%	\oneVoice
%	} >>
 >>
}
	}

    lower = {
\transpose d c {
	\time 4/4
	\key d \minor
	\clef bass
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        d4 d d8 cis d4 |
        a8 bes a g f2 |
        d'4 d d8 b e4 |
        d8 e16 f e8 d e2 |
        a,4 d d cis |
        a1 | } %fin du repeat
        d4 d d c |
        c8 a bes g a2 |
        c4 d e cis |
        a8 b c a a4 gis! |
        a2 f8 g a f |
        g4 a8 bes a8 e a g |
        fis1 |
        \bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c {
	\repeat volta 2 {
        d8 e f d bes'4 a8 g |
        a4 a, d2\fermata |
        d8 e f d g4 f8 e |
        f8 g16 a bes!4 a2\fermata |
        f8 e d f g e a a, |
        d1\fermata | } %fin du repeat
        d8 e f d g4 a8 bes |
        c4 c, f2\fermata |
        f8 e d f e f g e |
        fis8 gis a d, e4 e, |
        a2\fermata d8 e f d |
        bes'!4 a8 g a4 a, |
        d1\fermata |
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
}
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "96." }
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




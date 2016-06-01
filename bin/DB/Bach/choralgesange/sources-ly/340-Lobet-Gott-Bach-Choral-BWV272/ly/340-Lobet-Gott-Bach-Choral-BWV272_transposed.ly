
\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 272" }
      piece = \markup { \hspace #9 \fontsize #2 \bold \column \center-align { \line { \hspace #9 "Lobet Gott, unsern Herren" }
                     \line { \italic "old: Befiehl du deine Wege" }
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
\displayLilyMusic \transpose d c {
	\time 4/4
	\key d \minor
	\clef treble
	\partial 4
        \mergeDifferentlyDottedOn
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        d8 e |
        f4 e f g |
        a2 a4\fermata c4 |
        b4 a a gis |
        a2.\fermata } %fin du repeat
\break
        a4 |
        b4 c d8 c b!4 |
        c4. bes!8 a4\fermata a4 |
        g4 f f e |
        f2.\fermata a8 g |
        f4 g a g |
        f2 e4\fermata f4 |
        g4 f e2 |
        d2.\fermata
        \bar "|."
	} % fin de relative
	}

	\context Voice="1" { \voiceTwo 
	% ALTO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        d8 cis |
        d4 bes a d8 c |
        c2 c4 c |
        f4 fis e e |
        e2. } %fin du repeat
        e8 fis |
        gis4 a a g |
        g4 f8 g f4 f8 es |
        d4 d c c |
        c2. e4 |
        f4. e8 f4. e8 ~ |
	e8 d8 d4 cis d ~ |
	d8 cis8 d4 ~ d cis! |
        a2.
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
}
	}

    lower = {
\transpose d c {
	\time 4/4
	\key d \minor
	\clef bass
	\partial 4
        \mergeDifferentlyDottedOn
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        a8 g |
        a4 g f f8 e |
        f2 f4 g |
        gis4 c b8 c d!4 |
        c2. } %fin du repeat
        c4 |
        d4 e d d |
        c8 e d c c4 c |
        bes4 aes g4. a16 bes |
        a2. a4 |
        a4 d8 c c4 d8 e |
        a,8 gis a b a4 a |
        g4 a a4. g8 |
        f2.
        \bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c {
	\repeat volta 2 {
        f8 e |
        d4. cis8 d c bes c |
        f,2 f4\fermata e' |
        d4 dis e e, |
        a2.\fermata } %fin du repeat
        a'4 ~ |
	a4 a8 g! fis4 g8 f |
        e8 c d e f4\fermata f, |
        bes4 b c c, |
        f2.\fermata cis'4 |
        d8 c! bes c f, a b cis |
        d8 bes! a gis a4\fermata d4 |
        e4 f8 g a4 a, |
        d2.\fermata
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
}
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "340." }
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




\version "2.14.1"

    \paper {
%	system-system-spacing #'padding = #0.1
%	score-system-spacing #'padding = #0.1
%	ragged-bottom = ##f
%	ragged-last-bottom = ##f
	}

    \header {
      opus = \markup { \bold "BWV 197.10" }
      piece = \markup { \hspace #9 \fontsize #2 \bold "Wer nur den lieben Gott läßt walten" }
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
        r2. \tempo 4 = 30 r4 \tempo 4 = 78 |
        R1 |
        R1 |
        \tempo 4 = 40 r2. \tempo 4 = 78 } %fin du repeat
        r4 |
        R1 |
        r2 \tempo 4 = 30 r4 \tempo 4 = 78 r4 |
        R1 |
        r2 \tempo 4 = 30 r4 
	}

  upper = {
	\time 4/4
	\key b \minor
	\clef treble
	\partial 4
	\voiceOne
	<< { 
	% SOPRANO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        fis4 |
        b4 cis d cis |
        b4 cis8 b ais4 fis\fermata |
        r4 a! a g! |
        fis4 b b ais |
        b2.\fermata } %fin du repeat
\break
        cis4 |
        d4 e fis fis |
        e4. d8 d4\fermata fis |
        e4 d cis b8 cis |
        d4 cis b\fermata
        \bar "|."
	} % fin de relative
	}

	\context Voice="1" { \voiceTwo 
	% ALTO
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        d8 e |
        fis4 fis fis fis8 e |
        d4 g fis cis |
        r4 fis fis e |
        e8 d d4 g fis |
        fis2. } %fin du repeat
        fis4 |
        fis4 a a a |
        b4 a a a8 b |
        cis4 fis, g8 fis fis e |
        fis4 fis8 e dis4
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}

    lower = {
	\time 4/4
	\key b \minor
	\clef bass
	\partial 4
	\voiceOne
	<< { 
	% TENOR
	\set Voice.midiInstrument = "acoustic grand"
	\relative c' {
	\repeat volta 2 {
        b8 cis |
        d4 cis b ais! |
        b4 e8 d cis4 ais |
        r4 cis d a! |
        a4 b cis8 d e4 |
        d2. } %fin du repeat
        ais4 |
        b4 cis d d |
        d4 cis fis d |
        ais4 b b8 ais b4 |
        b4 ais fis4
        \bar "|."
	} % fin de relative
	}
	\context Voice="1" { \voiceTwo 
	% BASS
	\set Voice.midiInstrument = "acoustic grand"
	\relative c {
	\repeat volta 2 {
        b4 |
        b'4 ais b fis |
        g8 fis e4 fis fis,\fermata |
        r4 fis' b, cis |
        d4 g8 fis e4 fis |
        b,2.\fermata } %fin du repeat
        fis'4 |
        b4 a!8 g fis e d4 |
        g4 a d,\fermata d |
        cis4 b e8 fis g4 |
        fis8 e fis4 b,4\fermata
        \bar "|."
	} % fin de relative
	\oneVoice
	} >>
	}


    \score { 

	\new PianoStaff <<
	\set PianoStaff.instrumentName = \markup { \bold \huge "62." }
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


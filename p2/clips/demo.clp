; ----------------------------------------------------------------------
; demo.clp — minimal CLIPS demo for p2 SBC (al fin del mundo y mas alla)
;
; Shows the building blocks the practice asks for:
;   - deftemplate                (typed facts)
;   - defrule with chained LHS   (chained reasoning)
;   - deffacts                   (initial knowledge)
;
; Run from the CLIPS REPL:
;   (clear) (load "demo.clp") (reset) (run) (facts)
; ----------------------------------------------------------------------

(deftemplate user
   (slot age         (type INTEGER))
   (slot objective   (type SYMBOL))   ; rest | cultural | fun | romantic | honeymoon
   (slot with-kids   (type SYMBOL)))  ; yes | no

(deftemplate inferred
   (slot key)
   (multislot value))   ; multislot so we can store lists of cities, sights, etc.


; --- inference rules --------------------------------------------------

(defrule honeymoon-is-romantic
   (user (objective honeymoon))
=>
   (assert (inferred (key trip-style) (value romantic)))
   (printout t "[infer] honeymoon -> romantic" crlf))

(defrule romantic-no-kids
   (inferred (key trip-style) (value romantic))
   (user (with-kids no))
=>
   (assert (inferred (key suggested-cities) (value (create$ Paris Venice Vienna)))))

(defrule kids-not-rest
   (user (with-kids yes) (objective rest))
=>
   (printout t "[warn] kids + rest trip is rarely a rest trip" crlf))


; --- demo input --------------------------------------------------------

(deffacts demo-input
   (user (age 34) (objective honeymoon) (with-kids no)))

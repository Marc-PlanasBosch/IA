; ======================================================================
; main.clp — p2 SBC scaffold ("al fin del mundo y mas alla")
;
; Demonstrates the patterns the rubric (PRD §5.3) requires:
;   * deftemplate AND defclass (COOL)         <- knowledge representation
;   * defmodule with focus chain              <- modular control flow
;   * chained reasoning rules                 <- LHS facts produced by other rules
;   * infeasibility detection                 <- FR-7
;   * two distinct trip plans                 <- FR-4
;
; How to run (CLIPS REPL):
;   (clear)
;   (load "data.clp")
;   (load "main.clp")
;   (start)
;
; Or, in the IDE: File -> Load Batch... -> select run.bat
; ======================================================================


; ---------------------------------------------------------------- MAIN
;
; MAIN owns every shared deftemplate / defclass.
; (export ?ALL) makes them visible to the phase modules.

(defmodule MAIN (export ?ALL))


; ---- domain templates -------------------------------------------------

(deftemplate user
   (slot age          (type INTEGER) (default 30))
   (slot group-type   (type SYMBOL)  (default single))
                      ; single | family | friends | large
   (slot objective    (type SYMBOL)  (default cultural))
                      ; rest | cultural | fun | romantic | honeymoon
   (slot with-kids    (type SYMBOL)  (default no))
   (slot budget       (type INTEGER) (default 2000))
   (slot min-cities   (type INTEGER) (default 1))
   (slot max-cities   (type INTEGER) (default 3))
   (slot min-days     (type INTEGER) (default 3))
   (slot max-days     (type INTEGER) (default 14)))

(deftemplate inferred
   (slot key)
   (multislot value))

(deftemplate plan
   (slot id                  (type INTEGER))
   (multislot cities         (type INSTANCE-NAME))
   (multislot accommodations (type INSTANCE-NAME))   ; parallel index with cities
   (slot transport           (type INSTANCE-NAME))
   (slot cost                (type INTEGER) (default 0))
   (multislot satisfies))

(deftemplate infeasible
   (slot reason (type STRING)))


; ---- COOL classes mirroring the OWL ontology (see DECISIONS D-008) ---

(defclass CITY (is-a USER)
   (role concrete)
   (slot name        (type SYMBOL)  (create-accessor read-write))
   (slot country     (type SYMBOL)  (create-accessor read-write))
   (slot cost-level  (type INTEGER) (create-accessor read-write))
   (multislot themes (type SYMBOL)  (create-accessor read-write))
   (multislot sights (type SYMBOL)  (create-accessor read-write)))

(defclass ACCOMMODATION (is-a USER)
   (role concrete)
   (slot name        (type SYMBOL)        (create-accessor read-write))
   (slot kind        (type SYMBOL)        (create-accessor read-write))   ; Hotel | Hostel | Apartment
   (slot star-rating (type INTEGER)       (create-accessor read-write))
   (slot price-night (type INTEGER)       (create-accessor read-write))
   (slot located-in  (type INSTANCE-NAME) (allowed-classes CITY)
                     (create-accessor read-write)))

(defclass TRANSPORT (is-a USER)
   (role concrete)
   (slot name      (type SYMBOL)  (create-accessor read-write))
   (slot kind      (type SYMBOL)  (create-accessor read-write))   ; Flight | Train | Bus
   (slot price-eur (type INTEGER) (create-accessor read-write)))


; ---- seed test user (swap for an interactive interview later) --------

(deffacts test-user
   (user (age 34) (group-type single) (objective honeymoon)
         (with-kids no) (budget 2500)
         (min-cities 2) (max-cities 3)
         (min-days 5)   (max-days 10)))


; ============================================================ INTERVIEW
;
; In a real version this module would `read` answers from the user.
; For the prototype it just announces which user we are processing —
; the user fact comes from deffacts above.

(defmodule interview (import MAIN ?ALL))

(defrule interview::header
   (declare (salience 100))
   ?u <- (user (objective ?o) (budget ?b))
=>
   (printout t crlf "=== INTERVIEW ===" crlf
             "  objective: " ?o "   budget: " ?b " EUR" crlf))


; ============================================================ INFERENCE
;
; Common-sense rules that derive new facts from the user profile.
; These are exactly the "chained reasoning" the rubric rewards:
; rule output (an `inferred` fact) is the LHS of the next phase.

(defmodule inference (import MAIN ?ALL))

(defrule inference::honeymoon-is-romantic
   (user (objective honeymoon))
=>
   (assert (inferred (key trip-style) (value romantic)))
   (printout t "[infer] honeymoon -> trip-style romantic" crlf))

(defrule inference::default-style
   (user (objective ?o&~honeymoon))
   (not (inferred (key trip-style)))
=>
   (assert (inferred (key trip-style) (value ?o)))
   (printout t "[infer] trip-style = " ?o crlf))

(defrule inference::kids-soften-rest
   (user (with-kids yes) (objective rest))
=>
   (printout t "[infer] kids + rest -> reclassify as cultural" crlf)
   (assert (inferred (key trip-style) (value cultural))))


; ============================================================= GENERATE
;
; Pick candidate cities matching the trip style, build two plans that
; visit DIFFERENT cities (FR-4). Detect infeasibility (FR-7) when not
; enough candidates exist.

(defmodule generate (import MAIN ?ALL))

(defrule generate::build-two-plans
   (user (max-cities ?mc&:(>= ?mc 2)))
   (inferred (key trip-style) (value ?style))
=>
   (bind ?cands (find-all-instances ((?c CITY))
                                    (member$ ?style ?c:themes)))
   (bind ?n (length$ ?cands))
   (if (< ?n 4)
      then
        (assert (infeasible
                  (reason (str-cat "Only " ?n
                                   " cities match style '" ?style
                                   "'; need >= 4 to build 2 disjoint plans."))))
      else
        (bind ?p1     (subseq$ ?cands 1 2))
        (bind ?p2     (subseq$ ?cands 3 4))
        (bind ?accs1  (accommodations-for ?p1))
        (bind ?accs2  (accommodations-for ?p2))
        (bind ?t      (default-transport))
        (bind ?cost1  (plan-cost ?accs1 ?t))
        (bind ?cost2  (plan-cost ?accs2 ?t))
        (assert (plan (id 1) (cities ?p1) (accommodations ?accs1)
                      (transport ?t) (cost ?cost1)))
        (assert (plan (id 2) (cities ?p2) (accommodations ?accs2)
                      (transport ?t) (cost ?cost2)))
        (printout t "[generate] built 2 plans from " ?n " candidates" crlf)))

; pick one accommodation per visited city (parallel index)
(deffunction accommodations-for (?cities)
   (bind ?result (create$))
   (progn$ (?c ?cities)
      (bind ?accs (find-all-instances ((?a ACCOMMODATION))
                                      (eq ?a:located-in (instance-name ?c))))
      (if (> (length$ ?accs) 0)
         then (bind ?result (create$ ?result (nth$ 1 ?accs)))))
   ?result)

; default transport: prefer Train, fall back to anything available
(deffunction default-transport ()
   (bind ?ts (find-all-instances ((?t TRANSPORT)) (eq ?t:kind Train)))
   (if (> (length$ ?ts) 0)
      then (nth$ 1 ?ts)
      else (nth$ 1 (find-all-instances ((?t TRANSPORT))))))

; cost = (3 nights per accommodation * price-night) + transport price
(deffunction plan-cost (?accs ?transport)
   (bind ?total (send ?transport get-price-eur))
   (progn$ (?a ?accs)
      (bind ?total (+ ?total (* 3 (send ?a get-price-night)))))
   ?total)


; ================================================================ SCORE
;
; Annotate each plan with which user preferences it satisfies (FR-6).
; The `(test (not (member$ ...)))` guard prevents the rule from firing
; twice on its own modify.

(defmodule score (import MAIN ?ALL))

(defrule score::within-budget
   ?p <- (plan (cost ?c) (satisfies $?s))
   (user (budget ?b))
   (test (<= ?c ?b))
   (test (not (member$ within-budget ?s)))
=>
   (modify ?p (satisfies $?s within-budget)))

(defrule score::matches-style
   ?p <- (plan (satisfies $?s))
   (inferred (key trip-style) (value ?style))
   (test (not (member$ matches-style ?s)))
=>
   (modify ?p (satisfies $?s matches-style)))


; ============================================================== PRESENT
;
; Output (FR-5). If infeasible, explain why instead of producing a plan.

(defmodule present (import MAIN ?ALL))

(defrule present::infeasible
   (declare (salience 10))
   (infeasible (reason ?r))
=>
   (printout t crlf "=== INFEASIBLE ===" crlf "  " ?r crlf))

(defrule present::plan
   (plan (id ?i) (cities $?cs) (accommodations $?as)
         (transport ?t) (cost ?c) (satisfies $?s))
=>
   (printout t crlf "=== PLAN " ?i " ===" crlf
             "  cities   : " ?cs crlf
             "  stays in : " ?as crlf
             "  transport: " ?t crlf
             "  cost     : " ?c " EUR" crlf
             "  satisfies: " ?s crlf))


; ============================================================== DRIVER

(deffunction start ()
   (reset)
   (focus interview inference generate score present)
   (run))

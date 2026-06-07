(define (domain viatges-ext1)

  ;; -------------------------------------------------------------------
  ;; EXTENSIÓ 1 = Nivell bàsic + dies
  ;; S'indica el mínim i el màxim de dies que es pot estar a cada ciutat
  ;; i el mínim de dies que ha de durar el recorregut. El pla resultant
  ;; respecta aquestes restriccions i diu quants dies s'està a cada ciutat.
  ;;
  ;; Modelat dels dies: en arribar a una ciutat s'hi assignen els dies
  ;; mínims (min-days-city). L'acció stay-extra-day allarga l'estada d'un
  ;; dia, mai per sobre del màxim (max-days-city). El comptador total-days
  ;; acumula els dies del recorregut sencer.
  ;; -------------------------------------------------------------------

  (:requirements :strips :typing :fluents)

  (:types
    city hotel - object
  )

  (:predicates
    (hotel-at ?h - hotel ?c - city)
    (flight ?from - city ?to - city)
    (at ?c - city)
    (visited ?c - city)
    (started)
    (booked ?h - hotel)
  )

  (:functions
    (num-visited)      ; ciutats visitades
    (min-cities)       ; mínim de ciutats a visitar
    (total-days)       ; dies totals del recorregut
    (days-in ?c - city); dies que s'està a la ciutat ?c
    (min-days-city)    ; mínim de dies per ciutat
    (max-days-city)    ; màxim de dies per ciutat
    (min-days-trip)    ; mínim de dies del recorregut sencer
  )

  (:action choose-start
    :parameters (?c - city ?h - hotel)
    :precondition (and (not (started))
                       (hotel-at ?h ?c))
    :effect (and (started)
                 (at ?c)
                 (visited ?c)
                 (booked ?h)
                 (increase (num-visited) 1)
                 (assign (days-in ?c) (min-days-city))
                 (increase (total-days) (min-days-city)))
  )

  (:action travel
    :parameters (?from - city ?to - city ?h - hotel)
    :precondition (and (started)
                       (at ?from)
                       (flight ?from ?to)
                       (not (visited ?to))
                       (hotel-at ?h ?to))
    :effect (and (not (at ?from))
                 (at ?to)
                 (visited ?to)
                 (booked ?h)
                 (increase (num-visited) 1)
                 (assign (days-in ?to) (min-days-city))
                 (increase (total-days) (min-days-city)))
  )

  ;; Allarga un dia l'estada a la ciutat actual, sense superar el màxim.
  (:action stay-extra-day
    :parameters (?c - city)
    :precondition (and (at ?c)
                       (< (days-in ?c) (max-days-city)))
    :effect (and (increase (days-in ?c) 1)
                 (increase (total-days) 1))
  )
)

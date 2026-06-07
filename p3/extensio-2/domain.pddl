(define (domain viatges-ext2)

  ;; -------------------------------------------------------------------
  ;; EXTENSIÓ 2 = Extensió 1 + interès
  ;; Cada ciutat té un interès enter (p. ex. 1..3, sent 1 el màxim interès).
  ;; Volem un pla que MINIMITZI la suma d'interessos de les ciutats
  ;; visitades (minimitzar el valor numèric = maximitzar l'interès real).
  ;; Es manté tot el model de l'Extensió 1 (dies mín/màx i dies del
  ;; recorregut) i s'afegeix l'acumulador d'interès.
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
    (num-visited)
    (min-cities)
    (total-days)
    (days-in ?c - city)
    (min-days-city)
    (max-days-city)
    (min-days-trip)
    (interest ?c - city)   ; interès de la ciutat ?c (1 = màxim interès)
    (total-interest)       ; suma d'interessos de les ciutats visitades
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
                 (increase (total-days) (min-days-city))
                 (increase (total-interest) (interest ?c)))
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
                 (increase (total-days) (min-days-city))
                 (increase (total-interest) (interest ?to)))
  )

  (:action stay-extra-day
    :parameters (?c - city)
    :precondition (and (at ?c)
                       (< (days-in ?c) (max-days-city)))
    :effect (and (increase (days-in ?c) 1)
                 (increase (total-days) 1))
  )
)

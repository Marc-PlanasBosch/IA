(define (domain viatges-basic)

  ;; -------------------------------------------------------------------
  ;; NIVELL BÀSIC
  ;; Donat un conjunt de ciutats, els hotels de cada ciutat i els vols
  ;; que les connecten, i un nombre mínim de ciutats a visitar,
  ;; el planificador tria una ciutat d'inici, construeix un camí de vols
  ;; sense repetir ciutats i reserva un hotel a cada ciutat visitada.
  ;; -------------------------------------------------------------------

  (:requirements :strips :typing :fluents)

  (:types
    city hotel - object
  )

  (:predicates
    (hotel-at ?h - hotel ?c - city) ; l'hotel ?h es troba a la ciutat ?c
    (flight ?from - city ?to - city); existeix un vol directe de ?from a ?to
    (at ?c - city)                  ; el viatger es troba ara a la ciutat ?c
    (visited ?c - city)             ; la ciutat ?c ja ha estat visitada
    (started)                       ; el viatge ja ha començat
    (booked ?h - hotel)             ; s'ha reservat l'hotel ?h
  )

  (:functions
    (num-visited)   ; nombre de ciutats visitades fins ara
    (min-cities)    ; nombre mínim de ciutats que cal visitar
  )

  ;; Tria la ciutat d'inici del recorregut i reserva-hi hotel.
  ;; El planificador decideix lliurement quina ciutat és l'origen.
  (:action choose-start
    :parameters (?c - city ?h - hotel)
    :precondition (and (not (started))
                       (hotel-at ?h ?c))
    :effect (and (started)
                 (at ?c)
                 (visited ?c)
                 (booked ?h)
                 (increase (num-visited) 1))
  )

  ;; Viatja d'una ciutat a una altra connectada per un vol,
  ;; sempre que la destinació no s'hagi visitat encara, i reserva-hi hotel.
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
                 (increase (num-visited) 1))
  )
)

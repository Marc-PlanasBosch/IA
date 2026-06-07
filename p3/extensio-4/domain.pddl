(define (domain viatges-ext4)

  ;; -------------------------------------------------------------------
  ;; EXTENSIÓ 4 = Extensió 2 + Extensió 3
  ;; El pla optimitza alhora l'interès de les ciutats visitades i el preu
  ;; total del recorregut. Com que interès i preu tenen unitats molt
  ;; diferents, la mètrica del problema combina tots dos amb PONDERACIONS
  ;; (pesos), i comprovem que pesos diferents donen plans diferents.
  ;;
  ;; Reuneix tot el model anterior: vols com a objectes amb preu, hotels
  ;; amb preu per nit, dies mín/màx, i interès per ciutat.
  ;; -------------------------------------------------------------------

  (:requirements :strips :typing :fluents)

  (:types
    city hotel flight - object
  )

  (:predicates
    (hotel-at ?h - hotel ?c - city)
    (flight-route ?f - flight ?from - city ?to - city)
    (at ?c - city)
    (visited ?c - city)
    (started)
    (booked ?h - hotel)
    (flight-used ?f - flight)
  )

  (:functions
    (num-visited)
    (min-cities)
    (total-days)
    (days-in ?c - city)
    (min-days-city)
    (max-days-city)
    (min-days-trip)
    (total-price)
    (hotel-price ?h - hotel)
    (flight-price ?f - flight)
    (min-price)
    (max-price)
    (interest ?c - city)
    (total-interest)
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
                 (increase (total-price) (* (hotel-price ?h) (min-days-city)))
                 (increase (total-interest) (interest ?c)))
  )

  (:action travel
    :parameters (?f - flight ?from - city ?to - city ?h - hotel)
    :precondition (and (started)
                       (at ?from)
                       (flight-route ?f ?from ?to)
                       (not (visited ?to))
                       (hotel-at ?h ?to))
    :effect (and (not (at ?from))
                 (at ?to)
                 (visited ?to)
                 (booked ?h)
                 (flight-used ?f)
                 (increase (num-visited) 1)
                 (assign (days-in ?to) (min-days-city))
                 (increase (total-days) (min-days-city))
                 (increase (total-price) (flight-price ?f))
                 (increase (total-price) (* (hotel-price ?h) (min-days-city)))
                 (increase (total-interest) (interest ?to)))
  )

  (:action stay-extra-day
    :parameters (?c - city ?h - hotel)
    :precondition (and (at ?c)
                       (booked ?h)
                       (hotel-at ?h ?c)
                       (< (days-in ?c) (max-days-city)))
    :effect (and (increase (days-in ?c) 1)
                 (increase (total-days) 1)
                 (increase (total-price) (hotel-price ?h)))
  )
)

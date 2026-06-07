(define (domain viatges-ext3)

  ;; -------------------------------------------------------------------
  ;; EXTENSIÓ 3 = Extensió 1 + preus
  ;; Els vols i els hotels tenen un preu. Volem minimitzar el preu total
  ;; del pla, respectant un preu mínim i un preu màxim total.
  ;;
  ;; Modelat:
  ;;  - Els VOLS són objectes (tipus flight): pot haver-hi diversos vols
  ;;    entre el mateix parell de ciutats amb preus diferents i el
  ;;    planificador ha de triar.
  ;;  - El preu de l'hotel és PER NIT. En arribar a una ciutat es paguen
  ;;    les nits mínimes (hotel-price * min-days-city) i cada stay-extra-day
  ;;    paga una nit addicional. Així els dies afecten el preu (realista) i
  ;;    el planificador no afegeix nits innecessàries.
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
    (hotel-price ?h - hotel)   ; preu per nit de l'hotel ?h
    (flight-price ?f - flight) ; preu del vol ?f
    (min-price)
    (max-price)
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
                 (increase (total-price) (* (hotel-price ?h) (min-days-city))))
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
                 (increase (total-price) (* (hotel-price ?h) (min-days-city))))
  )

  ;; Una nit més a la ciutat actual: paga una nit de l'hotel reservat.
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

(define (problem viatge-ext4-2)

  ;; -------------------------------------------------------------------
  ;; Joc de prova 2 (ext.4): PONDERACIÓ ORIENTADA A L'INTERÈS.
  ;; MATEIX MAPA que el problema 1, però mètrica = 100*interès + 1*preu.
  ;; Ara el pes de l'interès és prou gran per compensar la diferència
  ;; d'unitats, de manera que el planificador prioritza visitar ciutats
  ;; de bon interès (par, rom) encara que siguin més cares.
  ;;
  ;; Resultat esperat: un pla DIFERENT del problema 1 — inclou les ciutats
  ;; interessants (interès baix = bo) tot i pagar més.
  ;; Comparant els dos problemes es veu l'efecte de la ponderació.
  ;; -------------------------------------------------------------------

  (:domain viatges-ext4)

  (:objects
    bcn lon ams par rom - city
    h-bcn h-lon h-ams h-par h-rom - hotel
    f-bl f-lb f-la f-al f-ba f-ab
    f-pr f-rp
    f-bp f-pb f-lp f-pl f-ar f-ra f-ap f-pa
    f-br f-rb - flight
  )

  (:init
    (hotel-at h-bcn bcn) (hotel-at h-lon lon) (hotel-at h-ams ams)
    (hotel-at h-par par) (hotel-at h-rom rom)

    (= (hotel-price h-bcn) 40) (= (hotel-price h-lon) 40) (= (hotel-price h-ams) 40)
    (= (hotel-price h-par) 120) (= (hotel-price h-rom) 120)

    (= (interest bcn) 3) (= (interest lon) 3) (= (interest ams) 3)
    (= (interest par) 1) (= (interest rom) 1)

    (flight-route f-bl bcn lon) (= (flight-price f-bl) 50)
    (flight-route f-lb lon bcn) (= (flight-price f-lb) 50)
    (flight-route f-la lon ams) (= (flight-price f-la) 50)
    (flight-route f-al ams lon) (= (flight-price f-al) 50)
    (flight-route f-ba bcn ams) (= (flight-price f-ba) 50)
    (flight-route f-ab ams bcn) (= (flight-price f-ab) 50)

    (flight-route f-pr par rom) (= (flight-price f-pr) 60)
    (flight-route f-rp rom par) (= (flight-price f-rp) 60)

    (flight-route f-bp bcn par) (= (flight-price f-bp) 200)
    (flight-route f-pb par bcn) (= (flight-price f-pb) 200)
    (flight-route f-lp lon par) (= (flight-price f-lp) 200)
    (flight-route f-pl par lon) (= (flight-price f-pl) 200)
    (flight-route f-ar ams rom) (= (flight-price f-ar) 200)
    (flight-route f-ra rom ams) (= (flight-price f-ra) 200)
    (flight-route f-ap ams par) (= (flight-price f-ap) 200)
    (flight-route f-pa par ams) (= (flight-price f-pa) 200)
    (flight-route f-br bcn rom) (= (flight-price f-br) 200)
    (flight-route f-rb rom bcn) (= (flight-price f-rb) 200)

    (= (num-visited) 0)
    (= (min-cities) 3)

    (= (total-days) 0)
    (= (min-days-city) 1)
    (= (max-days-city) 1)
    (= (min-days-trip) 3)

    (= (total-price) 0)
    (= (min-price) 1)
    (= (max-price) 2000)

    (= (total-interest) 0)
  )

  (:goal (and (>= (num-visited) (min-cities))
              (>= (total-days) (min-days-trip))
              (>= (total-price) (min-price))
              (<= (total-price) (max-price))))

  ;; ponderació orientada a l'interès (interès amb pes 100)
  (:metric minimize (+ (* 100 (total-interest)) (* 1 (total-price))))
)

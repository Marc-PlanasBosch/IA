(define (problem viatge-ext4-1)

  ;; -------------------------------------------------------------------
  ;; Joc de prova 1 (ext.4): PONDERACIÓ ORIENTADA AL PREU.
  ;; Mètrica = 1*interès + 1*preu  → com que els preus (centenars) són molt
  ;; més grans que els interessos (unitats), de fet mana el preu.
  ;;
  ;; Mapa (compartit amb el problema 2): hi ha un "triangle avorrit" de
  ;; ciutats barates però d'interès dolent (bcn, lon, ams: interès 3) i un
  ;; parell de ciutats "interessants" (par, rom: interès 1) que són cares
  ;; d'hotel i de vol. Mín 3 ciutats.
  ;;
  ;; Resultat esperat: el pla barat → visita el triangle avorrit
  ;; (interès alt = dolent, però preu baix).
  ;; -------------------------------------------------------------------

  (:domain viatges-ext4)

  (:objects
    bcn lon ams par rom - city
    h-bcn h-lon h-ams h-par h-rom - hotel
    f-bl f-lb f-la f-al f-ba f-ab        ; triangle barat (avorrit)
    f-pr f-rp                            ; enllaç interessant barat
    f-bp f-pb f-lp f-pl f-ar f-ra f-ap f-pa  ; avorrit<->interessant (cars)
    f-br f-rb - flight
  )

  (:init
    (hotel-at h-bcn bcn) (hotel-at h-lon lon) (hotel-at h-ams ams)
    (hotel-at h-par par) (hotel-at h-rom rom)

    ;; hotels (preu per nit): barats els avorrits, cars els interessants
    (= (hotel-price h-bcn) 40) (= (hotel-price h-lon) 40) (= (hotel-price h-ams) 40)
    (= (hotel-price h-par) 120) (= (hotel-price h-rom) 120)

    ;; interès (1 = màxim interès): avorrits=3, interessants=1
    (= (interest bcn) 3) (= (interest lon) 3) (= (interest ams) 3)
    (= (interest par) 1) (= (interest rom) 1)

    ;; triangle barat (avorrit)
    (flight-route f-bl bcn lon) (= (flight-price f-bl) 50)
    (flight-route f-lb lon bcn) (= (flight-price f-lb) 50)
    (flight-route f-la lon ams) (= (flight-price f-la) 50)
    (flight-route f-al ams lon) (= (flight-price f-al) 50)
    (flight-route f-ba bcn ams) (= (flight-price f-ba) 50)
    (flight-route f-ab ams bcn) (= (flight-price f-ab) 50)

    ;; enllaç entre ciutats interessants (barat)
    (flight-route f-pr par rom) (= (flight-price f-pr) 60)
    (flight-route f-rp rom par) (= (flight-price f-rp) 60)

    ;; connexions avorrit <-> interessant (cares)
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

  ;; ponderació orientada al preu (interès amb pes 1)
  (:metric minimize (+ (* 1 (total-interest)) (* 1 (total-price))))
)

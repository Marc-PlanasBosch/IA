(define (problem viatge-ext3-1)

  ;; -------------------------------------------------------------------
  ;; Joc de prova 1 (ext.3): minimitzar preu amb un rang ample (100..500).
  ;; Hi ha dos vols bcn<->par (un car de 100 i un de barat de 60) i dos
  ;; hotels a par (un de 80 i un de 50). En minimitzar, el planificador
  ;; ha d'escollir el vol i l'hotel barats.  Mín 3 ciutats.
  ;; -------------------------------------------------------------------

  (:domain viatges-ext3)

  (:objects
    bcn par rom lon - city
    h-bcn h-par1 h-par2 h-rom h-lon - hotel
    f-bp1 f-bp2 f-pb1 f-pb2          ; bcn<->par (car/barat)
    f-pr f-rp f-rl f-lr f-pl f-lp
    f-br f-rb f-bl f-lb - flight
  )

  (:init
    (hotel-at h-bcn bcn)
    (hotel-at h-par1 par) (hotel-at h-par2 par)
    (hotel-at h-rom rom)
    (hotel-at h-lon lon)

    (= (hotel-price h-bcn) 50)
    (= (hotel-price h-par1) 80)
    (= (hotel-price h-par2) 50)
    (= (hotel-price h-rom) 60)
    (= (hotel-price h-lon) 70)

    ;; vols i preus
    (flight-route f-bp1 bcn par) (= (flight-price f-bp1) 100)
    (flight-route f-bp2 bcn par) (= (flight-price f-bp2) 60)
    (flight-route f-pb1 par bcn) (= (flight-price f-pb1) 100)
    (flight-route f-pb2 par bcn) (= (flight-price f-pb2) 60)
    (flight-route f-pr par rom)  (= (flight-price f-pr) 90)
    (flight-route f-rp rom par)  (= (flight-price f-rp) 90)
    (flight-route f-rl rom lon)  (= (flight-price f-rl) 80)
    (flight-route f-lr lon rom)  (= (flight-price f-lr) 80)
    (flight-route f-pl par lon)  (= (flight-price f-pl) 110)
    (flight-route f-lp lon par)  (= (flight-price f-lp) 110)
    (flight-route f-br bcn rom)  (= (flight-price f-br) 120)
    (flight-route f-rb rom bcn)  (= (flight-price f-rb) 120)
    (flight-route f-bl bcn lon)  (= (flight-price f-bl) 150)
    (flight-route f-lb lon bcn)  (= (flight-price f-lb) 150)

    (= (num-visited) 0)
    (= (min-cities) 3)

    (= (total-days) 0)
    (= (min-days-city) 1)
    (= (max-days-city) 2)
    (= (min-days-trip) 3)

    (= (total-price) 0)
    (= (min-price) 100)
    (= (max-price) 500)
  )

  (:goal (and (>= (num-visited) (min-cities))
              (>= (total-days) (min-days-trip))
              (>= (total-price) (min-price))
              (<= (total-price) (max-price))))

  (:metric minimize (total-price))
)

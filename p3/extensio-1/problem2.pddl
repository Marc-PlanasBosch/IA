(define (problem viatge-ext1-2)

  ;; -------------------------------------------------------------------
  ;; Joc de prova 2 (ext.1): graf parcialment connex (cadena amb branca),
  ;; mín 4 ciutats. Dies per ciutat entre 1 i 3, mínim de recorregut 4.
  ;; Objectiu: 4 ciutats a 1 dia ja arriben al mínim de 4 dies del
  ;; recorregut, de manera que NO cal cap stay-extra-day (estada mínima).
  ;; Es comprova el cas límit en què les restriccions ja es compleixen
  ;; amb l'estada mínima a cada ciutat.
  ;; -------------------------------------------------------------------

  (:domain viatges-ext1)

  (:objects
    mad bcn par ber ams rom - city
    h-mad h-bcn h-par h-ber h-ams h-rom - hotel
  )

  (:init
    (hotel-at h-mad mad)
    (hotel-at h-bcn bcn)
    (hotel-at h-par par)
    (hotel-at h-ber ber)
    (hotel-at h-ams ams)
    (hotel-at h-rom rom)

    (flight mad bcn) (flight bcn mad)
    (flight bcn par) (flight par bcn)
    (flight par ber) (flight ber par)
    (flight ber ams) (flight ams ber)
    (flight par rom) (flight rom par)
    (flight rom ber) (flight ber rom)

    (= (num-visited) 0)
    (= (min-cities) 4)

    (= (total-days) 0)
    (= (min-days-city) 1)
    (= (max-days-city) 3)
    (= (min-days-trip) 4)
  )

  (:goal (and (>= (num-visited) (min-cities))
              (>= (total-days) (min-days-trip))))

  (:metric minimize (total-days))
)

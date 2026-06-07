(define (problem viatge-basic-2)

  ;; -------------------------------------------------------------------
  ;; Joc de prova 2 (bàsic): graf NO totalment connectat (en forma de
  ;; cadena/camí) i es demana visitar com a mínim 4 ciutats.
  ;; Objectiu: comprovar que el planificador respecta les connexions
  ;; reals (no totes les ciutats estan connectades entre si) i que tot i
  ;; així troba un recorregut vàlid que passa per 4 ciutats.
  ;; Connexions:  mad - bcn - par - ber - ams   (i tornada)
  ;;                          \-- rom --/
  ;; -------------------------------------------------------------------

  (:domain viatges-basic)

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

    ;; graf parcialment connex (no totes les connexions existeixen)
    (flight mad bcn) (flight bcn mad)
    (flight bcn par) (flight par bcn)
    (flight par ber) (flight ber par)
    (flight ber ams) (flight ams ber)
    (flight par rom) (flight rom par)
    (flight rom ber) (flight ber rom)

    (= (num-visited) 0)
    (= (min-cities) 4)
  )

  (:goal (>= (num-visited) (min-cities)))

  ;; sense altres criteris, minimitzem el nombre de ciutats: el pla visitarà
  ;; exactament el mínim demanat (camí més curt que compleix la restricció).
  (:metric minimize (num-visited))
)

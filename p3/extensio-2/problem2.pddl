(define (problem viatge-ext2-2)

  ;; -------------------------------------------------------------------
  ;; Joc de prova 2 (ext.2): graf PARCIAL on les ciutats de menor interès
  ;; NO estan totes connectades entre si, de manera que el planificador
  ;; ha d'arribar a un compromís entre interès i connectivitat.
  ;; Mín 4 ciutats.
  ;; Connexions:  mad - bcn - par - ber - ams   (cadena)
  ;;                          \-- rom --/
  ;; Interessos:  mad=2  bcn=1  par=3  ber=1  ams=1  rom=2
  ;; Les ciutats d'interès 1 (bcn, ber, ams) no formen un camí de 4 per
  ;; si soles; cal incloure-hi par (interès 3) o rom (interès 2).
  ;; -------------------------------------------------------------------

  (:domain viatges-ext2)

  (:objects
    mad bcn par ber ams rom - city
    h-mad h-bcn h-par h-ber h-ams h-rom - hotel
  )

  (:init
    (hotel-at h-mad mad) (hotel-at h-bcn bcn) (hotel-at h-par par)
    (hotel-at h-ber ber) (hotel-at h-ams ams) (hotel-at h-rom rom)

    (flight mad bcn) (flight bcn mad)
    (flight bcn par) (flight par bcn)
    (flight par ber) (flight ber par)
    (flight ber ams) (flight ams ber)
    (flight par rom) (flight rom par)
    (flight rom ber) (flight ber rom)

    (= (interest mad) 2)
    (= (interest bcn) 1)
    (= (interest par) 3)
    (= (interest ber) 1)
    (= (interest ams) 1)
    (= (interest rom) 2)

    (= (num-visited) 0)
    (= (min-cities) 4)

    ;; dies fixats (1 per ciutat): en l'ext.2 el focus és l'interès.
    (= (total-days) 0)
    (= (min-days-city) 1)
    (= (max-days-city) 1)
    (= (min-days-trip) 4)

    (= (total-interest) 0)
  )

  (:goal (and (>= (num-visited) (min-cities))
              (>= (total-days) (min-days-trip))))

  (:metric minimize (total-interest))
)

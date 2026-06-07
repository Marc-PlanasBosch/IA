(define (problem viatge-ext2-1)

  ;; -------------------------------------------------------------------
  ;; Joc de prova 1 (ext.2): graf complet de 5 ciutats amb interessos
  ;; diferents. Mín 3 ciutats. Dies poc restrictius (no interfereixen).
  ;; Interessos:  bcn=1  par=1  lon=2  rom=3  ams=3
  ;; Objectiu: en minimitzar l'interès, el planificador hauria d'escollir
  ;; les 3 ciutats de menor valor (bcn, par, lon = 4) i evitar rom i ams.
  ;; -------------------------------------------------------------------

  (:domain viatges-ext2)

  (:objects
    bcn par lon rom ams - city
    h-bcn h-par h-lon h-rom h-ams - hotel
  )

  (:init
    (hotel-at h-bcn bcn) (hotel-at h-par par) (hotel-at h-lon lon)
    (hotel-at h-rom rom) (hotel-at h-ams ams)

    ;; graf complet (anada i tornada entre tots els parells)
    (flight bcn par) (flight par bcn)
    (flight bcn lon) (flight lon bcn)
    (flight bcn rom) (flight rom bcn)
    (flight bcn ams) (flight ams bcn)
    (flight par lon) (flight lon par)
    (flight par rom) (flight rom par)
    (flight par ams) (flight ams par)
    (flight lon rom) (flight rom lon)
    (flight lon ams) (flight ams lon)
    (flight rom ams) (flight ams rom)

    (= (interest bcn) 1)
    (= (interest par) 1)
    (= (interest lon) 2)
    (= (interest rom) 3)
    (= (interest ams) 3)

    (= (num-visited) 0)
    (= (min-cities) 3)

    ;; dies fixats (1 per ciutat): en l'ext.2 el focus és l'interès, així
    ;; que fixem els dies per ciutat (min = max) i la traça queda neta.
    (= (total-days) 0)
    (= (min-days-city) 1)
    (= (max-days-city) 1)
    (= (min-days-trip) 3)

    (= (total-interest) 0)
  )

  (:goal (and (>= (num-visited) (min-cities))
              (>= (total-days) (min-days-trip))))

  (:metric minimize (total-interest))
)

(define (problem viatge-basic-1)

  ;; -------------------------------------------------------------------
  ;; Joc de prova 1 (bàsic): graf petit i totalment connectat (anada/tornada
  ;; entre tots els parells). Es demana visitar com a mínim 3 ciutats.
  ;; Objectiu: comprovar que el planificador tria una ciutat d'inici i
  ;; construeix un camí de 3 ciutats sense repetir-ne cap, reservant hotel.
  ;; -------------------------------------------------------------------

  (:domain viatges-basic)

  (:objects
    bcn par rom lon - city
    h-bcn h-par h-rom h-lon - hotel
  )

  (:init
    ;; un hotel per ciutat
    (hotel-at h-bcn bcn)
    (hotel-at h-par par)
    (hotel-at h-rom rom)
    (hotel-at h-lon lon)

    ;; vols (ida i tornada) entre tots els parells
    (flight bcn par) (flight par bcn)
    (flight bcn rom) (flight rom bcn)
    (flight bcn lon) (flight lon bcn)
    (flight par rom) (flight rom par)
    (flight par lon) (flight lon par)
    (flight rom lon) (flight lon rom)

    (= (num-visited) 0)
    (= (min-cities) 3)
  )

  (:goal (>= (num-visited) (min-cities)))

  ;; sense altres criteris, minimitzem el nombre de ciutats: el pla visitarà
  ;; exactament el mínim demanat (camí més curt que compleix la restricció).
  (:metric minimize (num-visited))
)

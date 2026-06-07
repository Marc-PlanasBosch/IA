(define (problem viatge-ext1-1)

  ;; -------------------------------------------------------------------
  ;; Joc de prova 1 (ext.1): NOMÉS 3 ciutats (graf complet), mín 3 ciutats.
  ;; Dies per ciutat: entre 2 i 4. Mínim de dies del recorregut: 7.
  ;; Com que només hi ha 3 ciutats, ha de visitar-les totes (6 dies a
  ;; l'estada mínima) i NO pot afegir-ne cap més; per arribar als 7 dies
  ;; del recorregut està OBLIGAT a usar com a mínim un stay-extra-day.
  ;; -------------------------------------------------------------------

  (:domain viatges-ext1)

  (:objects
    bcn par rom - city
    h-bcn h-par h-rom - hotel
  )

  (:init
    (hotel-at h-bcn bcn)
    (hotel-at h-par par)
    (hotel-at h-rom rom)

    (flight bcn par) (flight par bcn)
    (flight bcn rom) (flight rom bcn)
    (flight par rom) (flight rom par)

    (= (num-visited) 0)
    (= (min-cities) 3)

    (= (total-days) 0)
    (= (min-days-city) 2)
    (= (max-days-city) 4)
    (= (min-days-trip) 7)
  )

  (:goal (and (>= (num-visited) (min-cities))
              (>= (total-days) (min-days-trip))))

  ;; minimitzem els dies totals: el pla farà l'estada més curta que
  ;; compleix alhora el mínim de ciutats i el mínim de dies del recorregut.
  (:metric minimize (total-days))
)

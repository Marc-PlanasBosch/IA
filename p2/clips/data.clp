; ----------------------------------------------------------------------
; data.clp — sample CITY instances for the p2 prototype.
; Replace / extend with your real dataset during Sprint 5.
; Cost-level: 1 cheap .. 5 expensive. Themes drive the matching rules.
; ----------------------------------------------------------------------

(definstances cities-data
   ([Paris]     of CITY (name Paris)     (country France)   (cost-level 5)
                        (themes romantic cultural)
                        (sights Louvre EiffelTower Montmartre))
   ([Venice]    of CITY (name Venice)    (country Italy)    (cost-level 4)
                        (themes romantic cultural)
                        (sights GrandCanal Rialto SanMarco))
   ([Vienna]    of CITY (name Vienna)    (country Austria)  (cost-level 4)
                        (themes cultural romantic))
   ([Barcelona] of CITY (name Barcelona) (country Spain)    (cost-level 3)
                        (themes cultural fun)
                        (sights SagradaFamilia ParkGuell Ramblas))
   ([Berlin]    of CITY (name Berlin)    (country Germany)  (cost-level 3)
                        (themes cultural fun)
                        (sights Brandenburg Reichstag Museumsinsel))
   ([Lisbon]    of CITY (name Lisbon)    (country Portugal) (cost-level 3)
                        (themes cultural fun romantic)
                        (sights Belem Alfama Sintra))
   ([Amsterdam] of CITY (name Amsterdam) (country Netherlands) (cost-level 4)
                        (themes cultural fun)
                        (sights VanGogh Rijksmuseum Jordaan)))

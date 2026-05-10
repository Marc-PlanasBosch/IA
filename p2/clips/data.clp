; ----------------------------------------------------------------------
; data.clp — sample instances mirroring the OWL ontology individuals.
; Cities first (referenced by accommodations), then accommodations
; (one per city), then transports.
; ----------------------------------------------------------------------

(definstances cities-data
   ([Paris]     of CITY (name Paris)     (country France)      (cost-level 5)
                        (themes romantic cultural)
                        (sights Louvre EiffelTower Montmartre))
   ([Venice]    of CITY (name Venice)    (country Italy)       (cost-level 4)
                        (themes romantic cultural)
                        (sights GrandCanal Rialto SanMarco))
   ([Vienna]    of CITY (name Vienna)    (country Austria)     (cost-level 4)
                        (themes cultural romantic))
   ([Barcelona] of CITY (name Barcelona) (country Spain)       (cost-level 3)
                        (themes cultural fun)
                        (sights SagradaFamilia ParkGuell Ramblas))
   ([Berlin]    of CITY (name Berlin)    (country Germany)     (cost-level 3)
                        (themes cultural fun)
                        (sights Brandenburg Reichstag Museumsinsel))
   ([Lisbon]    of CITY (name Lisbon)    (country Portugal)    (cost-level 3)
                        (themes cultural fun romantic)
                        (sights Belem Alfama Sintra))
   ([Amsterdam] of CITY (name Amsterdam) (country Netherlands) (cost-level 4)
                        (themes cultural fun)
                        (sights VanGogh Rijksmuseum Jordaan)))

(definstances accommodations-data
   ([HotelRitzParis]      of ACCOMMODATION (name HotelRitzParis)     (kind Hotel)
                                           (star-rating 5) (price-night 400)
                                           (located-in [Paris]))
   ([HotelDanieliVenice]  of ACCOMMODATION (name HotelDanieli)       (kind Hotel)
                                           (star-rating 5) (price-night 350)
                                           (located-in [Venice]))
   ([HotelImperialVienna] of ACCOMMODATION (name HotelImperial)      (kind Hotel)
                                           (star-rating 5) (price-night 300)
                                           (located-in [Vienna]))
   ([ApartmentBarcelona]  of ACCOMMODATION (name BarcelonaApt)       (kind Apartment)
                                           (star-rating 3) (price-night 80)
                                           (located-in [Barcelona]))
   ([HostelBerlin]        of ACCOMMODATION (name GeneratorBerlin)    (kind Hostel)
                                           (star-rating 2) (price-night 30)
                                           (located-in [Berlin]))
   ([HostelLisbon]        of ACCOMMODATION (name LisbonCentral)      (kind Hostel)
                                           (star-rating 2) (price-night 25)
                                           (located-in [Lisbon]))
   ([ApartmentAmsterdam]  of ACCOMMODATION (name AmsterdamApt)       (kind Apartment)
                                           (star-rating 3) (price-night 100)
                                           (located-in [Amsterdam])))

(definstances transports-data
   ([TGVHighSpeed] of TRANSPORT (name TGVHighSpeed) (kind Train)  (price-eur 120))
   ([EasyJet]      of TRANSPORT (name EasyJet)      (kind Flight) (price-eur 80))
   ([Flixbus]      of TRANSPORT (name Flixbus)      (kind Bus)    (price-eur 40)))

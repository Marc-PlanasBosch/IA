; ---------------------------------------------------------
; INSTANCIAS
; ---------------------------------------------------------

  (definstances instancias-viaje

  ; TEMATICAS
  (cultura     of Tematica)
  (playa       of Tematica)
  (montana     of Tematica)
  (romantica   of Tematica)
  (aventura    of Tematica)
  (gastronomia of Tematica)
  (fiesta      of Tematica)

  ; IDIOMAS
  (espanol   of Idioma)
  (frances   of Idioma)
  (ingles    of Idioma)
  (italiano  of Idioma)
  (portugues of Idioma)
  (aleman    of Idioma)
  (japones   of Idioma)

  ; OBJETIVOS
  (obj-descanso    of Objetivo)
  (obj-cultural    of Objetivo)
  (obj-diversion   of Objetivo)
  (obj-romantico   of Objetivo)
  (obj-aventura    of Objetivo)
  (obj-gastronomia of Objetivo)
  (obj-negocios    of Objetivo)
  (obj-familiar    of Objetivo)
  (obj-mochilero   of Objetivo)

  ; TEMPORADAS
  (temp-verano    of Temporada (clima CALIDO)   (turismo alto))
  (temp-invierno  of Temporada (clima MUY-FRIO) (turismo bajo))
  (temp-primavera of Temporada (clima TEMPLADO) (turismo medio))
  (temp-otono     of Temporada (clima FRIO)     (turismo medio))

  ; MATERIAL
  (material-montana  of Material)
  (material-playa    of Material)
  (material-invierno of Material)
  (material-urbano   of Material)
  (material-camping  of Material)

  ; EVENTOS ESPECIALES

  ; ESPAÑA
  (FeriaAbrilSevilla  of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 5h)(aptoParaNinos si))
  (SanFermines        of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 24h)(aptoParaNinos no))
  (Tomatina           of Eventos_especiales (precioEntrada 12)(esAccesible no)(puntuacion media)(tiempo 3h)(aptoParaNinos no))
  (LasFallasValencia  of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 12h)(aptoParaNinos si))
  
  ; BRASIL
  (CarnavalRio        of Eventos_especiales (precioEntrada 50)(esAccesible si)(puntuacion alta)(tiempo 8h)(aptoParaNinos no))

  ; ALEMANIA
  (OktoberfestMunich  of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 6h)(aptoParaNinos no))
 
  ; EEUU
  (AnoNuevoTimesSquare of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 10h)(aptoParaNinos si))

  ; JAPON
  (HanamiTokyo        of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion alta)(tiempo 4h)(aptoParaNinos si))

  ; FRANCIA
  (LucesNavidadParis  of Eventos_especiales (precioEntrada 0)(esAccesible si)(puntuacion media)(tiempo 3h)(aptoParaNinos si))

  ; ITALIA
  (CarnavalVenecia    of Eventos_especiales (precioEntrada 0)(esAccesible no)(puntuacion alta)(tiempo 5h)(aptoParaNinos no))

  (FinalChampions     of Eventos_especiales (precioEntrada 300)(esAccesible si)(puntuacion alta)(tiempo 4h)(aptoParaNinos si))

  ; PUNTOS DE INTERES
  
  ; BARCELONA
  (SagradaFamilia of Punto_de_Interes (precioEntrada 26)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (ParcGuell of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (CampNou of Punto_de_Interes (precioEntrada 28)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BarrioGotico of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BeachBarcelona of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (MNAC of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos no))

  ; MADRID
  (MuseoPrado of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (RetiroPark of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PalacioReal of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MercadoSanMiguel of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BernabeuTour of Punto_de_Interes (precioEntrada 25)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (ReinaSOfia of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos no))

  ; SEVILLA
  (CatedralSevilla of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (AlcazarSevilla of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BarrioTriana of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PlazaEspana of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (TorreDelOro of Punto_de_Interes (precioEntrada 3)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; VALENCIA
  (CiudadArtesCiencias of Punto_de_Interes (precioEntrada 38)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PlayaMalvarrosa of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (MercadoCentral of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (CatedralValencia of Punto_de_Interes (precioEntrada 8)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (BiopagoValencia of Punto_de_Interes (precioEntrada 20)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; SAN SEBASTIAN
  (PlayaConcha of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (ParteVieja of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PintosSS of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MonteIgeldo of Punto_de_Interes (precioEntrada 5)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (AcuarioSS of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; GRANADA
  (Alhambra of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (Albaicin of Punto_de_Interes (precioEntrada 0)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (CathedralGranada of Punto_de_Interes (precioEntrada 5)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (SierraNevadaGranada of Punto_de_Interes (precioEntrada 0)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (TablaosFlamenco of Punto_de_Interes (precioEntrada 30)(esAccessible si)(puntuacion alta)(aptoParaNinos no))

  ; PARIS
  (TorreEiffel of Punto_de_Interes (precioEntrada 28)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (Louvre of Punto_de_Interes (precioEntrada 17)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (Montmartre of Punto_de_Interes (precioEntrada 0)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (VersaillesP of Punto_de_Interes (precioEntrada 20)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (ChampsElysees of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (MuseeOrsay of Punto_de_Interes (precioEntrada 14)(esAccessible si)(puntuacion alta)(aptoParaNinos no))

  ; ROMA
  (Coliseo of Punto_de_Interes (precioEntrada 18)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (VaticanoCiudad of Punto_de_Interes (precioEntrada 20)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (FontanaTrevi of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (ForoRomano of Punto_de_Interes (precioEntrada 16)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PlazaNavona of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (GaleriaGallese of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion media)(aptoParaNinos no))

  ; AMSTERDAM
  (RijksmuseumA of Punto_de_Interes (precioEntrada 22)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (CasaAnnaFrank of Punto_de_Interes (precioEntrada 14)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (CanalesAmsterdam of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (VondelPark of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (BarrioRojoA of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos no))

  ; LISBOA
  (TorreBelem of Punto_de_Interes (precioEntrada 6)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MonasterioJeronimos of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BarrioAlfama of Punto_de_Interes (precioEntrada 0)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (CastilloSJorge of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PlazoComercioL of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; PRAGA
  (CastilloPraga of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PuenteCarlos of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (PlazaVenceslao of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (BarriojudIo of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (CatedralSanVito of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; BERLIN
  (PuertaBrandeburgo of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MuroBerlin of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (Reichstag of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MuseoPergamo of Punto_de_Interes (precioEntrada 19)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (CheckpointCharlie of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; TOKYO
  (TorreTokyoT of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (TemploSensoji of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (ShinjukuT of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (AkihabaraTok of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (MonteFujiTok of Punto_de_Interes (precioEntrada 5)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (DisneySea of Punto_de_Interes (precioEntrada 80)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; NUEVA YORK
  (EstatuaLibertad of Punto_de_Interes (precioEntrada 25)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (CentralPark of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (TimesSquare of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (EmpireState of Punto_de_Interes (precioEntrada 40)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MetropolitanNY of Punto_de_Interes (precioEntrada 25)(esAccessible si)(puntuacion alta)(aptoParaNinos no))

  ; BUENOS AIRES
  (TeatroColon of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (ObeliscoBA of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (Caminito of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (Recoleta of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))
  (PuertoMaderaBA of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; EL CAIRO
  (PiramidesGiza of Punto_de_Interes (precioEntrada 20)(esAccessible no)(puntuacion alta)(aptoParaNinos no))
  (MuseoEgipcio of Punto_de_Interes (precioEntrada 12)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (KhanElKhalili of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (CiudadelaCairo of Punto_de_Interes (precioEntrada 8)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; CIUDAD DEL CABO
  (TableMountain of Punto_de_Interes (precioEntrada 22)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (RobbenIsland of Punto_de_Interes (precioEntrada 30)(esAccessible si)(puntuacion alta)(aptoParaNinos no))
  (CapePoint of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BouldersBeach of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; SYDNEY
  (OperaHouse of Punto_de_Interes (precioEntrada 35)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (BondiBeach of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (HarbourBridge of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (TarongaZoo of Punto_de_Interes (precioEntrada 45)(esAccessible si)(puntuacion alta)(aptoParaNinos si))

  ; BANGKOK
  (GranPalacioBK of Punto_de_Interes (precioEntrada 15)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (WatArun of Punto_de_Interes (precioEntrada 5)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (MercadoChatuchak of Punto_de_Interes (precioEntrada 0)(esAccessible si)(puntuacion alta)(aptoParaNinos si))
  (RioChaoPhrayaBK of Punto_de_Interes (precioEntrada 10)(esAccessible si)(puntuacion media)(aptoParaNinos si))

  ; CIUDADES ESPANOLAS

  (Barcelona of Ciudad
    (pais "Espana")
    (precioMedio 130)
    (estiloVida "cosmopolita")
    (Tipo_de_ciudad [cultura] [playa] [gastronomia])
    (Hablan_en [espanol])
    (Contienen [SagradaFamilia] [ParcGuell] [CampNou] [BarrioGotico] [BeachBarcelona] [MNAC])
    (Tiene_un_conjunto_de [HotelArtsBarcelona] [HostalRamblasBarcelona] [ApartBarcelona1])
    (Requiere_de [material-urbano] [material-playa])
    (Se_celebra [FinalChampions]))

  (Madrid of Ciudad
    (pais "Espana")
    (precioMedio 110)
    (estiloVida "animada")
    (Tipo_de_ciudad [cultura] [gastronomia] [fiesta])
    (Hablan_en [espanol])
    (Contienen [MuseoPrado] [RetiroPark] [PalacioReal] [MercadoSanMiguel] [BernabeuTour] [ReinaSOfia])
    (Tiene_un_conjunto_de [HotelWMadrid] [HostalMadridCentro] [ApartMadrid1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Sevilla of Ciudad
    (pais "Espana")
    (precioMedio 85)
    (estiloVida "tradicional")
    (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
    (Hablan_en [espanol])
    (Contienen [CatedralSevilla] [AlcazarSevilla] [BarrioTriana] [PlazaEspana] [TorreDelOro])
    (Tiene_un_conjunto_de [HotelAlfonsXIII] [HostalSevillaCentro] [ApartSevilla1])
    (Requiere_de [material-urbano])
    (Se_celebra [FeriaAbrilSevilla]))

  (Valencia of Ciudad
    (pais "Espana")
    (precioMedio 90)
    (estiloVida "mediterranea")
    (Tipo_de_ciudad [playa] [gastronomia] [cultura])
    (Hablan_en [espanol])
    (Contienen [CiudadArtesCiencias] [PlayaMalvarrosa] [MercadoCentral] [CatedralValencia] [BiopagoValencia])
    (Tiene_un_conjunto_de [HotelSheratonValencia] [HostalValenciaCentro] [ApartValencia1])
    (Requiere_de [material-playa] [material-urbano])
    (Se_celebra [LasFallasValencia]))

  (SanSebastian of Ciudad
    (pais "Espana")
    (precioMedio 140)
    (estiloVida "elegante")
    (Tipo_de_ciudad [gastronomia] [playa] [cultura])
    (Hablan_en [espanol])
    (Contienen [PlayaConcha] [ParteVieja] [PintosSS] [MonteIgeldo] [AcuarioSS])
    (Tiene_un_conjunto_de [HotelMariaDristinasSS] [HostalSSCentro] [ApartSS1])
    (Requiere_de [material-playa] [material-invierno])
    (Se_celebra [SanFermines]))

  (Granada of Ciudad
    (pais "Espana")
    (precioMedio 75)
    (estiloVida "historica")
    (Tipo_de_ciudad [cultura] [romantica] [montana])
    (Hablan_en [espanol])
    (Contienen [Alhambra] [AlbaicIn] [CathedralGranada] [SierraNevadaGranada] [TablaosFlamenco])
    (Tiene_un_conjunto_de [HotelParadorGranada] [HostalGranadaCentro] [ApartGranada1])
    (Requiere_de [material-montana] [material-invierno])
    (Se_celebra))

  ; CIUDADES EUROPA

  (Paris of Ciudad
    (pais "Francia")
    (precioMedio 190)
    (estiloVida "romantica")
    (Tipo_de_ciudad [romantica] [cultura] [gastronomia])
    (Hablan_en [frances])
    (Contienen [TorreEiffel] [Louvre] [Montmartre] [VersaillesP] [ChampsElysees] [MuseeOrsay])
    (Tiene_un_conjunto_de [HotelRitzParis] [HostalParisCentro] [ApartParis1])
    (Requiere_de [material-urbano])
    (Se_celebra [LucesNavidadParis]))

  (Roma of Ciudad
    (pais "Italia")
    (precioMedio 150)
    (estiloVida "historica")
    (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
    (Hablan_en [italiano])
    (Contienen [Coliseo] [VaticanoCiudad] [FontanaTrevi] [ForoRomano] [PlazaNavona] [GaleriaGallese])
    (Tiene_un_conjunto_de [HotelExcelsiorRoma] [HostalRomaCentro] [ApartRoma1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Amsterdam of Ciudad
    (pais "Holanda")
    (precioMedio 170)
    (estiloVida "liberal")
    (Tipo_de_ciudad [cultura] [fiesta] [aventura])
    (Hablan_en [ingles])
    (Contienen [RijksmuseumA] [CasaAnnaFrank] [CanalesAmsterdam] [VondelPark] [BarrioRojoA])
    (Tiene_un_conjunto_de [HotelPulitzerAmsterdam] [HostalAmsterdamCentro] [ApartAmsterdam1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Lisboa of Ciudad
    (pais "Portugal")
    (precioMedio 95)
    (estiloVida "nostalgica")
    (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
    (Hablan_en [portugues])
    (Contienen [TorreBelem] [MonasterioJeronimos] [BarrioAlfama] [CastilloSJorge] [PlazoComercioL])
    (Tiene_un_conjunto_de [HotelBairroAltoLisboa] [HostalLisboaCentro] [ApartLisboa1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Praga of Ciudad
    (pais "Republica Checa")
    (precioMedio 80)
    (estiloVida "medieval")
    (Tipo_de_ciudad [cultura] [fiesta] [romantica])
    (Hablan_en [ingles])
    (Contienen [CastilloPraga] [PuenteCarlos] [PlazaVenceslao] [BarriojudIo] [CatedralSanVito])
    (Tiene_un_conjunto_de [HotelFourSeasonsPraga] [HostalPragaCentro] [ApartPraga1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Berlin of Ciudad
    (pais "Alemania")
    (precioMedio 120)
    (estiloVida "alternativa")
    (Tipo_de_ciudad [cultura] [fiesta])
    (Hablan_en [aleman] [ingles])
    (Contienen [PuertaBrandeburgo] [MuroBerlin] [Reichstag] [MuseoPergamo] [CheckpointCharlie])
    (Tiene_un_conjunto_de [HotelAdlonBerlin] [HostalBerlinMitte] [ApartBerlin1])
    (Requiere_de [material-urbano])
    (Se_celebra [OktoberfestMunich]))

  ; CIUDADES OCEANIA

  (Sydney of Ciudad
    (pais "Australia")
    (precioMedio 180)
    (estiloVida "relajada-playera")
    (Tipo_de_ciudad [playa] [cultura] [aventura])
    (Hablan_en [ingles])
    (Contienen [OperaHouse] [BondiBeach] [HarbourBridge] [TarongaZoo])
    (Tiene_un_conjunto_de [HotelParkHyattSyd] [HostalSydSurf] [ApartSyd1])
    (Requiere_de [material-urbano] [material-playa])
    (Se_celebra))

  ; CIUDADES AMERICA

  (NuevaYork of Ciudad
    (pais "EEUU")
    (precioMedio 250)
    (estiloVida "frenetica")
    (Tipo_de_ciudad [cultura] [gastronomia] [aventura])
    (Hablan_en [ingles])
    (Contienen [EstatuaLibertad] [CentralPark] [TimesSquare] [EmpireState] [MetropolitanNY])
    (Tiene_un_conjunto_de [HotelMarriottNY] [HostalNYCentral] [ApartNY1])
    (Requiere_de [material-urbano])
    (Se_celebra [AnoNuevoTimesSquare]))

  (BuenosAires of Ciudad
    (pais "Argentina")
    (precioMedio 90)
    (estiloVida "bohemia")
    (Tipo_de_ciudad [cultura] [gastronomia] [romantica])
    (Hablan_en [espanol])
    (Contienen [TeatroColon] [ObeliscoBA] [Caminito] [Recoleta] [PuertoMaderaBA])
    (Tiene_un_conjunto_de [HotelAlvearBA] [HostalPalermo] [ApartBA1])
    (Requiere_de [material-urbano])
    (Se_celebra [CarnavalRio]))

  ; CIUDADES AFRICA

  (ElCairo of Ciudad
    (pais "Egipto")
    (precioMedio 60)
    (estiloVida "caotica-historica")
    (Tipo_de_ciudad [cultura] [aventura])
    (Hablan_en [ingles])
    (Contienen [PiramidesGiza] [MuseoEgipcio] [KhanElKhalili] [CiudadelaCairo])
    (Tiene_un_conjunto_de [HotelRitzCairo] [HostalCairoOld] [ApartCairo1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (CiudadDelCabo of Ciudad
    (pais "Sudafrica")
    (precioMedio 110)
    (estiloVida "natural")
    (Tipo_de_ciudad [aventura] [playa] [gastronomia])
    (Hablan_en [ingles])
    (Contienen [TableMountain] [RobbenIsland] [CapePoint] [BouldersBeach])
    (Tiene_un_conjunto_de [HotelTheSilof] [HostalCapeBackpackers] [ApartCape1])
    (Requiere_de [material-urbano] [material-playa])
    (Se_celebra))

  ; CIUDADES ASIA

  (Bangkok of Ciudad
    (pais "Tailandia")
    (precioMedio 50)
    (estiloVida "exotica")
    (Tipo_de_ciudad [gastronomia] [cultura] [aventura])
    (Hablan_en [ingles])
    (Contienen [GranPalacioBK] [WatArun] [MercadoChatuchak] [RioChaoPhrayaBK])
    (Tiene_un_conjunto_de [HotelMandarinBK] [HostalBKStreet] [ApartBK1])
    (Requiere_de [material-urbano])
    (Se_celebra))

  (Tokyo of Ciudad
    (pais "Japon")
    (precioMedio 200)
    (estiloVida "futurista")
    (Tipo_de_ciudad [cultura] [gastronomia] [aventura])
    (Hablan_en [japones])
    (Contienen [TorreTokyoT] [TemploSensoji] [ShinjukuT] [AkihabaraTok] [MonteFujiTok] [DisneySea])
    (Tiene_un_conjunto_de [HotelParkHyattTokyo] [HostalTokyoCentro] [ApartTokyo1])
    (Requiere_de [material-urbano])
    (Se_celebra [HanamiTokyo]))

  ; ALOJAMIENTOS

  ; BARCELONA
  (HotelArtsBarcelona of Hotel (calidadAlojamiento alta)(precioAlojamiento 220)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalRamblasBarcelona of Hostal (calidadAlojamiento media)(precioAlojamiento 55)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartBarcelona1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 110)(numHabitaciones 3)(apartamentoFamiliar si)(ambiente familiar))

  ; MADRID
  (HotelWMadrid of Hotel (calidadAlojamiento alta)(precioAlojamiento 200)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalMadridCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 45)(habitacionCompartida no)(ambiente tranquilo)(apartamentoFamiliar no))
  (ApartMadrid1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 95)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; SEVILLA
  (HotelAlfonsXIII of Hotel (calidadAlojamiento alta)(precioAlojamiento 180)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalSevillaCentro of Hostal (calidadAlojamiento baja)(precioAlojamiento 35)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartSevilla1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 70)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; VALENCIA
  (HotelSheratonValencia of Hotel (calidadAlojamiento alta)(precioAlojamiento 160)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalValenciaCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 40)(habitacionCompartida no)(ambiente tranquilo)(apartamentoFamiliar no))
  (ApartValencia1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 80)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; SAN SEBASTIAN
  (HotelMariaDristinasSS of Hotel (calidadAlojamiento alta)(precioAlojamiento 300)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalSSCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 55)(habitacionCompartida no)(ambiente tranquilo)(apartamentoFamiliar no))
  (ApartSS1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 130)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; GRANADA
  (HotelParadorGranada of Hotel (calidadAlojamiento alta)(precioAlojamiento 170)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalGranadaCentro of Hostal (calidadAlojamiento baja)(precioAlojamiento 30)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartGranada1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 60)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; PARIS
  (HotelRitzParis of Hotel (calidadAlojamiento alta)(precioAlojamiento 500)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalParisCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 65)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartParis1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 150)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; ROMA
  (HotelExcelsiorRoma of Hotel (calidadAlojamiento alta)(precioAlojamiento 280)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalRomaCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 50)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartRoma1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 120)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; AMSTERDAM
  (HotelPulitzerAmsterdam of Hotel (calidadAlojamiento alta)(precioAlojamiento 260)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalAmsterdamCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 55)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartAmsterdam1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 130)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; LISBOA
  (HotelBairroAltoLisboa of Hotel (calidadAlojamiento alta)(precioAlojamiento 190)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalLisboaCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 40)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartLisboa1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 90)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; PRAGA
  (HotelFourSeasonsPraga of Hotel (calidadAlojamiento alta)(precioAlojamiento 210)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalPragaCentro of Hostal (calidadAlojamiento baja)(precioAlojamiento 25)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartPraga1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 75)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; BERLIN
  (HotelAdlonBerlin of Hotel (calidadAlojamiento alta)(precioAlojamiento 240)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalBerlinMitte of Hostal (calidadAlojamiento media)(precioAlojamiento 45)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartBerlin1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 110)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; TOKYO
  (HotelParkHyattTokyo of Hotel (calidadAlojamiento alta)(precioAlojamiento 450)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalTokyoCentro of Hostal (calidadAlojamiento media)(precioAlojamiento 60)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartTokyo1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 180)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; NUEVA YORK
  (HotelMarriottNY of Hotel (calidadAlojamiento alta)(precioAlojamiento 350)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalNYCentral of Hostal (calidadAlojamiento media)(precioAlojamiento 80)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartNY1 of Apartamento (calidadAlojamiento alta)(precioAlojamiento 250)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; BUENOS AIRES
  (HotelAlvearBA of Hotel (calidadAlojamiento alta)(precioAlojamiento 150)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalPalermo of Hostal (calidadAlojamiento media)(precioAlojamiento 25)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartBA1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 60)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; EL CAIRO
  (HotelRitzCairo of Hotel (calidadAlojamiento alta)(precioAlojamiento 120)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalCairoOld of Hostal (calidadAlojamiento baja)(precioAlojamiento 15)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartCairo1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 45)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; CIUDAD DEL CABO
  (HotelTheSilof of Hotel (calidadAlojamiento alta)(precioAlojamiento 210)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalCapeBackpackers of Hostal (calidadAlojamiento media)(precioAlojamiento 30)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartCape1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 85)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; SYDNEY
  (HotelParkHyattSyd of Hotel (calidadAlojamiento alta)(precioAlojamiento 290)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalSydSurf of Hostal (calidadAlojamiento media)(precioAlojamiento 55)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartSyd1 of Apartamento (calidadAlojamiento alta)(precioAlojamiento 160)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; BANGKOK
  (HotelMandarinBK of Hotel (calidadAlojamiento alta)(precioAlojamiento 180)(servicio full)(apartamentoFamiliar no)(ambiente lujo))
  (HostalBKStreet of Hostal (calidadAlojamiento media)(precioAlojamiento 20)(habitacionCompartida si)(ambiente social)(apartamentoFamiliar no))
  (ApartBK1 of Apartamento (calidadAlojamiento media)(precioAlojamiento 55)(numHabitaciones 2)(apartamentoFamiliar si)(ambiente familiar))

  ; TRANSPORTES — AVIONES
  (VueloMadridBarcelona of Avion (precioTransporte 80)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Barcelona]))
  (VueloMadridParis of Avion (precioTransporte 120)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Paris]))
  (VueloMadridRoma of Avion (precioTransporte 110)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Roma]))
  (VueloMadridAmsterdam of Avion (precioTransporte 130)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Amsterdam]))
  (VueloMadridLisboa of Avion (precioTransporte 90)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Lisboa]))
  (VueloMadridPraga of Avion (precioTransporte 140)(duracionViaje media)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Praga]))
  (VueloMadridBerlin of Avion (precioTransporte 150)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Berlin]))
  (VueloMadridTokyo of Avion (precioTransporte 750)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Tokyo]))
  (VueloMadridNY of Avion (precioTransporte 600)(duracionViaje larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [NuevaYork]))
  (VueloMadridBA of Avion (precioTransporte 850)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [BuenosAires]))
  (VueloMadridCairo of Avion (precioTransporte 350)(duracionViaje media)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [ElCairo]))
  (VueloMadridCape of Avion (precioTransporte 900)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [CiudadDelCabo]))
  (VueloMadridSydney of Avion (precioTransporte 1200)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Sydney]))
  (VueloMadridBangkok of Avion (precioTransporte 650)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [Bangkok]))

  ; TRANSPORTES — TRENES

  (TrenMadridBarcelona of Tren (precioTransporte 50)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Barcelona]))
  (TrenMadridSevilla of Tren (precioTransporte 40)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Sevilla]))
  (TrenMadridValencia of Tren (precioTransporte 35)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Valencia]))
  (TrenMadridSS of Tren (precioTransporte 55)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [SanSebastian]))
  (TrenMadridParis of Tren (precioTransporte 180)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Paris]))
  (TrenParisBerlin of Tren (precioTransporte 120)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Paris])(Destino [Berlin]))

  ; TRANSPORTES — AUTOBUSES

  (AutobusMadridBarcelona of Autobus (precioTransporte 25)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Barcelona]))
  (AutobusMadridSevilla of Autobus (precioTransporte 20)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Sevilla]))
  (AutobusMadridValencia of Autobus (precioTransporte 18)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Valencia]))
  (AutobusMadridSS of Autobus (precioTransporte 28)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [SanSebastian]))
  (AutobusMadridGranada of Autobus (precioTransporte 18)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Granada]))
  (AutobusSsevillaGranada of Autobus (precioTransporte 12)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Sevilla])(Destino [Granada]))
  (AutobusMadridLisboa of Autobus (precioTransporte 22)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Madrid])(Destino [Lisboa]))

  ; TRANSPORTES — COCHES
  
  (CocheAlquilerMadridSegovia of Coche (precioTransporte 45)(duracionViaje corta)(accesibilidad alta) (Origen [Madrid])(Destino [Segovia]))
  (CocheRutaAndalucia of Coche (precioTransporte 120)(duracionViaje media)(accesibilidad alta) (Origen [Sevilla])(Destino [Granada]))

  ; TRANSPORTES — BARCOS

  (FerryAlgecirasTanger of Barco (precioTransporte 40)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Madrid])(Destino [ElCairo]))
  (CruceroBarcelonaRoma of Barco (precioTransporte 250)(duracionViaje larga)(accesibilidad alta) (claseAsiento primera)(Origen [Barcelona])(Destino [Roma]))
  (CruceroNilo of Barco (precioTransporte 300)(duracionViaje media)(accesibilidad media) (claseAsiento primera)(Origen [ElCairo])(Destino [ElCairo]))

  ; TRANSPORTES DE VUELTA (INVERSOS)
  (VueloBarcelonaMadrid of Avion (precioTransporte 80)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Barcelona])(Destino [Madrid]))
  (VueloParisMadrid of Avion (precioTransporte 120)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Paris])(Destino [Madrid]))
  (VueloRomaMadrid of Avion (precioTransporte 110)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Roma])(Destino [Madrid]))
  (VueloAmsterdamMadrid of Avion (precioTransporte 130)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Amsterdam])(Destino [Madrid]))
  (VueloLisboaMadrid of Avion (precioTransporte 90)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Lisboa])(Destino [Madrid]))
  (VueloPragaMadrid of Avion (precioTransporte 140)(duracionViaje media)(accesibilidad media) (claseAsiento turista)(Origen [Praga])(Destino [Madrid]))
  (VueloBerlinMadrid of Avion (precioTransporte 150)(duracionViaje corta)(accesibilidad media) (claseAsiento turista)(Origen [Berlin])(Destino [Madrid]))
  (VueloTokyoMadrid of Avion (precioTransporte 750)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Tokyo])(Destino [Madrid]))
  (VueloNYMadrid of Avion (precioTransporte 600)(duracionViaje larga)(accesibilidad media) (claseAsiento turista)(Origen [NuevaYork])(Destino [Madrid]))
  (VueloBAMadrid of Avion (precioTransporte 850)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [BuenosAires])(Destino [Madrid]))
  (VueloCairoMadrid of Avion (precioTransporte 350)(duracionViaje media)(accesibilidad media) (claseAsiento turista)(Origen [ElCairo])(Destino [Madrid]))
  (VueloCapeMadrid of Avion (precioTransporte 900)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [CiudadDelCabo])(Destino [Madrid]))
  (VueloSydneyMadrid of Avion (precioTransporte 1200)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Sydney])(Destino [Madrid]))
  (VueloBangkokMadrid of Avion (precioTransporte 650)(duracionViaje muy-larga)(accesibilidad media) (claseAsiento turista)(Origen [Bangkok])(Destino [Madrid]))

  (TrenBarcelonaMadrid of Tren (precioTransporte 50)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Barcelona])(Destino [Madrid]))
  (TrenSevillaMadrid of Tren (precioTransporte 40)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Sevilla])(Destino [Madrid]))
  (TrenValenciaMadrid of Tren (precioTransporte 35)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Valencia])(Destino [Madrid]))
  (TrenSSMadrid of Tren (precioTransporte 55)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [SanSebastian])(Destino [Madrid]))
  (TrenParisMadrid of Tren (precioTransporte 180)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Paris])(Destino [Madrid]))
  (TrenBerlinParis of Tren (precioTransporte 120)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Berlin])(Destino [Paris]))

  (AutobusBarcelonaMadrid of Autobus (precioTransporte 25)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Barcelona])(Destino [Madrid]))
  (AutobusSevillaMadrid of Autobus (precioTransporte 20)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Sevilla])(Destino [Madrid]))
  (AutobusValenciaMadrid of Autobus (precioTransporte 18)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Valencia])(Destino [Madrid]))
  (AutobusSSMadrid of Autobus (precioTransporte 28)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [SanSebastian])(Destino [Madrid]))
  (AutobusGranadaMadrid of Autobus (precioTransporte 18)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Granada])(Destino [Madrid]))
  (AutobusGranadaSevilla of Autobus (precioTransporte 12)(duracionViaje media)(accesibilidad alta) (claseAsiento turista)(Origen [Granada])(Destino [Sevilla]))
  (AutobusLisboaMadrid of Autobus (precioTransporte 22)(duracionViaje larga)(accesibilidad alta) (claseAsiento turista)(Origen [Lisboa])(Destino [Madrid]))

  (CocheSegoviaMadrid of Coche (precioTransporte 45)(duracionViaje corta)(accesibilidad alta) (Origen [Segovia])(Destino [Madrid]))
  (CocheAndaluciaInversa of Coche (precioTransporte 120)(duracionViaje media)(accesibilidad alta) (Origen [Granada])(Destino [Sevilla]))

  (CruceroRomaBarcelona of Barco (precioTransporte 250)(duracionViaje larga)(accesibilidad alta) (claseAsiento primera)(Origen [Roma])(Destino [Barcelona]))

)
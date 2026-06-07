# P3 — Notes del model (base per a la memòria)

## Decisió de modelat — Nivell bàsic

### Tipus
- `city` — les ciutats disponibles.
- `hotel` — els hotels (relacionats amb una ciutat via `hotel-at`).

### Predicats
| Predicat | Significat | Per què cal |
|---|---|---|
| `(hotel-at ?h ?c)` | l'hotel `?h` és a la ciutat `?c` | relaciona hotels i ciutats; permet triar on allotjar-se |
| `(flight ?from ?to)` | hi ha vol directe `?from`→`?to` | defineix el graf de connexions |
| `(at ?c)` | el viatger és ara a `?c` | posició actual per encadenar vols |
| `(visited ?c)` | `?c` ja visitada | evita repetir ciutats (camí simple) |
| `(started)` | el viatge ha començat | distingeix la 1a acció (triar inici) de la resta |
| `(booked ?h)` | s'ha reservat l'hotel `?h` | fa que el pla mostri l'hotel escollit a cada ciutat |

### Funcions (numèriques → cal metric-ff)
- `(num-visited)` — comptador de ciutats visitades.
- `(min-cities)` — mínim demanat per l'usuari.

### Operadors
- `choose-start(?c,?h)` — tria lliure de la ciutat d'inici (l'enunciat demana que el planificador NO la tingui fixada) i reserva hotel. Marca `started`, `at`, `visited`, incrementa `num-visited`.
- `travel(?from,?to,?h)` — vol cap a una ciutat connectada i no visitada; reserva hotel. Mou `at`, marca `visited`, incrementa `num-visited`.

### Objectiu
`(>= (num-visited) (min-cities))` — comparació numèrica (no només igualtat) → justifica l'ús de **metric-ff**.

## Jocs de prova (bàsic)
1. **problem1** — graf complet de 4 ciutats, mín 3. Comprova tria d'inici + camí simple.
2. **problem2** — graf parcialment connex (cadena amb branca), mín 4. Comprova que respecta connexions reals.

## Extensió 1 — dies (FET ✅)
Afegit sobre el bàsic:
- Funcions: `(total-days)`, `(days-in ?c)`, `(min-days-city)`, `(max-days-city)`, `(min-days-trip)`.
- En arribar a una ciutat (choose-start/travel) s'hi `assign`-en els dies mínims i s'acumulen a `total-days`.
- Nou operador `stay-extra-day(?c)`: +1 dia a la ciutat actual mentre `days-in < max-days-city`.
- Objectiu: `num-visited ≥ min-cities` **i** `total-days ≥ min-days-trip`. Mètrica: `minimize total-days`.
- Jocs de prova: P1 (3 ciutats, dies 2-4, trip≥7 → 6+1 dia extra = **7, òptim**); P2 (4 ciutats cadena, dies 1-3, trip≥4 → usa stay-extra-day).
- **Nota didàctica**: amb 4 ciutats disponibles a P1, metric-ff donava un pla vàlid però no òptim (8 dies). Bon exemple de la limitació heurística que avisa l'enunciat.

## Extensió 2 — interès (FET ✅)
- Funcions: `(interest ?c)`, `(total-interest)`. S'acumula a l'arribada. Mètrica `minimize total-interest` (minimitzar valor = maximitzar interès real).
- En els jocs de prova fixem els dies (min=max) perquè el focus és l'interès i la traça quedi neta.
- P1: 5 ciutats, tria les 3 de menor interès (4). P2: graf parcial, interès òptim 6.

## Extensió 3 — preus (FET ✅)
- **Canvi clau**: els vols passen a ser OBJECTES (`flight`) amb `flight-route ?f ?from ?to` i `(flight-price ?f)`, per tenir diversos vols/parell amb preus diferents.
- Hotels amb **preu per nit**: a l'arribada es paga `hotel-price * min-days-city`; `stay-extra-day` ara també paga una nit. Així els dies afecten el preu i no apareixen estades supèrflues.
- Objectiu afegeix `total-price` dins `[min-price, max-price]`. Mètrica `minimize total-price`.
- P1: rang ampli → preu mínim 310. P2: `min-price=380` força encarir → 380 (límit inferior).

## Extensió 4 — interès + preu ponderats (FET ✅, nota 10)
- Domini = Ext.2 + Ext.3 (vols objecte, hotel/nit, interès).
- Mètrica ponderada: `minimize (+ (* Wi total-interest) (* Wp total-price))`.
- Mateix mapa, dos pesos: P1 (Wi=1) → pla barat avorrit (interès 9, preu 220); P2 (Wi=100) → pla interessant car (interès 5, preu 540). Plans DIFERENTS → demostra l'efecte dels pesos.

## IMPORTANT — configuració del planificador
- Bàsic i Ext.1: funcionen amb la config per defecte.
- Ext.2/3/4 (optimització): cal executar amb **`-s 3 -w 0`** (cerca per cost uniforme). Amb la config per defecte (`-s 5`, EHC) Metric-FF dóna plans vàlids però MOLT subòptims en cost/interès (p.ex. 460 en lloc de 310, o no canvia de pla amb els pesos). Amb `-w 0` (f = g) la cerca és per cost pur i, en problemes petits, troba l'òptim.
  - Comanda: `./ff.exe -o domain.pddl -f problem.pddl -s 3 -w 0`

## Procés
Desenvolupament **incremental** (per iteracions): bàsic → ext.1 → ext.2 → ext.3 → ext.4, reaprofitant els jocs de prova. La no-optimalitat heurística observada (i com mitigar-la amb `-s 3 -w 0`) és un punt clau a comentar a la memòria.

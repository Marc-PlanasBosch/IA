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

## Pendents (extensions)
- Ext.2: interès per ciutat → minimitzar.
- Ext.3: preus de vols i hotels → minimitzar amb rang mín/màx.
- Ext.4: combinar interès+preu amb ponderacions a la mètrica.

## Procés
Desenvolupament **incremental** (per iteracions): bàsic → ext.1 → ext.2 → ext.3 → ext.4, reaprofitant els jocs de prova.

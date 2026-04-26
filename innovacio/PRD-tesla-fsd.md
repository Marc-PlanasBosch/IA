# PRD — Treball d'Innovació en IA: Tesla FSD v12

## Resum executiu

**Tema:** L'evolució del Full Self-Driving de Tesla cap a un sistema end-to-end basat en visió pura (FSD v12, gener 2024). La innovació concreta a analitzar és la substitució de ~300.000 línies de codi heurístic de planning per una xarxa neuronal entrenada end-to-end a partir de vídeos de conducció humana.

**Equip:** Marc Planas Bosch, Jaime Prieto Salcedo, Marcel Mula Tixier
**Entrega:** 27 de maig de 2026 (Racò)
**Presentació:** 2 o 3 de juny de 2026, 6 minuts màxim
**Format:** PDF, 12-20 pàgines (portada + índex + bibliografia inclosos)
**Idioma:** Català (recomanat per coherència amb la resta de l'assignatura)

## Per què aquest tema compleix la rúbrica

| Requisit del enunciat | Com el cobrim |
|---|---|
| Producte/servei d'una empresa | Tesla, Inc. — sistema FSD |
| Innovació basada en IA | NN end-to-end com a planner; vision-only stack |
| Tècniques d'IA descrites | HydraNet, BEV transformer, Occupancy Networks, video NNs, imitation learning |
| Adaptació de tècniques | Multi-task learning sobre 8 càmeres, auto-labeling pipeline, simulació |
| Naturalesa innovadora | Ús innovador de tècniques existents (vision transformers + imitation learning) en un domini nou; trencament amb el paradigma classical AI + heurístiques |
| Impacte empresarial | Subscripcions FSD ($199/mes), valoració Tesla, dades com a moat, demandes NHTSA |
| Impacte social | Reducció de mortalitat (debat), accessibilitat, riscos d'accidents reals, debat regulatori |
| No està a la llista prohibida | ✓ (Watson, Siri, Google Now, Translate, Duplex, Baidu, Kinect, YouTube) |
| No està agafat per altres grups | ✓ (DiPilot/BYD ja agafat, però Tesla té enfoc tècnic diferent — vision-only) |

## Estructura del document amb assignació de pàgines

| # | Secció | Pàg. |
|---|---|---|
| 1 | Portada | 1 |
| 2 | Índex | 1 |
| 3 | Introducció (Tesla, FSD, evolució 2014-2024) | 1.5 |
| 4 | Context: el problema de la conducció autònoma; nivells SAE; sensor stacks | 1 |
| 5 | **Descripció de les tècniques d'IA** | **5-6** |
|   | 5.1 Arquitectura general (vision-only stack) | |
|   | 5.2 HydraNet: backbone compartit + multitask heads | |
|   | 5.3 BEV transformer: reprojecció multi-càmera | |
|   | 5.4 Occupancy Networks: representació volumètrica | |
|   | 5.5 Video neural networks: memòria temporal | |
|   | 5.6 Planning end-to-end (FSD v12) | |
|   | 5.7 Data engine i auto-labeling | |
| 6 | La innovació de FSD v12 | 1.5 |
|   | 6.1 Què canvia: NN end-to-end vs heurístiques | |
|   | 6.2 Naturalesa: ús innovador de tècniques existents | |
| 7 | Impacte empresarial (beneficis, riscos, posició mercat) | 1.5 |
| 8 | Impacte social (beneficis, riscos) | 1.5 |
| 9 | Conclusions | 0.5 |
| 10 | Bibliografia | 1 |
| | **Total** | **~16** |

## Repartiment de feina (proposta)

- **Marc Planas Bosch** — Introducció + Context + 5.1-5.3 (visió general + HydraNet + BEV)
- **Jaime Prieto Salcedo** — 5.4-5.7 (Occupancy + Video NNs + Planning + Data engine)
- **Marcel Mula Tixier** — Innovació + Impacte empresarial + Impacte social + Conclusions
- Bibliografia compartida (cadascú referencia les fonts del seu tros)
- Maquetació final: rotativa o la persona amb més habilitat amb LaTeX

## Bibliografia inicial proposada

**Fonts primàries Tesla**
- Tesla AI Day 2021 (Karpathy) — Autopilot, HydraNet
- Tesla AI Day 2022 (Elluswamy, Shroff) — Occupancy Networks, Lanes Network, Planning
- Tesla CVPR 2023 Workshop — keynote Elluswamy
- Karpathy — "Software 2.0" (blog, 2017) i xerrades posteriors
- Elon Musk — anuncis FSD v12 (X/Twitter, gener 2024)

**Fonts tècniques**
- Bojarski et al. (2016) "End-to-End Learning for Self-Driving Cars" (NVIDIA) — context històric
- Vaswani et al. (2017) "Attention is All You Need" — base del BEV transformer
- Mildenhall et al. (2020) "NeRF" — context per Occupancy Networks
- Survey: Chen et al. (2024) "End-to-End Autonomous Driving: Challenges and Frontiers"

**Anàlisi crítica i context regulatori**
- NHTSA Standing General Order — informes d'accidents amb Autopilot
- Philip Koopman — anàlisi crítica de FSD (Carnegie Mellon)
- Bloomberg / The Information — articles sobre FSD v12

**Comparació amb competència**
- Waymo whitepapers; Mobileye REM; BYD DiPilot fonts
- Survey "A Survey on Sensor Technologies for Autonomous Vehicles"

## Calendari (avui 2026-04-26, entrega 27 maig)

| Setmana | Dates | Lliurables |
|---|---|---|
| 1 | 27 abr - 3 maig | Recerca individual: cada un llegeix 3-4 fonts del seu apartat. Reunió divendres per posar en comú |
| 2 | 4 - 11 maig | Esborrany v1 de seccions individuals (text + figures provisionals) |
| 3 | 12 - 18 maig | Integració, revisió creuada entre membres, figures definitives |
| 4 | 19 - 26 maig | Revisió final, maquetació, bibliografia normalitzada |
| | 27 maig | Entrega Racò |
| 5 | 28 maig - 1 juny | Preparació presentació 6 min (slides + assaig) |
| | 2-3 juny | Presentació |

## Eines

- **Document:** Overleaf (LaTeX) — recomanat pels exemples del repo
- **Figures:** draw.io o redibuixar les dels AI Days citant la font
- **Bibliografia:** BibTeX (si Overleaf) o Zotero
- **Comunicació equip:** WhatsApp + carpeta compartida (Drive)

## Riscos i mitigacions

| Risc | Mitigació |
|---|---|
| Tesla no publica papers acadèmics; les fonts són talks i blogs | Triangular cada claim amb 2+ fonts; explicitar les limitacions |
| FSD evoluciona ràpid i la informació pot quedar obsoleta | Fixar "freeze date" del treball (proposta: 5 de maig); declarar-ho explícitament |
| To massa hype/màrqueting per usar fonts de Tesla | Citar també anàlisi crítica (Koopman, NHTSA) per equilibrar |
| Comparació amb DiPilot (BYD) podria solapar-se amb l'altre grup | Mantenir el focus en Tesla; usar la comparació només puntualment per ressaltar la diferència vision-only |
| La secció 5 pot resultar massa densa per a 6 min de presentació | Per la presentació, simplificar a 3 conceptes: BEV → Occupancy → end-to-end |

## Out of scope

- Anàlisi detallada del hardware FSD computer (chip HW3/HW4) — només menció
- Anàlisi exhaustiva de tots els competidors — només posicionament
- Optimus, robotaxi, futur post-FSD v12 — fora d'abast
- Finances detallades de Tesla com a empresa — només l'unitat FSD

## Mètriques d'èxit

- Compleix els 7 punts de la rúbrica de continguts
- Secció 5 amb almenys 4 figures tècniques pròpies o degudament citades
- Bibliografia amb 12+ referències, almenys 4 acadèmiques i 4 amb anàlisi crítica
- Presentació de 6 min cronometrada amb 3 assajos previs
- Formulari intermedi de "treball en equip" entregat puntualment a mitjans d'abril (atenció: aquest checkpoint pot haver passat ja — verificar amb el professor)

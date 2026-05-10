# Roadmap — P2 SBC

**Reference dates**
- Today: **10 May 2026** (Sun) — *we are at the start of week 5 of the original plan*
- Optional intermediate prototype: **15 May 2026, 23:59**
- Final electronic delivery: **24 May 2026** (Sun)
- In-person delivery / presentation: **27 – 29 May 2026**

> Total budget per person ≈ 27 h (20.7 ECTS h + 6 lab h) over 6 weeks → ≈ 80 h / team. We have ~14 days left, which is the tightest stretch of the practice.

---

## A. Original 6-week plan (recap from the statement)

| Week | Dates | Focus |
|------|-------|-------|
| 1 | 13 – 19 Apr | Read statement, learn CLIPS, initial domain brainstorming. |
| 2 | 20 – 26 Apr | Problem specification + first ontology in Protégé. |
| 3 | 27 Apr – 3 May | Sub-problem decomposition, problem-solving methodology choice, ontology v2, **first running prototype** (resolves a simple case). |
| 4 | 4 – 10 May  | Ontology (almost) final, prototype extended to more cases, start writing the ontology section of the report. |
| 5 | 11 – 17 May | **Definitive prototype** — list the cases to support, run them, store outputs, explain results. |
| 6 | 18 – 24 May | Generate the documented test suite + finish the report. |

---

## B. Where we are vs. where we should be (status at 10 May 2026)

Fill in honestly before continuing. If any row is "not started", that is a red flag and must be done first this week.

| Item | Expected by today | Status |
|------|-------------------|--------|
| CLIPS environment running locally | end of W1 | ✅ 10 May (Windows install via clipsdos + IDE) |
| Statement re-read; informal domain notes | end of W1 | ✅ (covered by PRD §1–§3) |
| Problem specification doc | end of W2 | ✅ `p2/PRD.md` |
| Ontology v1 in Protégé (concepts + attributes) | end of W2 | 🟡 Protégé installing 10 May — **next up** |
| Sub-problem decomposition + methodology chosen | end of W3 | 🟡 partial — 5-phase decomposition encoded as CLIPS modules (`interview / inference / generate / score / present`); methodology choice still to write up |
| First prototype solving 1 simple case in CLIPS | end of W3 | ✅ `p2/clips/main.clp` runs honeymoon test case end-to-end |
| Ontology v2 with relations + ≥ a few instances | end of W3 / W4 | ☐ |
| Prototype extended to more cases | end of W4 | ☐ (only honeymoon case so far) |
| Ontology section of the report drafted | end of W4 | ☐ |

> **Snapshot 10 May 18:00.** Prototype track is on schedule. Ontology track is the only thing behind — the rest of Sprint 5 should pivot toward closing that gap, not adding CLIPS features.

---

## C. Forward roadmap (10 → 29 May)

### Sprint 5 — "Definitive prototype" (Mon 11 May → Sun 17 May)

**Goal:** lock the prototype. After this sprint no new feature should be added — only test cases and documentation.

| Day | Task | Owner | DoD |
|-----|------|-------|-----|
| Mon 11 | Stand-up: confirm §B status; list the cases the system must solve. | Team | List of ≥ 8 candidate cases (common + edge + infeasible) committed under `p2/tests/cases.md`. |
| Mon 11 – Tue 12 | **Ontology v1 in Protégé** — class hierarchy + data properties + first object properties (see §G). Save as `p2/ontology/al-fin-del-mundo.owl`. | Member A | `.owl` file committed; class hierarchy screenshot under `p2/ontology/img/`. |
| Tue 12 – Wed 13 | **Ontology v2** — add the remaining object properties (relations between Trip/City/Accommodation/Transport/POI/User), add ≥ 8 instances exercising every relation, run reasoner, fix inconsistencies. Export OntoGraf PNG. | Member A | Ontology validates (no red triangles); graph PNG committed. |
| Tue 12 – Wed 13 | **Align CLIPS scaffold with the ontology** — extend `p2/clips/main.clp` deftemplates / `CITY` defclass to mirror the ontology classes & properties. Add `ACCOMMODATION` and `TRANSPORT` defclasses. | Member B | `(start)` still runs end-to-end; new fields visible in plan output. |
| Wed 13 – Thu 14 | **Interactive interview** — replace `deffacts test-user` with `(read)`-driven rules in the `interview` module, validating each answer. Keep a `--test` shortcut for the hardcoded user so demos stay reproducible. | Member B | New rule `interview::ask-objective` etc.; manual run fills a `user` fact via the REPL. |
| Wed 13 – Thu 14 | **Extend cases to ≥ 6** — add rules / data so the prototype handles: large group with kids, tight budget, romantic short trip, infeasible (impossible style), unknown city objective, train-only transport restriction. | Member C | Each new case lives in `p2/tests/case-NN.bat`; output captured to `case-NN.out`. |
| Thu 14 | Run all candidate cases; capture original CLIPS output to `tests/case-NN.out`. | Team | All `case-NN.out` files committed. |
| Fri 15 | **(Optional) Submit intermediate prototype before 23:59.** Tag repo `intermediate-prototype`. | Team | Submission receipt saved. |
| Sat 16 – Sun 17 | Buffer / fix any blocker; freeze feature scope; start drafting the **Formalisation** report section while the ontology is fresh. | Team | "feature freeze" tag pushed; ≥ 1 page of Formalisation section drafted. |

**Sprint 5 milestones:**
- ✅ Working prototype frozen.
- ✅ Ontology final.
- ✅ ≥ 6 documented test cases producing CLIPS output.

### Sprint 6 — "Tests + report" (Mon 18 May → Sun 24 May)

**Goal:** produce the deliverables. No code changes unless a test reveals a bug.

| Day | Task | Owner | DoD |
|-----|------|-------|-----|
| Mon 18 | Finalise the test list: ≥ 6, all different, including ≥ 1 edge case and ≥ 1 infeasible case. Justify each case. | Team | `tests/README.md` with rationale per case. |
| Mon 18 – Tue 19 | Write the **Identification** + **Conceptualisation** sections (incl. LLM prompt + Q&A excerpts if pursuing the bonus). | Member A | Sections drafted in the report. |
| Mon 18 – Tue 19 | Write the **Formalisation** section (ontology, hierarchy graph, element-by-element description, reasoning per sub-problem, methodology justification). | Member B | Section drafted. |
| Tue 19 – Wed 20 | Write the **Implementation** section (module map, rule highlights, control mechanisms, incremental prototype log). | Member C | Section drafted. |
| Wed 20 | Generate the **Tests** section: scenario, input, expected, original CLIPS output, explanation. | Team | Section drafted. |
| Thu 21 | Internal review pass #1 — every team member reads the whole report. Fix structure, flow, transitions. | Team | Review notes resolved. |
| Fri 22 | Add diagrams: ontology hierarchy, sub-problem decomposition, reasoning flow. Spell-check (Catalan/Spanish + technical terms). | Team | All figures captioned and referenced. |
| Sat 23 | Internal review pass #2 — focused on rubric: tick every "Bien" cell. Add the LLM appendix if applicable. | Team | Rubric self-checklist all-green. |
| **Sun 24** | **Final electronic delivery.** Tag the repo `v-final`. | Team | Submission receipt saved. |

**Sprint 6 milestones:**
- ✅ Report submitted.
- ✅ Source code committed and tagged.
- ✅ Test suite documented with original CLIPS outputs.

### Sprint 7 — "Defence" (Mon 25 May → Fri 29 May)

| Day | Task |
|-----|------|
| Mon 25 | Confirm slot with the lab teacher (27, 28 or 29 May). Prepare a short demo script (10–15 min) walking through 2 representative cases live. |
| Tue 26 | Dry-run the demo. Anticipate likely questions: "Why this methodology?", "How does the ontology drive the rules?", "What happens if X?". Fill in the **Teamwork Level 3 self-assessment form** (Chapter 8.2 of the statement) — every member separately, then reconcile. |
| 27 / 28 / 29 | **In-person delivery.** Bring laptop with CLIPS + Protégé installed and the project ready to demo. |

---

## D. Definition of Done — per work item

- **Ontology**: every concept documented in Protégé itself; relations exist between user-types, trips, cities, accommodation, transport; instances exercise every relation.
- **Rule module**: lives in its own `.clp` file; rules use chained reasoning (LHS facts produced by other rules); no business logic in global vars.
- **Test case**: has a one-paragraph description, the user inputs, the expected behaviour, the original CLIPS transcript, and a short explanation tying the output back to specific rules / ontology elements.
- **Report section**: spell-checked; cross-references resolved; figures captioned; passes the matching rubric row at "Bien".

---

## E. Cadence & coordination

- **Daily 10-min stand-up** (text channel is fine): yesterday / today / blockers.
- **Mid-week sync** every Wed evening: review burn-down, re-balance.
- **End-of-sprint retro** (Sun 17 May, Sun 24 May): what worked, what didn't, what to change.
- Rotate the **coordinator** role between the 3 sprints — one of the Level-3 teamwork criteria the rubric in 8.2 explicitly checks.

---

## F. Quick rubric self-check (run before submission)

- [ ] Identification is more than a paraphrase of the statement.
- [ ] Conceptualisation lists concepts AND sub-problems AND expert resolution examples.
- [ ] Formalisation has a hierarchy graph + per-element documentation + per-sub-problem reasoning + methodology justification.
- [ ] Implementation uses modules + (deftemplates AND objects) + advanced control + chained rules.
- [ ] ≥ 6 test cases, all different, infeasible case included, original CLIPS output present, each output explained.
- [ ] Report has intro → development → conclusions; figures are meaningful; no spelling errors.
- [ ] LLM appendix included (if pursuing +1).
- [ ] Source code committed, commented, tagged.

---

## G. Protégé quick-start (use during Sprint 5 Mon–Tue)

Protégé is a graphical OWL ontology editor — analogous to the CLIPS IDE, but for the ontology side. The deliverable is a `.owl` file plus a hierarchy graph image; the rubric (§5.1 *Formalisation*) wants every class, property and relation documented.

### Tabs you will use
- **Active Ontology** — set the IRI once: `http://upc.edu/ia/p2/al-fin-del-mundo`.
- **Entities → Classes** — the concept hierarchy.
- **Entities → Object properties** — relations between individuals (range/domain are classes).
- **Entities → Data properties** — attributes that take primitive values (string, int, float).
- **Entities → Individuals** — instances exercising every relation.
- **Reasoner menu** — start HermiT or Pellet to detect inconsistencies and compute the inferred class hierarchy.
- **Window → Tabs → OntoGraf** — graphical view; `Export as PNG` for the report.

### Class hierarchy to start from (mirror of the CLIPS scaffold)

```
Thing
├── Trip
├── User
│   ├── Single
│   ├── Family
│   ├── Group
│   └── LargeGroup
├── Place
│   ├── City
│   └── PointOfInterest
│       ├── Museum
│       ├── Beach
│       ├── Restaurant
│       └── Landmark
├── Accommodation
│   ├── Hotel
│   ├── Hostel
│   └── Apartment
├── Transport
│   ├── Flight
│   ├── Train
│   └── Bus
└── Preference
    ├── TripObjective         (rest, cultural, fun, romantic, honeymoon)
    ├── BudgetTier
    ├── TransportPreference
    └── AccommodationPreference
```

### Object properties (relations) — minimum set

| Property | Domain → Range | Notes |
|---|---|---|
| `visitsCity` | Trip → City | with cardinality 1..* |
| `staysIn` | Trip → Accommodation | one per visited city |
| `travelsBy` | Trip → Transport | |
| `targetUser` | Trip → User | |
| `hasPreference` | User → Preference | |
| `locatedIn` | Accommodation → City, PointOfInterest → City | reuse the same property |
| `hasPOI` | City → PointOfInterest | inverse of `locatedIn` for PointOfInterest |
| `connectsTo` | City → City | for transport-graph reasoning |

### Data properties (attributes)

| Property | Domain | Range | Example |
|---|---|---|---|
| `costLevel` | City | xsd:int (1–5) | Paris = 5 |
| `starRating` | Accommodation | xsd:int (1–5) | |
| `priceEUR` | Accommodation, Transport, Trip | xsd:decimal | |
| `durationDays` | Trip | xsd:int | |
| `themeTag` | City, Trip | xsd:string (multivalued) | "romantic", "cultural"… |

### Workflow for tonight + tomorrow

1. **Mon 11 morning** — install + open Protégé, set IRI, build the class hierarchy above (no properties yet). Save as `p2/ontology/al-fin-del-mundo.owl`.
2. **Mon 11 afternoon** — add data properties; assign domains & ranges.
3. **Tue 12 morning** — add object properties; mark `inverseOf` where it applies.
4. **Tue 12 afternoon** — add ≥ 8 individuals (Paris, Venice, a sample Hotel in each, one Trip, one User…). Run the reasoner; fix anything red.
5. **Tue 12 evening** — `Window → Tabs → OntoGraf → Export as PNG` → commit under `p2/ontology/img/hierarchy.png`. This is the figure for the Formalisation section.

### How the ontology and CLIPS code stay in sync
- Ontology = the *spec*. CLIPS code = the *implementation*.
- Each OWL class becomes a `defclass` in COOL (or a `deftemplate` if it has no behaviour).
- Each object property becomes a `slot ... (type INSTANCE-NAME)` (or multislot).
- Each data property becomes a typed `slot`.
- Individuals can be exported from Protégé and turned into `definstances` for `data.clp` — but for the prototype, hand-curated `definstances` are fine and easier to iterate on.

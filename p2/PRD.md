# Product Requirements Document — P2 SBC

**Course:** Intel·ligència Artificial (IA) — Pràctica de Sistemes Basats en el Coneixement (SBC)
**Quadrimestre:** 2025/2026 Q2
**Final delivery:** 24 May 2026 (electronic) · In-person delivery 27–29 May 2026
**Optional intermediate delivery (functional prototype):** 15 May 2026, 23:59
**Team size:** preferably 3 students
**Implementation language:** CLIPS · **Ontology tool:** Protégé

---

## 1. Product Vision

Build a **rule-based expert system** for the fictional travel agency *"al fin del mundo y más allá"* that produces **two personalised multi-city trip recommendations** for any given client. The system replaces the manual work of a travel agent: it interviews the client, infers their profile, applies expert reasoning, and outputs concrete trips (cities, days, places to visit, accommodation, transport, total price), with an explanation of which user preferences each plan satisfies.

The product is also a vehicle for the team to demonstrate the full **knowledge-engineering methodology** — identification, conceptualisation, formalisation, implementation, testing — and the use of an **ontology** built with Protégé.

---

## 2. Scope

### 2.1 In scope

#### Knowledge acquisition (interview)
The system must elicit and reason over:

- **User characteristics**
  - Age, cultural level, travelling with children, special event (wedding, end-of-studies trip…)
  - Group type: single person, family, group of friends, large group
  - Trip objective: rest, cultural, fun, romantic…
- **Trip restrictions** (must be satisfied)
  - Min/max trip days, min/max cities, min/max days per city
  - Approximate budget
  - Transport restrictions (e.g. dislikes flying, prefers train)
  - Accommodation quality
- **Trip preferences** (used to compare/score solutions)
  - Willingness to sacrifice duration or quality to fit the budget
  - Preference for less-known cities

The team is **expected to add further characteristics, restrictions and preferences** beyond those listed in the statement.

#### Reasoning & inference
- The system **does not ask everything**: it deduces facts where common sense applies (e.g. honeymoon ⇒ romantic; travelling with kids ⇒ probably not a "rest" trip).
- The system **prunes the search space with common-sense expert rules** (e.g. short trip ⇒ cities should be close; few days per city ⇒ fewer places to visit).
- Expert restrictions can apply to user/preference profiles (e.g. themed city sets — Mediterranean, Major European Capitals, Natural South America — that match certain trip types).

#### Output
For each consultation, return **two distinct trip plans** that visit different cities. Each plan must include:

- Total price per person
- Trip duration
- Cities and days per city
- Places to visit in each city
- Accommodation per city (with star rating)
- Transport between origin/cities
- Which user preferences the plan satisfies

The system must also handle the **infeasibility case** (no valid recommendation given the user's restrictions) and explain why.

#### Knowledge representation
- An **ontology built in Protégé** that covers the concepts the system needs (cities, accommodations, transport, places of interest, user types, trip plans, restrictions, preferences, …), with documented hierarchy, attributes and relations, and a useful set of instances.
- Data may be real (cities, sights) and/or generated; prices and other numeric values must follow common sense (e.g. inter-city distance influences trip cost; cost of living influences accommodation price).

#### Implementation
- A **CLIPS** rule-based program structured around the chosen problem-solving methodology (modular, deftemplates + COOL objects, advanced control mechanisms, chain-of-reasoning rules — not just unordered facts and global vars).
- **Incremental development**: an early limited prototype, then progressive extensions covering more cases.

#### Test set
- A **non-trivial set of test cases** covering common scenarios *and* edge cases (e.g. infeasible request, very tight budget, large group with kids, romantic short trip, etc.). Each case must include input, expected behaviour, actual output, and explanation of how the system reached it.

#### Documentation deliverable
A written report covering all phases of the methodology: identification, conceptualisation (including the LLM-assisted conceptualisation if the extra point is pursued), formalisation (ontology), implementation, and tests. Plus the commented CLIPS source code.

#### Optional: LLM-assisted conceptualisation (extra point)
- Define a non-trivial role-play prompt that puts an LLM in the role of a travel-agent expert.
- Use the conversation as a knowledge-elicitation source.
- Document which prompt was used, which questions were asked, and which decisions in the ontology / rules were taken thanks to the LLM.
- Earns **+1 point** on the final mark.

### 2.2 Out of scope
- A graphical user interface (CLIPS REPL is enough).
- A real booking / payment integration.
- Persistent storage of past consultations.
- Multi-language NLP — interaction is via structured CLIPS prompts.
- A literal copy of the statement as "problem description" (explicitly penalised by the rubric).

---

## 3. Functional Requirements

| ID  | Requirement |
|-----|-------------|
| FR-1  | The system shall ask the user a structured sequence of questions to elicit characteristics, restrictions and preferences. |
| FR-2  | The system shall infer additional facts from answers via expert rules (e.g. honeymoon ⇒ romantic). |
| FR-3  | The system shall apply expert restrictions (themed city sets, common-sense pruning, etc.) to reduce the search space. |
| FR-4  | The system shall generate **two** complete trip plans visiting **different cities**. |
| FR-5  | Each generated plan shall fully specify: cities, days/city, places to visit, accommodation, transport, total price. |
| FR-6  | Each generated plan shall report which user preferences it satisfies. |
| FR-7  | The system shall detect infeasible requests and report them clearly instead of producing a wrong plan. |
| FR-8  | The system shall be implemented in CLIPS using deftemplates / COOL objects, modular rule sets, and chained-reasoning rules. |
| FR-9  | The knowledge base shall be backed by an ontology built and documented in Protégé. |
| FR-10 | Numeric values (prices, distances) shall follow common sense even if generated. |

## 4. Non-Functional Requirements

| ID  | Requirement |
|-----|-------------|
| NFR-1 | **Methodology compliance** — implementation must follow the identification → conceptualisation → formalisation → implementation → tests pipeline taught in class. |
| NFR-2 | **Modularity** — rules grouped by sub-problem; control flow uses CLIPS modules / focus, not global flags. |
| NFR-3 | **Incremental development** — at least one intermediate working prototype before the final version. |
| NFR-4 | **Test coverage** — many tests (≥ 6) covering common AND edge cases, with documented inputs/outputs. |
| NFR-5 | **Documentation quality** — well-structured, free of spelling/grammar errors, includes diagrams (ontology graph, control flow, sub-problem decomposition). |
| NFR-6 | **Reproducibility** — the report must contain the original CLIPS output for each test case (not hand-written). |

---

## 5. Evaluation Criteria (translated from the rubric)

The grade is computed against **5 axes**, each scored *Mal / Regular / Bien*. Targeting *Bien* on every row is the path to a top mark.

### 5.1 Application of the design & implementation methodology
| Criterion | "Bien" target |
|-----------|---------------|
| **Identification** | Problem description goes beyond the statement; detailed feasibility analysis of building the SBC; clear listing of knowledge sources; clear description of system goals and expected results. |
| **Conceptualisation** | Detailed description of domain concepts and sub-problems; expert-level resolution examples; informal description of how problems and sub-problems are organised. |
| **Formalisation** | Ontology construction is fully explained; ontology contains all required concepts, attributes and relations; documentation describes every element + concept hierarchy graph; reasoning process detailed for each sub-problem; methodology choice justified. |
| **Implementation** | Adequate ontology representation; rule-based resolution is modular and follows the chosen problem-solving methodology; incremental prototyping is evident with intermediate prototypes described. |

### 5.2 Test cases
| Criterion | "Bien" target |
|-----------|---------------|
| **Coverage** | ≥ 6 cases, all different and covering edge cases; case-selection rationale explained. |
| **Explanations** | Original CLIPS output included; output explained in terms of the system's encoded knowledge. |

### 5.3 CLIPS implementation
| Criterion | "Bien" target |
|-----------|---------------|
| **Language proficiency** | Use of deftemplates AND objects; existence of well-defined rule modules and advanced control mechanisms; programming style based on chained reasoning, exploiting CLIPS' production-rule formalism. |

### 5.4 Practice quality
| Criterion | "Bien" target |
|-----------|---------------|
| **Coverage** | Advanced — handles common cases AND exceptions. |
| **Documentation** | Well presented, well structured, follows the methodology, explanations are elaborated, concise and precise. |
| **Statement compliance** | The work matches what the statement asked for. |

### 5.5 Report quality
| Criterion | "Bien" target |
|-----------|---------------|
| **Spelling & grammar** | No spelling/grammar errors. |
| **Organisation** | Logical structure; sections and subsections well linked; first part poses the problem, middle elaborates the solution, last part summarises results and draws conclusions. |
| **Clarity** | Clear contents; short, easy-to-read sentences. |
| **Use of figures** | All figures meaningful and helpful (ontology graph, decomposition diagram, reasoning flow…); none missing, none gratuitous. |

### 5.6 Bonus
| Item | Effect |
|------|--------|
| LLM-assisted conceptualisation, properly documented | **+1 point** on the final grade. |

### 5.7 Teamwork competence (separate questionnaire — Chapter 8)
Evaluated at the in-person delivery via a Level 2 / Level 3 form covering: cooperative relations, planning of group objectives, meeting deadlines, exchanging information & ideas, conflict resolution, coordinator role, retrospective.

> Important: *"It is not teamwork to split the work in week 1 and not meet again until the week before delivery."*

---

## 6. Deliverables Checklist

- [ ] Written report (PDF) covering identification, conceptualisation, formalisation, implementation, tests.
- [ ] Ontology file exported from Protégé + ontology documentation (graph + element descriptions).
- [ ] Commented CLIPS source code.
- [ ] Documented test suite (≥ 6 cases) with original CLIPS outputs.
- [ ] (Optional) LLM appendix: prompt + relevant excerpts of the elicitation conversation.
- [ ] Teamwork self-assessment form ready for the in-person session.

---

## 7. Assumptions & Open Decisions

- Travel data may be partly real, partly generated — to be decided by the team in the conceptualisation phase.
- Choice of problem-solving method (e.g. classification + constructive search, constraint propagation, heuristic generate-and-test…) — to be decided after sub-problem decomposition.
- Whether to pursue the LLM bonus — recommended given the low cost (one extra section + an annex).

---

## 8. Risks

| Risk | Mitigation |
|------|-----------|
| Leaving everything for the last week (most common cause of low marks per the statement). | Follow the roadmap; check progress at the weekly milestones. |
| Ontology that is just concepts with shallow attributes and no relations. | Force a Protégé review at end of week 2; ensure object properties exist between cities/accommodations/transport/users. |
| Rules implemented as flat unordered facts + global vars. | Adopt CLIPS modules + objects from the first prototype; review at the week-3 milestone. |
| Test cases that only cover the easy path. | Reserve a slot in week 5 dedicated to designing edge cases and the infeasibility case. |
| Report written in the last 48 h. | Start documenting in week 3 (ontology section first). |
| Team mark penalty for poor coordination. | Set fixed weekly meetings; track tasks in a shared board; rotate the coordinator role. |

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
| CLIPS environment running locally | end of W1 | ☐ |
| Statement re-read; informal domain notes | end of W1 | ☐ |
| Problem specification doc | end of W2 | ☐ |
| Ontology v1 in Protégé (concepts + attributes) | end of W2 | ☐ |
| Sub-problem decomposition + methodology chosen | end of W3 | ☐ |
| First prototype solving 1 simple case in CLIPS | end of W3 | ☐ |
| Ontology v2 with relations + ≥ a few instances | end of W3 / W4 | ☐ |
| Prototype extended to more cases | end of W4 | ☐ |
| Ontology section of the report drafted | end of W4 | ☐ |

---

## C. Forward roadmap (10 → 29 May)

### Sprint 5 — "Definitive prototype" (Mon 11 May → Sun 17 May)

**Goal:** lock the prototype. After this sprint no new feature should be added — only test cases and documentation.

| Day | Task | Owner | DoD |
|-----|------|-------|-----|
| Mon 11 | Stand-up: confirm status of items in §B; list the cases the system must solve. | Team | List of ≥ 8 candidate cases (common + edge + infeasible). |
| Mon 11 – Tue 12 | Close ontology v3 in Protégé: every concept has attributes AND relations; export the graph image; add a representative set of instances. | Member A | Ontology file + graph PNG committed. |
| Mon 11 – Wed 13 | Refactor CLIPS rules into modules (e.g. `MAIN`, `interview`, `inference`, `generate`, `score`, `present`). Replace global vars with `deftemplates` / `defclass`. | Member B | `clips -f run.clp` executes a known case end-to-end. |
| Wed 13 – Thu 14 | Implement infeasibility detection + the "two distinct plans" requirement (FR-4, FR-7). | Member C | Two test cases pass: one with two valid plans, one infeasible. |
| Thu 14 | Run candidate cases through the prototype; capture original CLIPS output to text files. | Team | `tests/case-NN.out` files committed. |
| Fri 15 | **(Optional) Submit intermediate prototype before 23:59.** | Team | Submission receipt saved. |
| Sat 16 – Sun 17 | Buffer / fix any blocker found during the test run; freeze feature scope. | Team | Issue list at zero; "feature freeze" tag in repo. |

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

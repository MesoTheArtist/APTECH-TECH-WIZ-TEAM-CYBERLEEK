# PennyPal — Project Decisions Log

**Aptech TechWiz7 · Multi-Platform App Computing**
Team Lead: Ebenezer

This README tracks the key decisions made so far, in the order they were made,
so anyone joining the project (or judges asking "why did you choose X?") can
see the reasoning without digging through chat history.

---

## 1. Project selection: PennyPal

Three SRS options were provided: **Fandom Verse Pocket Edition**, **HarvestHub**,
and **PennyPal**. PennyPal was chosen because:

- It has a single primary user role (Student) plus a light Admin role — far less
  build surface than HarvestHub's three full roles (Customer/Farmer/Admin).
- It requires the least manual content-authoring — Fandom Verse needs trivia,
  lore, and merch curated across multiple fandom categories to feel complete.
- The dashboard/budget/savings-goal UI (cards, progress bars, charts) plays
  directly to the team's strength in UI/UX and graphic design.
- It has a natural opening for a real differentiator: the SRS lists
  **camera-captured receipt images** and **AI-powered expense categorization**
  as optional features — both align with existing Python image-processing
  experience on the team, making this a genuine standout feature rather than
  a bolt-on.

**Verdict:** best balance of achievable scope + differentiation potential +
alignment with team strengths.

---

## 2. Build order (documentation vs. code)

Decision: **flowchart / site map and wireframes come before code.**

Even though the SRS lists diagrams as part of the final *documentation
deliverable* (not a literal "step 1"), the team agreed to sketch these first
because:

- It surfaces every screen and how they connect before anyone starts building,
  preventing orphan screens or missing navigation late in development.
- It lets work be divided cleanly across teammates ("you own the Savings
  Goals screen from this wireframe") instead of verbal/ambiguous instructions.
- The database schema is finalized *after* screens are settled, since screens
  determine what data is actually needed.

Agreed order:
1. Site map / flowchart (adapted from the SRS's sample site map)
2. Wireframes for core screens (Dashboard, Add Expense, Budget, Savings Goal)
3. Database schema finalization
4. Build, following the functional build order below

Two initial diagrams were produced:
- **Landing & Auth flow** — Landing page → Student (register/login) or Admin
  (preconfigured login) → both merge into Dashboard.
- **Dashboard site map** *(in progress)* — Dashboard hub branching into the
  four core modules: Income & Expenses, Budget, Savings Goals, Learning &
  Support.

---

## 3. Tech stack: Flutter + Node/Express + database (Firebase-free)

Original SRS reference stack suggested Flutter + Firebase (Auth + Firestore).
**Team decision: replace Firebase entirely** with a fully Node/Express-owned
backend. This is explicitly allowed — the SRS lists "SQLite or Firebase" as
options, not a hard requirement, and labels the technology stack as
*proposed*, not mandatory.

| Layer | Original SRS suggestion | Team's actual choice |
|---|---|---|
| Frontend | Flutter | Flutter (unchanged) |
| Auth | Firebase Authentication | JWT-based auth in Express (bcrypt + jsonwebtoken) |
| Cloud database | Cloud Firestore | MongoDB (Mongoose) or PostgreSQL (Prisma/Sequelize) — **final pick still open** |
| Offline cache | SQLite | SQLite (unchanged — stays on-device regardless of cloud DB choice) |
| API layer | Direct Firebase SDK calls from Flutter | Custom Express REST API sits between Flutter and the database |

**Why:** the team already has a clearer mental model of Express + a
traditional database than the Firebase SDK, and owning the backend fully
gives more control over business logic (budget threshold checks, savings
goal calculations) without relying on Firebase Cloud Functions.

**Known trade-off flagged to the team:** Firebase gives free push
notifications (FCM). The SRS calls for "instant notifications when spending
approaches budget thresholds." Without Firebase, the plan is to start with
**in-app / local notifications only** and treat real push notifications as a
stretch goal — not a day-one requirement.

---

## 4. Folder structure

Decision: **monorepo** with `frontend/` (Flutter) and `backend/` (Express)
as top-level siblings, plus a `docs/` folder for SRS-required documentation
(flowcharts, ER diagrams, database design notes) so deliverable material
lives alongside the code rather than scattered elsewhere.

Structure highlights:
- `frontend/lib/services/api_client.dart` is the **single point of contact**
  with the backend — no screen talks to the database directly, everything
  goes through the Express API. This matches the stack decision above.
- `backend/src/controllers/` stay thin (request/response only);
  `backend/src/services/` hold the actual business logic and DB calls —
  keeps the code easy to explain to judges during evaluation.
- `backend/src/middleware/auth.middleware.js` verifies JWTs issued by
  `auth.service.js` — replaces what Firebase Admin SDK token verification
  would have done.
- `image.service.js` (receipt capture / categorization — the differentiator
  feature) lives on the **backend**, not the Flutter app, since that
  processing is heavier and better centralized than run on-device.

---

## Open decisions (not yet locked in)

- [ ] MongoDB vs. PostgreSQL for the cloud database
- [ ] State management approach in Flutter (Provider / Riverpod / Bloc)
- [ ] Whether the AI chatbot uses a real API or stays rule-based/predefined
      responses (SRS permits either)
- [ ] Wireframes for remaining core screens (Add Expense, Budget, Savings Goal)
- [ ] Final database schema (draft based on SRS sample entities, to be
      finalized after wireframes)

---

## Reference: mandatory SRS deliverables (not decisions, just a reminder)

- Problem definition, design specs, flowcharts/DFDs, database design, test data
- Installation instructions (mandatory)
- Login credentials (mandatory)
- Source code zip + ReadMe.doc with assumptions
- SQL scripts or DB schema docs
- .apk file
- Demo video (.mp4) showing all functionality — mandatory
- AI tool usage acknowledgement in documentation

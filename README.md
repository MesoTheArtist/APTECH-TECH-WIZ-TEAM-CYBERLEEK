# PennyPal Developer Onboarding Guide

Welcome to **PennyPal**—a full-stack personal finance application. This project uses a **Node.js/Express (JavaScript)** backend and a **Flutter (Dart)** cross-platform frontend.

---

## Technical Stack & Tooling

| Component    | Technology                       | Prerequisites                                                                                           |
| ------------ | -------------------------------- | ------------------------------------------------------------------------------------------------------- |
| **Backend**  | Node.js (v18+), Express, MongoDB | [Node.js](https://nodejs.org/?utm_source=gemini), [MongoDB](https://www.mongodb.com/?utm_source=gemini) |
| **Frontend** | Flutter SDK (v3.x+), Dart        | [Flutter SDK](https://docs.flutter.dev/get-started/install?utm_source=gemini)                           |
| **Database** | MongoDB (Local or Atlas)         | Mongo Shell / Compass                                                                                   |

---

## Repository Structure Overview

```
.
├── backend/            # Express REST API, MongoDB models, services & auth
│   ├── src/
│   │   ├── config/     # DB and environment configurations
│   │   ├── controllers/# Route request handlers
│   │   ├── middleware/ # Authentication, validation, and error middleware
│   │   ├── models/     # Mongoose database schemas
│   │   ├── routes/     # Express route definitions
│   │   ├── services/   # Core business logic
│   │   └── utils/      # JWT, logging, and response helpers
│   ├── .env.example
│   └── package.json
├── frontend/           # Flutter mobile and web client application
│   ├── lib/            # Dart application code
│   └── pubspec.yaml    # Flutter dependencies and assets configuration
└── README.md

```

---

## Getting Started & Local Setup

### 1. Repository Setup

Clone the repository and navigate to the project root:

```bash
git clone https://github.com/MesoTheArtist/APTECH-TECH-WIZ-TEAM-CYBERLEEK.git pennypal
cd pennypal

```

---

### 2. Backend Setup (`/backend`)

1. **Navigate to the backend directory:**

```bash
cd backend

```

2. **Install Node.js dependencies:**

```bash
npm install

```

3. **Configure Environment Variables:**
   Create a `.env` file in the `backend/` directory:

```env
PORT=5000
MONGO_URI=mongodb://localhost:27017/pennypal
JWT_SECRET=your_super_secret_jwt_key
NODE_ENV=development

```

4. **Start the API Server:**

- **Development Mode (Auto-reload):**

```bash
npm run dev

```

- **Production Mode:**

```bash
npm start

```

The backend runs by default at `http://localhost:5000`.

---

### 3. Frontend Setup (`/frontend`)

1. **Navigate to the frontend directory:**

```bash
cd ../frontend

```

2. **Verify Flutter Environment & Connected Devices:**

```bash
flutter doctor
flutter devices

```

3. **Install Flutter Dependencies:**

```bash
flutter pub get

```

4. **Run the Application:**

- **Run on target connected device / emulator:**

```bash
flutter run

```

- **Run explicitly on Chrome / Web:**

```bash
flutter run -d chrome

```

- **Run on a specific Android/iOS emulator:**

```bash
flutter run -d <device_id>

```

---

## Development & Testing Commands

### Backend Commands (`/backend`)

```bash
npm run dev        # Start development server with hot-reload
npm test           # Run backend test suite
npm run lint       # Run linter checks

```

### Frontend Commands (`/frontend`)

```bash
flutter pub get             # Fetch all dependencies
flutter test                # Run Flutter unit and widget tests
flutter analyze             # Run static code analysis
flutter build apk           # Build Android release APK
flutter build appbundle     # Build Android App Bundle (AAB)
flutter build ios           # Build iOS release bundle

```

---

## Branching & Commit Workflow

1. **Branch Naming Standard:**

- `feature/feature-name` (e.g., `feature/budget-analytics`)
- `bugfix/issue-description` (e.g., `bugfix/jwt-expiration`)
- `chore/task-name` (e.g., `chore/update-dependencies`)

2. **Pull Request Protocol:**

- Ensure `flutter analyze` and `flutter test` pass with zero errors.
- Verify local backend server tests pass before opening a PR to `main`.

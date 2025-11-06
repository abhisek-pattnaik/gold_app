🪙 Gold App — Flutter UI Interview Task
📱 Overview

This project is a 3-round Flutter UI challenge designed to demonstrate pixel-perfect UI implementation, clean architecture, and modular code practices.
Each round focuses on a separate screen design with responsive layouts, gradient effects, and functional UI components.

🏗️ Project Structure

The project is organized into three branches, each representing a separate round:

Branch Name	Description
round-1-login	Login Screen UI with gradient button and dark theme
round-2-notifications	Notifications list with toggle and scrollable cards
round-3-withdrawals	Withdrawals summary and transaction list with filters
⚙️ Build & Run Instructions

Clone the repository:

git clone https://github.com/yourusername/gold_app.git
cd gold_app


Checkout a specific round branch:

git checkout round-1-login     # or round-2-notifications / round-3-withdrawals


Get dependencies:

flutter pub get


Run the app:

flutter run

🟠 Round 1 — Login Screen
✅ Features:

Dark theme with gold/orange gradient styling

“Login / Register” segmented toggle

Email and password text fields

Password visibility toggle icon

Gradient “Login” button with shadow

“Forgot Password?” link at bottom

Responsive for all screen sizes

🧠 Approach:

Used Column and SingleChildScrollView for responsive layout.
Applied LinearGradient for the button background and maintained consistent padding/margins.
Used StatefulWidget to handle visibility toggle state.

🟡 Round 2 — Notifications Screen
✅ Features:

Scrollable list of notification cards

Icon, title, description, time, and tag badge for each notification

“Notification Settings” card with working Switch

Optional filter chips for grouping notifications

Rounded cards with shadow and spacing

🧠 Approach:

Implemented using ListView.builder with custom NotificationCard widget.
Used Provider for managing toggle state and filters.
Maintained a clean UI using Card and Padding widgets.

🟢 Round 3 — My Withdrawals Screen
✅ Features:

Header with back arrow and screen title

Summary card with total withdrawn, transactions, and success rate

Filter tabs: All / Completed / Processing / Failed

Scrollable list of withdrawal records

Transaction details with date, ID, and colored amount text

Status chips with color-coded states

🧠 Approach:

Created a modular widget structure for summary, tabs, and list items.
Used ListView for transaction items and Row/Column alignment for data presentation.
Maintained consistent shadows, corner radius, and spacing as per design.

🧩 State Management

Used Provider for its simplicity and lightweight nature.
It efficiently manages UI states like password visibility, toggle switches, and selected filters while keeping the code clean and maintainable.

| Round | Preview                                                     |
|--------|-------------------------------------------------------------|
| Round 1 | ![Login Screen](screenshot/login_screen.png)                |
| Round 2 | ![Notifications Screen](screenshot/notification_screen.png) |
| Round 3 | ![Withdrawals Screen](screenshot/withdrawal_screen.png)     |
(Replace the image paths once you add your screenshots to /screenshots folder.)

🧾 Project Highlights

✅ Pixel-perfect UI from provided designs

✅ Modular and clean codebase

✅ Responsive layout across devices

✅ Functional interactions (toggles, filters, tabs)

✅ Organized asset management

📦 Tech Stack

Framework: Flutter (Stable Channel)

Language: Dart

State Management: Provider

IDE: Android Studio / VS Code

📚 Author

👨‍💻 Abhisek Pattnaik
<p align="center">
  <img src="docs/banner/banner.png" alt="YOUR ACADEMY Banner">
</p>

<h1 align="center">YOUR ACADEMY</h1>

<p align="center">
A modern Flutter E-Learning application built with <b>MVVM</b>, <b>Cubit</b>, and <b>Supabase</b>, delivering a scalable, responsive, and multilingual learning experience.
</p>

<p align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)
![State Management](https://img.shields.io/badge/State-Cubit-blue)
![Backend](https://img.shields.io/badge/Backend-Supabase-3ECF8E?logo=supabase&logoColor=white)
![Localization](https://img.shields.io/badge/Localization-English%20%7C%20Arabic-orange)
![Theme](https://img.shields.io/badge/Theme-Light%20%7C%20Dark-black)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20Web-success)
![License](https://img.shields.io/badge/License-MIT-green)

</p>

---

# 📖 About

YOUR ACADEMY is a modern E-Learning application designed to provide students with a seamless online learning experience.

The application enables learners to authenticate securely, explore available courses, watch educational video lessons, manage their enrolled courses, and personalize their experience through Dark Mode and bilingual support.

The project follows a scalable feature-based MVVM architecture and adopts Flutter best practices to ensure maintainability, readability, and long-term scalability.

---

# ✨ Features

## 🔐 Authentication

- Secure authentication using Supabase Authentication
- Persistent login session
- Automatic session restoration
- Logout support
- Form validation
- Error handling

---

## 📚 Courses

- Browse available courses
- Course Details screen
- Course pricing
- Course descriptions
- Course instructor information
- Responsive course cards

---

## 🎥 Video Lessons

- Video player integration
- Organized lesson list
- Course video navigation

---

## 👤 User Profile

- View personal profile
- Edit profile information
- Change password
- Theme switching
- Language selection

---

## 🌍 Localization

- English
- Arabic
- RTL Support
- Instant language switching
- Persistent language selection

---

## 🌙 Theme

- Light Theme
- Dark Theme
- System Theme
- Persistent theme mode

---

## 🎨 UI

- Responsive layouts
- Reusable widgets
- Clean Material Design
- Consistent color system
- Centralized theme management

---

# 🏗 Architecture

The application follows a Feature-Based MVVM Architecture.

```

Presentation

│

├── Screens

├── Widgets

├── Cubit

│

Repository

│

Models

│

Supabase Services

│

Supabase Backend

```

Main architectural principles:

- Feature-first folder structure
- MVVM separation
- Cubit for state management
- Repository pattern
- Centralized routing
- Centralized theme management
- Localization support
- SharedPreferences persistence
- Supabase backend

---

# 📁 Project Structure

```text
lib
│
├── core
│   ├── constants
│   ├── localization
│   ├── networking
│   ├── routing
│   ├── shared_pref
│   ├── theme
│   └── widgets
│
├── features
│   ├── auth
│   ├── home
│   ├── course_details
│   ├── course_videos
│   ├── my_courses
│   ├── profile
│   ├── edit_profile
│   └── layout
│
└── main.dart
```

---

# 🛠 Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter | UI Framework |
| Dart | Programming Language |
| flutter_bloc (Cubit) | State Management |
| Supabase | Backend & Authentication |
| SharedPreferences | Local Storage |
| intl | Localization |
| MVVM | Architecture Pattern |

---

# 📱 Screenshots

## Light Theme

> Images will be added later.

---

## Dark Theme

> Images will be added later.

---

# 🎥 Demo

> Demo GIF will be added here.

---

# 🚀 Getting Started

### Clone the repository

```bash
git clone https://github.com/mohefny25/YOUR_ACADEMY.git
```

### Install dependencies

```bash
flutter pub get
```

### Run the project

```bash
flutter run \
--dart-define=SUPABASE_URL=YOUR_SUPABASE_URL \
--dart-define=SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

---

# 🔑 Environment Variables

The application requires the following environment variables:

| Variable | Description |
|----------|-------------|
| SUPABASE_URL | Your Supabase Project URL |
| SUPABASE_ANON_KEY | Your Supabase Anonymous Key |

> **Important:** Never expose your Service Role Key.

---

# 🧪 Quality Assurance

Before every release, the project passes:

- ✅ flutter analyze
- ✅ flutter test
- ✅ dart format
- ✅ flutter build

---

# 🚀 Future Improvements

- Notifications
- Certificates
- Course Search
- Wishlist
- Downloads
- Offline Learning
- Instructor Dashboard
- Admin Dashboard

---

# 👨‍💻 Author

**Mohammed Khaled Abdel-Haleem Hefny**

GitHub:
https://github.com/mohefny25

LinkedIn:
https://www.linkedin.com/in/mohammed-hefny-1b0113230

---

# 📄 License

This project is licensed under the MIT License.

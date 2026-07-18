# Changelog

All notable changes to **YOUR ACADEMY** are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

_Nothing yet._

## [1.0.0] - 2026-07-17

First production-ready release.

### Added
- Email/password authentication via Supabase, with persistent sessions restored on app start.
- Course catalogue: browse courses, view course details, and enrol.
- Course video playback (network video via the video/flick player).
- "My Courses" for enrolled courses, and a Profile screen with account settings.
- Light, dark, and system themes with persistence (`ThemeCubit`) and an in-app theme switch.
- Full English/Arabic localization with correct RTL support (`LocaleCubit`, `intl`, ARB files),
  a language selector bottom sheet, and locale-aware price formatting (currency kept as `EGP`).
- Feature-based MVVM architecture with Cubit/BLoC state management and `Either`-based error
  handling in repositories.
- Centralized design tokens (`AppRadius`), theming, and reusable widgets.

### Security
- Supabase URL and anon/publishable key are provided at build/run time via `--dart-define`
  (kept out of source control). Requires Row Level Security (RLS) enabled on all tables.

[Unreleased]: https://github.com/mohefny25/your-academy/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/mohefny25/your-academy/releases/tag/v1.0.0

# Contributing to YOUR ACADEMY

> **Note:** This is a personal portfolio project. **External contributions are not
> currently accepted** (no pull requests or feature requests at this time). This guide
> documents the project's conventions and workflow for reference and for any future
> collaboration.

Thanks for your interest! This document explains how to set up the project, the
conventions we follow, and how releases are managed.

## Prerequisites

- Flutter (stable channel) and the Dart SDK that ships with it
- A Supabase project (URL + anon/publishable key) with Row Level Security (RLS) enabled

## Local setup

```bash
git clone https://github.com/mohefny25/your-academy.git
cd your-academy
flutter pub get
flutter gen-l10n            # generate localization classes from the ARB files
```

Supabase credentials are supplied via `--dart-define` and are never committed:

```bash
flutter run \
  --dart-define=SUPABASE_URL=https://<project>.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=<anon-or-publishable-key>
```

## Before opening a pull request

Please make sure all of the following pass locally:

```bash
flutter analyze     # must report: No issues found
flutter test        # all tests must pass
dart format .       # code must be formatted
flutter build <target> --dart-define=...   # must build successfully
```

## Code style & architecture

- **Architecture:** feature-based MVVM. Each feature lives under
  `lib/features/<feature>/` with `data/` (models, repositories) and
  `presentation/` (cubit, screens).
- **State management:** Cubit/BLoC (`flutter_bloc`). Repositories return
  `Either<String, T>` (dartz); cubits `fold` the result into states.
- **Shared code:** cross-cutting concerns live under `lib/core/`
  (constants, theme, routing, networking, localization, widgets).
- **Localization:** all user-facing strings come from the ARB files
  (`lib/l10n/`). Never hardcode user-facing text. The brand name
  **YOUR ACADEMY** is never translated and never placed in ARB files.
- **Theming:** use `AppColors`, `AppTextStyles`, and design tokens
  (e.g. `AppRadius`) instead of inline literals where a token exists.

## Commit messages

Use clear, conventional-style messages, e.g.:

- `feat: add course search`
- `fix: restore session on cold start`
- `docs: expand README getting-started`
- `refactor: extract settings row widget`
- `chore: bump dependencies`

## Branching

- `main` — always releasable.
- Feature/fix work happens on short-lived branches
  (`feat/<name>`, `fix/<name>`) merged into `main` via pull request.

## Versioning (Semantic Versioning)

This project follows [SemVer](https://semver.org/): `MAJOR.MINOR.PATCH`.

- **MAJOR** — incompatible/breaking changes.
- **MINOR** — new, backward-compatible functionality.
- **PATCH** — backward-compatible bug fixes.

The Flutter build number (`+N` in `pubspec.yaml`, e.g. `1.0.0+1`) is
incremented on every published build.

## Releases & Git tags

1. Update `CHANGELOG.md` (move items from `Unreleased` into the new version).
2. Bump `version:` in `pubspec.yaml`.
3. Commit: `chore(release): vX.Y.Z`.
4. Tag the release commit: `git tag -a vX.Y.Z -m "vX.Y.Z"` and push tags.
5. Create a **GitHub Release** from the tag, pasting the matching `CHANGELOG.md`
   section as the release notes; attach build artifacts if applicable.

Tags are annotated and always prefixed with `v` (e.g. `v1.0.0`).

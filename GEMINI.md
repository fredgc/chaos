# GEMINI.md - Developer Guide for Chaos Flow Demo

Welcome! This guide is designed to help future LLM agents and human developers
get up to speed quickly on the **Chaos Flow Demo** Flutter application.

---

## Developer Rules & Environment Configuration

All contributors and AI agents must follow the central rules defined in
`~/source/gemini/config/rules/`:

* **Task Management (`todo.md`)**: Project tasks and issues are tracked using
  `~/bin/todo.py`. When asked about tasks or what to work on next, execute:

  ```bash
  ~/bin/todo.py list
  ```

Before starting an item, mark it in progress (`~/bin/todo.py doing <N>`). Once
completed, mark it done (`~/bin/todo.py done <N>`). Do not archive completed
tasks until reviewed and verified.

* **Communication Style (`style.md`)**: Be blunt and direct. Avoid polite
  filler and superlatives. Keep responses concise, technical, and focused
  strictly on facts and instructions.

* **Documentation Formatting (`markdown.md`)**: Keep line lengths strictly
  under 80 characters. Always separate list items with a blank line. Always
  follow headers with a blank line. Visually align markdown table column
  borders (`|`).

* **Emacs Integration (`emacs.md`)**: When requested to send a file to Emacs,
  run `emacs-maybe-client -f <file>`.

* **Hardware & Testing (`devices.md`)**: On host `raven`, an Android device
  may be connected via `adb` for Android testing.

---

## 1. Project Purpose & Features

The **Chaos Flow Demo** is an interactive, educational Flutter application
illustrating dynamic systems, vector flow fields, and chaotic strange
attractors.

### Key Features

* **Multiple Dynamic Systems**: Switch between smooth rotation (`Rotate`),
  localized shearing (`Stir`), and chaotic attractors (`Chaos`).

* **Particle Mote Simulation**: Generates and tracks thousands of animated
  particle motes moving along vector field trajectories in real time.

* **Nullcline & Isocline Overlays**: Renders curves where $\dot{x} = 0$ or
  $\dot{y} = 0$, highlighting equilibrium points and flow direction
  boundaries.

---

## 2. Codebase Architecture

```text
lib/
├── animate.dart     # Animation controllers and frame timing
├── axis.dart        # Coordinate axes and grid lines
├── chaos.dart       # Chaotic strange attractor vector field math
├── color.dart       # Color themes and particle palettes
├── field.dart       # Vector field interfaces and evaluation
├── flow.dart        # Numerical flow integration and particle lifecycle
├── help.dart        # Help modal loading compiled HTML documentation
├── main.dart        # Application entry point
├── mote.dart        # Particle mote state and coordinate updates
├── printer.dart     # Debugging utilities
├── rotate.dart      # Rotational vector field
├── settings.dart    # SharedPreferences configuration and dialog
├── spiral.dart      # Spiral attractor equations
├── stir.dart        # Stirring flow field with shearing teeth
├── tool.dart        # Interactive toolbar tools (motes, emitters, eraser)
├── transform.dart   # Viewport zoom and pan coordinate transforms
└── widget.dart      # Top-level UI widgets and canvas scaffold
```

---

## 3. Build, Versioning & Deployment Workflow

### Build and Asset Automation (`Makefile`)

* `make docs`: Compiles user markdown docs from `doc/*.md` into
  `assets/*.html` and developer docs (`plan.md`, `README.md`, `GEMINI.md`)
  into `assets/dev/*.html` via `pandoc`.

* `make ASSETS`: Generates icons, favicons, version metadata, and docs.

* `make test`: Runs standard Flutter unit, widget, and ARB localization parity
  tests on every commit (`flutter test --exclude-tags release_audit`). Fast
  execution (~2-5 seconds).

* `make audit`: Runs exhaustive pre-release accessibility and multi-locale
  layout audits (`flutter test test/audit_test.dart`). Tests all supported
  locales, compact mobile/tablet/desktop viewports, 1.5x/2.0x font scaling,
  and WCAG AA guidelines (`labeledTapTargetGuideline`). Required automatically
  by `make stage-release` and `make release`.

* `make stage`: Builds web app and deploys to Firebase staging channel.

* `make release`: Deploys production bundle to Firebase (`chaos.gchouse.org`).

---

## 4. Code Style Guidelines

* **Markdown**: Keep line lengths strictly under 80 characters. Always
  separate list items with a blank line. Always follow headers with a blank
  line.

* **Dart**: Run `dart format .` after modifying any code. Keep static analysis
  clean (0 errors, 0 lints).

# Chaos Flow Demo

An interactive, educational application for visualizing the flow fields,
trajectories, and strange attractors of non-linear dynamic systems.

* **Live Web App**: [chaos.gchouse.org](https://chaos.gchouse.org)

* **Android Package**: `org.gchouse.chaos`

---

## Documentation

In-depth documentation and policies are located in `doc/`:

* [doc/about.md](doc/about.md) : Mathematical principles of dynamic systems,
  vector fields, and chaos theory.

* [doc/privacy.md](doc/privacy.md) : Privacy policy and explanation of local
  preference persistence via SharedPreferences.

* [doc/terms.md](doc/terms.md) : Terms of service.

---

## Core Features

* **Dynamic Flow Fields**: Simulate particles navigating rotational fields,
  stirring flows, and chaotic attractors.

* **Interactive Particle Tools**: Place individual motes, continuous streams,
  or grid arrays of particles to observe divergence and sensitivity to initial
  conditions.

* **Isocline & Nullcline Visualizations**: Display curves of zero horizontal
  or vertical velocity to identify equilibria and flow boundaries.

---

## Getting Started

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.24+
  recommended)

* `make` and [Pandoc](https://pandoc.org/) (for compiling documentation)

### Forking and Cloning

1. Fork the repository on GitHub to your account.

2. Clone your fork locally:

   ```bash
   git clone https://github.com/<your-username>/chaos.git
   cd chaos
   ```

3. Install Flutter dependencies:

   ```bash
   flutter pub get
   ```

4. Build documentation assets:

   ```bash
   make docs
   ```

### Running Locally

To launch the web app in Chrome:

```bash
flutter run -d chrome
```

To run on a connected Android device or emulator:

```bash
flutter run -d android
```

### Running Tests

Execute the unit and widget test suite:

```bash
flutter test
```

### Building Releases

Use the provided `Makefile` to generate release assets:

```bash
make build_all
```

---

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for details.

---

## License

This project is open-source and licensed under the
[Apache 2.0 License](LICENSE) .

---

## Disclaimer

This project is not an official Google project. It is not supported by Google
and Google specifically disclaims all warranties as to its quality,
merchantability, or fitness for a particular purpose.

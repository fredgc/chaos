# Chaos Flow Demo Plan

This document outlines the strategic roadmap, mathematical foundations, and
long-term milestones for the **Chaos Flow Demo** project.

> **Note**: Active day-to-day tasks and issue tracking are managed dynamically
> using `~/bin/todo.py`. Run `~/bin/todo.py list` to view active tasks.

---

## 1. Mathematical Models & Systems

The application illustrates dynamic systems, vector fields, and chaotic flow:

### 1.1 Pure Rotation with Perturbation (`Rotate`)

$$\dot{x}(t) = -3y + \text{saw}(x), \quad \dot{y}(t) = 3x + \text{saw}(y)$$

Demonstrates smooth periodic trajectories, uniqueness of solutions, and how
time-dependent perturbations alter path crossing behavior.

### 1.2 Stirring Flow (`Stir`)

$$\dot{x}(t) = -0.2 x^3 + 3 f(y, y_{\text{cent}}), \quad \dot{y}(t) = -0.2 y^3 - 3 f(x, x_{\text{cent}})$$

Where $f$ represents localized shearing or stirring teeth. Showcases sensitive
dependence on initial conditions and folding behavior.

### 1.3 Strange Attractor (`Chaos`)

$$\dot{x}(t) = 0.7 y + 10x(0.1 - y^2), \quad \dot{y}(t) = -x + 0.25 \sin(1.57 t)$$

Exhibits a chaotic strange attractor that folds continuously in state space,
generating quasi-periodic behavior and fractal cross-sections.

---

## 2. Numerical Integration & Particle Dynamics

* **Runge-Kutta Integration**: Transition from simple Euler stepping to
  adaptive 4th-order Runge-Kutta (RK4) to ensure particle motes remain bounded
  and conserve energy over extended simulation runs.

* **Reversible Time & Error Measurement**: Provide a time-reversal toggle to
  simulate backward flow and compute numerical drift / Lyapunov exponent
  estimates.

* **Nullcline & Isocline Geometry**: Solve and render horizontal ($\dot{x} =
  0$) and vertical ($\dot{y} = 0$) nullclines dynamically across all parameter
  configurations.

---

## 3. Interactive Presentation & Educational Modes

* **Interactive Demonstration Walkthrough**: Design step-by-step guided
  lessons explaining vector fields, phase portraits, and chaos theory.

* **Android Package Release**: Prepare Android manifest and publish release
  package to Google Play.

---

## 4. Visual & Accessibility Verification Checklist

Perform these manual checks across supported locales (`en`, `es`, `de`, `fr`,
`ja`, `lt`, `pt`, `zh`) on mobile and desktop viewports:

* **Simulation Canvas & Flow Models**:

  * [ ] Verify particle flow animation renders smoothly for all three models:

    * **Rotate**: Pure rotation with saw-tooth perturbation.

    * **Stir**: Stirring flow with shearing teeth.

    * **Chaos**: Strange attractor folding in phase space.

  * [ ] Test trail fading and particle contrast in both light and dark themes.

* **Controls & Sliders**:

  * [ ] Verify the **Play / Pause** and **Step** buttons respond crisply and
        display localized tooltips.

  * [ ] Adjust particle speed, trail length, and perturbation parameters and
        confirm that slider labels and values render without clipping.

* **Language Menu & Settings**:

  * [ ] Switch to each language from the top bar language menu and confirm all
        UI labels, toolbars, and dialog titles update immediately.

  * [ ] Switch to **Auto** and verify the app reverts cleanly to the system
        default locale.

* **Touch Targets & Screen Readers**:

  * [ ] Verify top bar and floating action controls meet the 48x48 dp minimum
        touch target requirement on mobile devices.

  * [ ] Enable TalkBack (Android) or VoiceOver (iOS/macOS) and confirm screen
        reader announcements when toggling simulation states and switching
        models.

# Hamilton

**A rigid-body physics engine in modern C++, built from first principles.**

*Named after William Rowan Hamilton, who invented the quaternions used here to represent 3D orientation.*

![C++](https://img.shields.io/badge/C++-17-00599C?logo=cplusplus&logoColor=white)
![Field](https://img.shields.io/badge/Field-Physics%20Simulation-0A7EA4)
![Type](https://img.shields.io/badge/Type-Personal%20Project-6C757D)
![Status](https://img.shields.io/badge/Status-In%20Progress-FFA500)

---

## Table of Contents

- [About](#about)
- [Motivation](#motivation)
- [Roadmap](#roadmap)
- [Build & Run](#build--run)
- [Demo](#demo)
- [References](#references)
- [AI Usage](#ai-usage)
- [Author](#author)

---

## About

Hamilton simulates the motion of rigid bodies in 3D: numerical integration of the equations of motion, quaternion-based orientation, collision detection and impulse-based contact resolution. Everything is written from scratch, from the linear algebra up, with every physical behaviour checked by a test.

---

## Motivation

This engine is the first link in a chain of projects:

1. **Hamilton**: a rigid-body physics engine (this repository)
2. **Quadrotor simulator**: 6-DOF drone dynamics built on top of Hamilton
3. **Model Predictive Control**: a controller for the simulated quadrotor

The goal is to understand the dynamics a robot's controller relies on, not just to call a library that hides them.

---

## Roadmap

Each milestone counts as done only when it has a passing test or a reproducible measurement.

- [ ] **Math core**: `Vec3`, `Mat3`, `Quaternion`, with unit tests checked against Eigen used as a reference oracle
- [ ] **Integrators**: explicit Euler, semi-implicit Euler and RK4, with energy drift compared on a harmonic oscillator over 10⁴ steps
- [ ] **Rigid-body rotation**: inertia tensor, Euler's equations and quaternion orientation; angular momentum conserved in torque-free motion, and the intermediate-axis instability (Dzhanibekov effect) reproduced
- [ ] **Collision detection**: sphere, box and plane primitives; AABB broad phase and SAT narrow phase, tested on known configurations
- [ ] **Contact resolution**: impulse-based response with restitution and friction; a stable stack of boxes
- [ ] **Quadrotor dynamics**: continued in a separate repository

---

## Build & Run

```bash
git clone https://github.com/SamutourR115/hamilton-physics.git
cd hamilton-physics
cmake -S . -B build
cmake --build build
ctest --test-dir build
```

---

## Demo

*Coming with the first completed milestone.*

---

## References

- [Baraff & Witkin, *Physically Based Modeling* (SIGGRAPH course notes)](https://www.cs.cmu.edu/~baraff/sigcourse/)
- [Glenn Fiedler, *Integration Basics* (Gaffer on Games)](https://gafferongames.com/post/integration_basics/)
- [Erin Catto, Box2D publications](https://box2d.org/publications/)
- [Allen Chou, *Game Physics Series*](https://allenchou.net/game-physics-series/)
- [Build Your Own X: Physics Engine](https://github.com/codecrafters-io/build-your-own-x#build-your-own-physics-engine)

---

## AI Usage

I use AI as a learning assistant: to explain concepts, discuss design trade-offs and review documentation.

All source code in this repository is written by me.

---

## Author

**Samuel Mastroscianni (Sam)**, BSc Student in Computer Science, University of Liège
[GitHub](https://github.com/SamutourR115) · [LinkedIn](https://www.linkedin.com/in/samuel-mastroscianni-395b6126b)# hamilton-physics

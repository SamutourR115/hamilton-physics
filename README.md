<div align="center">

# Hamilton: A Rigid-Body Physics Engine from Scratch

**Physics Simulation · Modern C++ · Robotics**

![C++](https://img.shields.io/badge/C++-17-00599C?logo=cplusplus&logoColor=white)
![CMake](https://img.shields.io/badge/CMake-3.20+-064F8C?logo=cmake&logoColor=white)
![Field](https://img.shields.io/badge/Field-Physics%20Simulation-0A7EA4)
![Status](https://img.shields.io/badge/Status-In%20Progress-FFA500)

*A 3D rigid-body physics engine written from first principles, as the dynamics core of a future 6-DOF quadrotor simulator.*

*Named after William Rowan Hamilton, who invented the quaternions used here to represent 3D orientation.*

</div>

---

## Table of Contents

- [About](#about)
- [Motivation](#motivation)
- [Roadmap](#roadmap)
- [Repository Structure](#repository-structure)
- [Getting Started](#getting-started)
- [Demo](#demo)
- [References](#references)
- [AI Use](#ai-use)
- [Author](#author)

---

## About

Hamilton simulates the motion of rigid bodies in 3D: numerical integration of the equations of motion, quaternion-based orientation, collision detection and impulse-based contact resolution. Everything is written from scratch, from the linear algebra up, and every physical behaviour is checked by a test.

### Learning objectives

Through this project, I aim to:

1. Build a small **linear algebra** library (`Vec3`, `Mat3`, `Quaternion`) and validate it against a reference
2. Compare **numerical integrators** (Euler, semi-implicit Euler, RK4) on stability and energy drift
3. Model **rigid-body rotation** with the inertia tensor, Euler's equations and quaternions
4. Implement **collision detection** with a broad phase (AABB) and a narrow phase (SAT)
5. Resolve contacts with **impulses**, restitution and friction
6. Structure a C++ project with **CMake**, unit tests and a separate visual viewer

---

## Motivation

This engine is the first link in a chain of projects:

| # | Project | Role |
|---|---|---|
| 1 | **Hamilton** | Rigid-body physics engine (this repository) |
| 2 | **Quadrotor simulator** | 6-DOF drone dynamics built on top of Hamilton |
| 3 | **Model Predictive Control** | Controller for the simulated quadrotor |

The goal is to understand the dynamics a robot's controller relies on, not just to call a library that hides them.

---

## Roadmap

Each milestone counts as done only when it has a passing test or a reproducible measurement.

| # | Milestone | Validation | Status |
|---|---|---|:---:|
| 1 | **Math core**: `Vec3`, `Mat3`, `Quaternion` | Unit tests checked against Eigen as a reference oracle | ☐ |
| 2 | **Integrators**: explicit Euler, semi-implicit Euler, RK4 | Energy drift compared on a harmonic oscillator over 10⁴ steps | ☐ |
| 3 | **Rigid-body rotation**: inertia tensor, Euler's equations, quaternion orientation | Angular momentum conserved in torque-free motion; Dzhanibekov effect reproduced | ☐ |
| 4 | **Collision detection**: sphere, box and plane; AABB broad phase, SAT narrow phase | Tests on known configurations | ☐ |
| 5 | **Contact resolution**: impulses with restitution and friction | A stable stack of boxes | ☐ |
| 6 | **Quadrotor dynamics** | Continued in a separate repository | ☐ |

---

## Repository Structure

```
.
├── README.md
├── CMakeLists.txt                   # root build: library, tests, viewer
├── hamilton/                        # the engine, built as a static library
│   ├── include/hamilton/
│   │   ├── math/                    # vec_3, math_3 (Mat3), quaternion
│   │   ├── dynamics/                # rigid_body, integrator, world
│   │   └── collision/               # shape, broad_phase, narrow_phase, contact_solver
│   └── src/                         # implementations, same layout as include/
├── test/                            # GoogleTest unit tests, Eigen as reference
│   ├── math/                        # test_vec3, test_math3, test_quaternion
│   └── dynamics/                    # test_integrator
└── viewver/                         # raylib 3D viewer to watch the simulation
    └── main.cpp
```

---

## Getting Started

### Requirements

- A C++17 compiler (`clang` or `gcc`) and CMake 3.20+
- [Eigen](https://eigen.tuxfamily.org) (tests only): `brew install eigen` on macOS, `libeigen3-dev` on Debian/Ubuntu
- [GoogleTest](https://github.com/google/googletest) and [raylib](https://www.raylib.com) are downloaded automatically by CMake

### Installation

```bash
git clone https://github.com/SamutourR115/hamilton-physics.git
cd hamilton-physics
cmake -S . -B build
cmake --build build
```

### Usage

```bash
ctest --test-dir build     # run the unit tests
./build/viewer/viewer      # open the 3D viewer
```

---

## Demo

*Coming with the first completed milestone.*

---

## References

- D. Baraff, A. Witkin, *Physically Based Modeling* (SIGGRAPH course notes): <https://www.cs.cmu.edu/~baraff/sigcourse/>
- G. Fiedler, *Integration Basics* (Gaffer on Games): <https://gafferongames.com/post/integration_basics/>
- E. Catto, Box2D publications: <https://box2d.org/publications/>
- A. Chou, *Game Physics Series*: <https://allenchou.net/game-physics-series/>
- codecrafters-io, *Build your own X: Physics Engine*: <https://github.com/codecrafters-io/build-your-own-x#build-your-own-physics-engine>

---

## AI Use

I use AI as a learning assistant: to explain concepts, discuss design trade-offs and review documentation. All source code in this repository is written by me.

---

## Author

**Sam**, BSc student in Computer Science (Intelligent Systems), University of Liège
[GitHub](https://github.com/SamutourR115) · [LinkedIn](https://www.linkedin.com/in/samuel-mastroscianni-395b6126b)

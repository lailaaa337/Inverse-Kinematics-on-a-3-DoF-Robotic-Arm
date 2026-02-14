# 🤖 4-DOF Robotic Arm – Forward & Inverse Kinematics

## 📌 Project Overview

This project presents the modeling, mathematical analysis, and simulation of a **4-DOF robotic manipulator**.  
The system integrates forward kinematics, inverse kinematics, transformation matrices, and gripper simulation.

The project combines theoretical robotics concepts with practical implementation using MATLAB and CoppeliaSim.

---

## 🎥 Project Demo

<video width="800" controls>
  <source src="ProjectDemo.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

> ⚠️ Make sure `ProjectDemo.mp4` is uploaded in the root of this repository.

---

## 👩‍💻 Team Members

- Laila Tarek  
- Miran Samer  
- Mariam Eladawy  
- Abduallah Nizar  

---

## 🦾 Robot Configuration (DH Parameters)

| Joint | θ (Theta) | d | a | α (Alpha) |
|-------|-----------|---|---|-----------|
| 1 | θ₁ | 0 | 0 | +90° |
| 2 | θ₂ | 0 | L₁ | 0 |
| 3 | θ₃ | 0 | L₂ | 0 |
| 4 | θ₄ | 0 | L₃ | 0 |

---

## 📐 Forward Kinematics

The end-effector Cartesian position is computed as:

```math
X = cos(θ1) [L2 cos(θ2) + L3 cos(θ2+θ3) + L4 cos(θ2+θ3+θ4)]

Y = sin(θ1) [L2 cos(θ2) + L3 cos(θ2+θ3) + L4 cos(θ2+θ3+θ4)]

Z = L1 + L2 sin(θ2) + L3 sin(θ2+θ3) + L4 sin(θ2+θ3+θ4)
```

These equations determine the spatial position of the robot's end-effector.

---

## 🔄 Full Transformation Matrices

The homogeneous transformation sequence is:

```text
T1 = Rot(Z, θ1) * Rot(X, 90°)
T2 = Rot(Z, θ2) * Trans(L1, 0, 0)
T3 = Rot(Z, θ3) * Trans(L2, 0, 0)
T4 = Rot(Z, θ4) * Trans(L3, 0, 0)

T_total = T1 * T2 * T3 * T4
```

This produces the complete transformation from base frame to end-effector frame.

---

## 🔁 Inverse Kinematics

Inverse kinematics was implemented using:

- MATLAB
- Robotics System Toolbox

The toolbox was used to:
- Compute joint angles for a desired end-effector position
- Validate workspace reachability
- Simulate robotic motion

---

## ✋ Gripper System

### Simulation Environment

The robotic arm and gripper were simulated using **CoppeliaSim**.

The gripper control includes:

- Open/close mechanism  
- Object grasping operations  
- Real-time stability testing  

### Benefits of Simulation

Using CoppeliaSim allowed us to:

- Visualize interaction between gripper and objects  
- Test grasp stability in real time  
- Debug control algorithms safely  
- Prevent hardware damage before real deployment  

---

## 🛠 Tools & Technologies

- MATLAB  
- Robotics System Toolbox  
- CoppeliaSim  
- Denavit-Hartenberg Modeling  
- Forward & Inverse Kinematics  

---

## 📊 Learning Outcomes

- Understanding DH parameter modeling  
- Deriving transformation matrices  
- Implementing inverse kinematics solutions  
- Simulating robotic manipulation systems  
- Designing and testing a robotic gripper  

---

## 🚀 Future Improvements

- Trajectory planning algorithms  
- Real hardware implementation  
- Vision-based object detection  
- Path optimization techniques  

---

## 📂 Repository Structure

```
📁 Project Files
 ├── MATLAB Code
 ├── CoppeliaSim Scene
 ├── ProjectDemo.mp4
 └── README.md
```

---

### ⭐ If you found this project interesting, feel free to star the repository!
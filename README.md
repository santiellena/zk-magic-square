# Zero Knowledge Magic Square

## Introduction
After reading module 1 and 2 of the [ZK Book](https://www.rareskills.io/zk-book) from RareSkills, I decided to write some circuits to prove my practical knowledge of Circom and Groth16 SNARK. This is just one small step in the long road ahead for me to master zero knowledge proofs.

Here you will see a Circom implementation of a circuit that proves that a magic square is known. From zero to verifing the proof on chain, I will guide you to take the steps explaining not only the practical aspects but also some theory so we know what we are doing. 

Hope you find this repository helpful in your ZK journey.

## Context and problem
The intention of this problem is simple, I want to prove that I know the solution of a magic square but of course, this is ZK!, without revealing the actual solution to the verifier or anybody having the proof.

At this point you might be thinking... what in the world is a magic square??

A **magic square** is an \( n \times n \) grid of distinct numbers where the sum of each **row, column, and both diagonals** is the same **magic sum**. The magic sum is given by the formula:  

\[
\text{Magic Sum} = \frac{n(n^2 + 1)}{2}
\]

For example, in a **3×3 magic square**:  

\[
\begin{bmatrix} 
8 & 1 & 6 \\ 
3 & 5 & 7 \\ 
4 & 9 & 2 
\end{bmatrix}
\]

Each row, column, and diagonal sums to **15**.

As you see, it is pretty straightforward and easy, but it has enough maths to serve its learning purpose. I just don't want to write circuits that help me prove that I know the solution of an equation because it is a common example (see [Vitalik's blog post](https://medium.com/@VitalikButerin/quadratic-arithmetic-programs-from-zero-to-hero-f6d558cea649))

## Set Up

In order to keep this document brief (as much as I can), the step-to-step explanation of what needs to be installed and the commands to do it is all in the [setup](setup.md) file.

## Introduction

We already defined the problem we want to solve (the constrains) and the maths behind it. In the following sections, we will go step-to-step exposing the theory and reasons behind each step.

First, we will write a Circom circuit to then compile it converting it to a R1CS (Rank One Constrain System). Then, as we will use the Groth16 zk-SNARK protocol, we need to generate a trusted setup and contribute to it (super cool thing). Finally, we will generate some proofs to verify them on our terminal and also **on-chain** using our own smart contract writen in Solidity.
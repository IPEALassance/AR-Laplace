# AR(p) model with multiple Asymmetric Laplace noise functions

## About
This is a project with the objective of using different (systematically wrong) estimates of the same unknown quantity (that varies through time) to derive a probability distribution of said quantity. Thus, it is essentially a Bayesian analysis.

## Model structure
The probability model is mainly composed of two structures:
1. The external structure, which relates the estimates and the true value at a given time. There is an assumption that each estimating method follows an Asymmetric Laplace distribution. If there was no systematic error (no asymmetry component), such method would have the true value of the quantity as its mean.
2. The latent structure, which describes the evolution of the true quantity through time. Here, the assumption is that such evolution is done through an AR(p) process.

## References
. KOTZ, S.; KOZUBOWSKI, T. J.; PODGÓRSKI, K. *The Laplace Distribution and Generalizations: A Revisit with Applications to Communications, Economics, Engineering, and Finance.* 1. ed. Birkhäuser Basel, 2001.

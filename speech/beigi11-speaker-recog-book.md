Beigi, H
Fund of Speaker Recog
2011

# Inro

## 1.3 Speaker recognition modalities

### 1.3.1 Text-dependent speaker recognition

Hi, my name is Werner Brandes.

### 1.3.2 Text-independent speaker recognition

# Parameter estimation

## 10.2 Maximum A-Posteriori (MAP) Estimation

# 11 Unsup clus and learn

### 11.3.1 Expectatioin Maximization

11.3.1.3 MAP

# 12 Transformation

## 12.4 Linear Discriminant Analysis
## 12.5 Factor Anal p404

~y = V \Theta + e (12.50)

V: factor loading mx, its elements are the _factor loadings_
\Theta: vector of common factors
e: vector of specific factors, the error or the residual vector

y_n = \mu + V \Theta_n + \Lambda r_n (12.58)

\mu: sample mean
\Lambda: diag

FA is a generalization of PCA (p406 -1)

To extimate V and \Lambda: ML or MAP <-- EM (11.3.1)

# 13 HMM

## 13.7 GMM

supervector eq 13.40

# 16 Speaker modelling

## 16.1 Individual speaker modelling

-2. bekezdés: miért kell ubm (training) + enrollment
adaptation e.g. MAP

## 16.2 Background models and cohorts
## 16.4 Speaker adaptation p530
### 16.4.1 Factor anal
### 16.4.2 Joined Factor anal

\mu_n^(s) = \mu + V \Theta_n + \Lambda r_n 
\mu_n(c) = \mu_n^(s) + U x\_{n,c}

c: index over channels

### 16.4.3 Total Factors

y_n = \mu + V \Theta_n

\Theta_n: total variability

# 17 Speaker recognition

## 17.1 The enrollment

# Signal enhancement and compensation

## 18.5 Speaker model normalization

### 18.5.1 Z-norm
### 18.5.2 T-norm

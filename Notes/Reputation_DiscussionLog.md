# Reputation Project — Discussion Log

**Last updated:** 2026-03-05
**Paper:** "When Transparency Backfires: Strategic Obfuscation and Financial Fragility"
**Authors:** Jun Aoyagi (HKUST) & Yuki Sato (Keio University)

---

## Active Tasks

| ID | Task | Status |
|----|------|--------|
| T1 | Introduction optimization | ⏸ Deferred |
| T2 | Endogenous opacity: numerical computation + figure + implications | 🔄 In progress |

---

## T2: Endogenous Opacity — Numerical Results

### Model Setup

The manager chooses fund opacity $\omega_\eta$ to solve:

$$\max_{\omega_\eta} \; U = \phi(1+\theta)\,\mathbb{E}[\pi] - C(\omega_\eta)$$

where $C(\omega_\eta) = c\,\omega_\eta^\gamma$ is the obfuscation cost, and

$$\mathbb{E}[\pi] = \frac{\beta\,\omega_u}{\beta^2\omega_u + \omega_s}\,\omega_s.$$

The expected utility in the presence of a sunspot shock ($\rho_H = \Pr(\text{high-}\beta)$, $\rho_L = 1 - \rho_H$) is:

$$u_{\text{av}}(\omega_\eta) = \rho_L \cdot U(z_{\min}) + \rho_H \cdot U(z_{\max})$$

where $z \equiv \beta^2 \omega_s / \omega_u$ indexes the equilibrium type.

**Key thresholds:** $\omega_L$ and $\omega_H$ are the opacity levels at which the number of equilibria changes:

- $\omega_\eta < \omega_L$: unique high-$\beta$ equilibrium
- $\omega_L \leq \omega_\eta \leq \omega_H$: multiple equilibria (both $\beta_L$ and $\beta_H$)
- $\omega_\eta > \omega_H$: unique low-$\beta$ equilibrium

### Parameters Used for Figure

| Parameter | Value | Note |
|-----------|-------|-------|
| $\phi$ | 0.030 | fee rate |
| $n$ | 5 | number of investors |
| $\omega_u$ | 5.0 | noise trader variance |
| $c_s$ | $10^{-4}$ | obfuscation cost level |
| $\gamma$ | 1.85 | obfuscation cost curvature |
| $\rho_L = r$ | 0.9 | probability of low-$\beta$ equilibrium |

Implied thresholds: $\omega_L \approx 60.9$, $\omega_H \approx 70.1$, $\theta \approx 25.9$

### Figure: Optimal Opacity vs. Average Skill

**File:** `Figures/fig_opacity_search_r09.pdf`

The figure has three panels, each focusing on one transition:

| Panel | $\omega_s$ range | What it shows |
|-------|-----------------|---------------|
| (A) Low Average Skill | $[0,\; \omega_{s1} \times 1.35]$ | $\omega_e^*$ rises from 0, jumps to $\omega_L$ at $\omega_{s1} \approx 0.137$ |
| (B) Intermediate Average Skill | $[\omega_{s1}{\times}1.02,\; \omega_{s2}{\times}1.35]$ | $\omega_e^*$ near $\omega_L$, jumps to $\omega_H$ at $\omega_{s2} \approx 0.412$ |
| (C) High Average Skill | $[\omega_{s2}{\times}1.02,\; \omega_{s2}{\times}200]$ | $\omega_e^*$ flat at $\omega_H$, then increases above $\omega_H$ for large $\omega_s$ |

Ratio $R = \omega_{s2}/\omega_{s1} \approx 3.0$ (original parameters had $R \approx 17$).

### Parameter Search Summary

Searched over $\phi \in [0.005, 0.1]$, $n \geq 2$, $\omega_u > 0$, $c_s > 0$, with $\rho = 0.9$ fixed.
**Objective:** minimize $R = \omega_{s2}/\omega_{s1}$ (balance between Phase A and Phase B ranges).

Top candidates ranked by $R$:

| $\phi$ | $n$ | $\omega_u$ | $\omega_L$ | $\omega_H$ | $\omega_{s1}$ | $\omega_{s2}$ | $R$ |
|--------|-----|-----------|-----------|-----------|-------------|-------------|-----|
| 0.030 | 5 | 5.0 | 60.91 | 70.13 | 0.1282 | 0.4028 | 3.14 |
| 0.025 | 3 | 5.0 | 61.10 | 70.46 | 0.1848 | 0.6073 | 3.29 |
| 0.030 | 8 | 5.0 | 64.27 | 76.15 | 0.1315 | 0.6201 | 4.71 |

**Best candidate chosen:** $\phi=0.030$, $n=5$, $\omega_u=5.0$

### Open Issue: Phase C Flat Region

A second ratio $R_2 = \omega_{s3}/\omega_{s2}$ was discussed, where $\omega_{s3}$ is the point at which $\omega_e^*$ starts increasing above $\omega_H$ in Phase C.

With the chosen parameters: $\omega_{s3} \approx 20$, $\omega_{s2} \approx 0.41$, so $R_2 \approx 50$.

An extended search (varying $\phi$, $n$, $\omega_u$) found that **$R_2 \geq 30$ appears to be a structural lower bound** for this model with $\gamma = 1.85$. The best achievable was $R_2 \approx 33$ at $\phi=0.040$, $n=15$, $\omega_u=10$.

**Conjecture:** This may be a fundamental property of the model — the Phase C flat region ($\omega_e^* = \omega_H$) is a corner solution driven by the continuous marginal condition, which naturally kicks in at a much higher $\omega_s$ than the discrete Phase B→C jump (which is driven by comparing utility levels at $\omega_L$ vs. $\omega_H$). **This might in fact be an interesting model prediction worth discussing, rather than a limitation.**

---

## T2: Implications Discussion

*Based on reading `02_MainBody/024_EndogenousOpacity.tex` (draft, 2026-03-05)*

### What's Already Well-Written

The **"Opacity as Commitment Device"** subsection is solid. The logic is:

1. Showing-off motive → manager trades aggressively → reveals too much information → lowers $\mathbb{E}[\pi]$
2. Manager uses opacity $\omega_\eta$ to dampen investor responsiveness to $f$
3. This "ties her hands" and forces profit-driven rather than flow-driven trading
4. Corollary: even investors prefer opaque funds ex-ante (since $U_i \propto \mathbb{E}[\pi]$)

### What Needs Development

The **"Equilibrium Opacity"** subsection is currently a skeleton (numbered list). Key points to develop:

#### Point 1 — Global monotonicity

$\omega_e^*$ is globally increasing in $\omega_s$. The mechanism:

- Higher $\omega_s$ → larger informational advantage → larger profit margin to protect
- The benefit of opacity (improving $\mathbb{E}[\pi]$ by suppressing showing-off) scales with $\sqrt{\omega_s}$
- Hence the marginal benefit of obfuscation outweighs marginal cost at higher $\omega_s$, leading to more opacity

#### Point 2 — The jumps (why they're discontinuous)

**Jump A at $\omega_{s1}$:** Manager moves from unique high-$\beta$ regime to multiple-equilibria regime by choosing $\omega_\eta = \omega_L$.

- Below $\omega_{s1}$: $\omega_e^* < \omega_L$ → 100% high-$\beta$ equilibrium
- At $\omega_{s1}$: manager becomes indifferent between $\omega_e^* \lesssim \omega_L$ and $\omega_e^* = \omega_L$
- Just above $\omega_{s1}$: manager strictly prefers $\omega_e^* = \omega_L$, because entering the multiple-equilibria region gives $\rho_L = 90\%$ probability of the profitable low-$\beta$ equilibrium — a discrete improvement in expected utility

**Jump B at $\omega_{s2}$:** Manager moves from multiple-equilibria regime to unique low-$\beta$ regime by choosing $\omega_\eta = \omega_H$.

- The residual 10\% probability of high-$\beta$ is eliminated entirely
- The cost (higher opacity) is worth paying at sufficiently high $\omega_s$

The discontinuity of both jumps arises because the number of equilibria changes discretely at $\omega_L$ and $\omega_H$, creating kinks in the utility function $u_{\text{av}}(\omega_\eta)$.

#### Point 3 — Implications for Skill, Opacity, and Fragility

**The key non-monotonicity:** opacity and fragility are *not* monotonically related.

| Region | $\omega_e^*$ range | Equilibrium type | Fragility |
|--------|-------------------|-----------------|-----------|
| Low skill ($\omega_s < \omega_{s1}$) | $\omega_e^* < \omega_L$ | Unique high-$\beta$ | Stable (but inefficient) |
| Medium skill ($\omega_{s1} < \omega_s < \omega_{s2}$) | $\omega_L \leq \omega_e^* \leq \omega_H$ | Multiple equilibria | **Fragile** |
| High skill ($\omega_s > \omega_{s2}$) | $\omega_e^* > \omega_H$ | Unique low-$\beta$ | Stable (and efficient) |

**Paradox:** Highly skilled managers choose *more* opacity, yet they are *less* fragile. It is managers with *intermediate* skill who operate in the fragile multiple-equilibria zone.

**Policy implication:** Regulations that force opacity downward (i.e., push $\omega_e$ below $\omega_H$) could move skilled managers from the safe unique low-$\beta$ region into the fragile multiple-equilibria region, *increasing* fragility.

**Testable implications** (already mentioned in draft):

- Fund opacity should be positively correlated with manager skill across the cross-section
- The distribution of fund opacity should show clustering/discontinuities at $\omega_L$ and $\omega_H$
- Very opaque skilled funds should exhibit more profit-driven (Kyle-like) trading styles
- Intermediate-opacity funds (in the multiple-equilibria zone) exhibit flow-chasing behavior and are fragile

#### Point 4 — Phase C Flat Region as a Model Prediction

For $\omega_s \in (\omega_{s2}, \omega_{s3})$, $\omega_e^* = \omega_H$ exactly (corner solution). This is not a numerical artifact — it means:

- Even after escaping the multiple-equilibria zone, the manager doesn't push opacity further until $\omega_s$ is sufficiently large
- Once $\omega_s > \omega_{s3}$, the continuous interior optimum dominates and $\omega_e^*$ increases smoothly above $\omega_H$
- The ratio $R_2 = \omega_{s3}/\omega_{s2} \gg 1$ appears structural to the model

This may actually be **an interesting prediction in itself**: the transition from "staying at the edge of the fragile zone" ($\omega_e^* = \omega_H$) to "pushing further into the safe zone" ($\omega_e^* > \omega_H$) requires a substantially higher skill level.

---

## Notation Consistency Check (Flag)

The figure caption uses $\rho_H = 0.10$ (probability of high-$\beta$ equilibrium). In the numerical code, `r = 0.9` is the weight on the **low-$\beta$** equilibrium (i.e., $r = \rho_L$). These are consistent ($\rho_H = 1 - r = 0.1$), but worth double-checking the labeling in code vs. paper to avoid confusion.

---

## Next Steps for T2

- [ ] Develop numbered list in `024_EndogenousOpacity.tex` into prose
- [ ] Discuss whether $R_2 \gg 1$ is a limitation or a feature to discuss in the paper
- [ ] Finalize figure (confirm parameter values match caption: $\phi=0.03$, $n=5$, $\omega_u=5$, $\rho_H=0.10$)
- [ ] Write "Skill, Opacity, and Fragility" subsubsection

## Next Steps for T1

- [ ] Introduction optimization (deferred)

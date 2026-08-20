# Investor Information Set Variations

Baseline: investors condition on $f=x_{A,1}+\eta$. We now replace $f$ by (i) $g\equiv y_{A,1}+\xi=x_{A,1}+u_{A,1}+\xi$, $\xi\sim N(0,\sigma_\xi^2)$, and (ii) $\{g,f\}$ jointly. Throughout, $\rho=\sigma_u/\sigma_s$, $\kappa=\sigma_\eta/\sigma_u$, $z=\beta/\rho$, and define $\kappa_\xi=\sigma_\xi/\sigma_u$. $\lambda=\lambda_{A,1}$, $\sigma_A$ and the manager's $t=2$ trading/pricing rules are **unchanged** (the market maker for $A$ still conditions only on $\{y_{A,1},y_{A,2}\}$). Only the $\theta$-term in the manager's $t=1$ FOC — coming from $\mathrm{E}[\sum_k\pi_{k,2}\mid \text{investor signal}]$ — changes. As in the baseline, write this term's contribution to the objective as $\theta\frac{\sigma_u}{2}\Phi\, x_{A,1}^2$ with $\Phi=\gamma_B^2/\sigma_s+\gamma_A^2/\sigma_A$, where $\gamma_B$ is the loading of $\mathrm{E}[s\mid\cdot]$ and $\gamma_A$ the loading of $\mathrm{E}[s-\lambda y_{A,1}\mid\cdot]$ on $x_{A,1}$ (after replacing the manager's own $\beta s$ by her control $x_{A,1}$, since noise terms drop out of the FOC). Redoing the algebra that produced $\theta=G(z)$ in the baseline shows the identity

$$\theta=\frac{A(z)}{z(z^2+1)^2\sigma_u\rho\,\Phi(z)},\qquad A(z)=z^4-1+z\sqrt{z^2+1},$$

holds **for any** information structure (it only uses $\lambda,\sigma_A$, which are unaffected). So the whole analysis reduces to computing $\Phi(z)$ for each case.

## (i) Investors observe $g=y_{A,1}+\xi$

**Key lemma.** $s-\lambda y_{A,1}$ is the market maker's own $t=1$ pricing residual, hence by the projection theorem it is uncorrelated with $y_{A,1}$, and therefore (jointly Gaussian) independent of $y_{A,1}$. Since $g=y_{A,1}+\xi$ with $\xi$ independent of everything, $s-\lambda y_{A,1}\perp g$. Thus $\mathrm{E}[(s-\lambda y_{A,1})^2\mid g]=\mathrm{Var}(s-\lambda y_{A,1})=\sigma_A^2$, a **constant**: $\gamma_A\equiv0$ for every $\sigma_\xi\ge0$, including $\sigma_\xi=0$. Investors who only see (a garbled version of) the order flow can never learn more about future $A$-mispricing than the market maker already impounds in the price — the entire flow-performance feedback through fund $A$'s own quadratic profit term disappears.

Only the $B$-channel survives: $\gamma_B=\gamma_{new}=\beta\sigma_s^2/(\beta^2\sigma_s^2+\sigma_u^2+\sigma_\xi^2)$, i.e. in $z$ units $\gamma_{new}=z/[\rho(z^2+1+\kappa_\xi^2)]$. Plugging $\Phi=\gamma_{new}^2/\sigma_s$ into the identity above gives

$$\theta=G_i(z;\kappa_\xi)\equiv\frac{A(z)\,(z^2+1+\kappa_\xi^2)^2}{z^3(z^2+1)^2}.$$

This nests the baseline's denominator structure but the $(1+(z^2+1)^{-3/2})$ factor coming from the $A$-channel is gone, and $\kappa^2$ is replaced by $1+\kappa_\xi^2$ (the "$+1$" is the noise-trader variance $\sigma_u^2$ that $y_{A,1}$ always carries).

**$\sigma_\xi=0$ (investors see $y_{A,1}$ exactly): unique equilibrium always.** Then $G_i(z;0)=A(z)/z^3$. Since $A'(z)z-3A(z)=z^4+3-\dfrac{z(z^2+2)}{\sqrt{z^2+1}}$, and squaring shows $(z^4+3)^2(z^2+1)-z^2(z^2+2)^2=z^{10}+z^8+5z^6+2z^4+5z^2+9>0$ for all $z$ (writing $w=z^2$: $w^5+w^4+5w^3+2w^2+5w+9>0$), we get $A'(z)z-3A(z)>0$ for all $z>0$. Hence $\frac{d}{dz}\ln G_i(z;0)=[A'(z)z-3A(z)]/(zA(z))>0$ on $(z_0,\infty)$ (where $A>0$): $G_i(\cdot;0)$ is strictly increasing from $0$ (at $z_0$) to $\infty$. **For every $\theta>0$ the fixed point is unique** — multiplicity is impossible when investors see the exact order-flow signal, no matter how large $\theta$ is.

**General $\sigma_\xi>0$: multiplicity re-emerges once $\sigma_\xi$ is large enough.** Write $c=\kappa_\xi^2$. A direct computation of $\mathrm{sign}(dG_i/dz)$ (clear denominators of $\ln G_i$'s derivative) shows

$$\mathrm{sign}\,G_i'(z)=\mathrm{sign}\,\Psi(z,c),\qquad \Psi(z,c)=\Psi_0(z)+c\,P(z),$$
$$\Psi_0(z)=(z^2+1)P(z)+4A(z)z^2(z^2+1),\quad P(z)=-3z^6+z^4+7z^2+3-z(5z^2+2)\sqrt{z^2+1},$$

i.e. **linear in $c$**. Since $\Psi(z,0)\propto \Psi_0(z)>0$ for all $z>z_0$ is exactly the $\sigma_\xi=0$ result just proved, $\Psi_0(z)>0$ throughout. If $P(z)\ge0$, $\Psi(z,c)$ stays positive for every $c\ge0$. But $P(2)=-192+16+28+3-2\cdot22\sqrt5=-145-44\sqrt5<0$ exactly. Hence $\Psi(2,c)=\Psi_0(2)-c(145+44\sqrt5)\to-\infty$ as $c\to\infty$, crossing zero at a finite $c^\*(2)=\Psi_0(2)/(145+44\sqrt5)>0$. For any $\kappa_\xi^2>c^\*(2)$, $G_i'(2)<0$: since $G_i(z_0;\kappa_\xi)=0$ and $G_i(z;\kappa_\xi)\to\infty$ as $z\to\infty$ (for any *finite* $\kappa_\xi$, because $(z^2+1+\kappa_\xi^2)^2/(z^2+1)^2\to1$), $G_i$ must rise, then fall through $z=2$, then rise again — a local max followed by a local min, exactly the shape behind Part 2 of the baseline Proposition. Consequently there is a finite threshold $\bar\kappa_\xi=\inf\{\kappa_\xi:G_i(\cdot;\kappa_\xi)\text{ non-monotonic}\}\in(0,\infty)$ such that:

- $\sigma_\xi/\sigma_u\le\bar\kappa_\xi$ (in particular $\sigma_\xi=0$): unique equilibrium for every $\theta$.
- $\sigma_\xi/\sigma_u>\bar\kappa_\xi$: $G_i$ has a local max $G_{i,h}$ and local min $G_{i,l}$; for $\theta\in(G_{i,l},G_{i,h})$ low- and high-$\beta$ equilibria coexist, exactly as in the baseline Proposition but with $\kappa^2$ there replaced by $1+\kappa_\xi^2$ and the extra $(1+(z^2+1)^{-3/2})$ factor removed.

So multiplicity is *monotonically harder* to sustain than in the baseline (it requires $\sigma_\xi$ strictly positive and large), and vanishes entirely in the limit $\sigma_\xi\to0$ — the opposite comparative static from $\sigma_\eta$ in the baseline model, where it is *small* $\sigma_\eta$ (precise self-reports) that gives uniqueness. The reason is economic, not a coincidence of algebra: $f$ is informative about $s$ *net of* the market's own information, while $y_{A,1}$ is not.

## (ii) Investors observe $\{g,f\}$ jointly

Now $s-\lambda y_{A,1}$ need not be orthogonal to $f$ (since $f$ uses an independent noise $\eta$, not derived from $y_{A,1}$), so the $A$-channel reopens. Standard bivariate-normal projection of $(s,u_{A,1})$ on $(f,g)$ gives, after substituting $f=\beta s+\eta,\ g=\beta s+u_{A,1}+\xi$ and discarding the mean-zero noise (irrelevant for the FOC):

$$\gamma_A=\frac{K(\sigma_u^2+\sigma_\xi^2)}{\det},\qquad \gamma_B=\frac{\beta\sigma_s^2(\sigma_u^2+\sigma_\xi^2+\sigma_\eta^2)}{\det},$$
$$K\equiv(1-\lambda\beta)\beta\sigma_s^2=\lambda\sigma_u^2,\qquad \det\equiv(\sigma_u^2+\sigma_\xi^2)(\beta^2\sigma_s^2+\sigma_\eta^2)+\sigma_\eta^2\beta^2\sigma_s^2 .$$

In $z,\kappa,\kappa_\xi$ units, with $\Omega(z)\equiv(1+\kappa_\xi^2)(z^2+\kappa^2)+z^2\kappa^2$:

$$\gamma_A=\frac{z(1+\kappa_\xi^2)}{\rho(z^2+1)\Omega(z)},\qquad \gamma_B=\frac{z(1+\kappa^2+\kappa_\xi^2)}{\rho\,\Omega(z)}.$$

Substituting into the general identity gives the fixed-point function

$$\theta=G_{ii}(z;\kappa,\kappa_\xi)=\frac{A(z)\,\Omega(z)^2}{z^3(z^2+1)^2\left[(1+\kappa^2+\kappa_\xi^2)^2+(1+\kappa_\xi^2)^2(z^2+1)^{-3/2}\right]}.$$

**Limit $\sigma_\xi\to\infty$ recovers the baseline exactly**, confirming the conjecture. As $\kappa_\xi\to\infty$, $\Omega(z)\sim\kappa_\xi^2(z^2+\kappa^2)$, so $\Omega^2\sim\kappa_\xi^4(z^2+\kappa^2)^2$, while $(1+\kappa^2+\kappa_\xi^2)^2\sim\kappa_\xi^4$ and $(1+\kappa_\xi^2)^2\sim\kappa_\xi^4$; the $\kappa_\xi^4$ factors cancel and

$$G_{ii}(z;\kappa,\kappa_\xi)\;\longrightarrow\;\frac{A(z)(z^2+\kappa^2)^2}{z^3(z^2+1)^2\left[1+(z^2+1)^{-3/2}\right]}=G(z),$$

the exact baseline formula — as $g$ becomes pure noise it drops out and investors are left with $f$ alone.

**$\sigma_\xi=0$ does *not* collapse to case (i)'s uniqueness result.** Setting $\kappa_\xi=0$: $\Omega(z)=z^2(1+\kappa^2)+\kappa^2$ and

$$G_{ii}(z;\kappa,0)=\frac{A(z)\left[z^2(1+\kappa^2)+\kappa^2\right]^2}{z^3(z^2+1)^2\left[(1+\kappa^2)^2+(z^2+1)^{-3/2}\right]},$$

which retains the $(z^2+1)^{-3/2}$ term and is *not* proportional to $A(z)/z^3$ — because $f$ still lets investors partially back out the noise-trader shock $u_{A,1}$ from $g=y_{A,1}$ and thereby learn about the market maker's own pricing error, even though $g$ itself carries no extra noise.

**Comparative statics in $\sigma_\xi$.** Holding $z,\kappa$ fixed and writing $x=\sigma_u^2+\sigma_\xi^2$ (so $x\in[\sigma_u^2,\infty)$ as $\sigma_\xi^2$ ranges over $[0,\infty)$), $\det=xV_f+\beta^2\sigma_s^2\sigma_\eta^2$ with $V_f=\beta^2\sigma_s^2+\sigma_\eta^2$, so $\gamma_A=K/(V_f+\beta^2\sigma_s^2\sigma_\eta^2/x)$ is **strictly increasing** in $x$ (the subtracted term shrinks as $x$ grows), while
$$\frac{d}{dx}\Big[\gamma_B/(\beta\sigma_s^2)\Big]=\frac{d}{dx}\frac{x+\sigma_\eta^2}{xV_f+\beta^2\sigma_s^2\sigma_\eta^2}=\frac{-\sigma_\eta^4}{\det^2}<0,$$
so $\gamma_B$ is **strictly decreasing** in $\sigma_\xi^2$. Thus as $\sigma_\xi$ rises from $0$ to $\infty$, the model interpolates monotonically and continuously between the $\sigma_\xi=0$ formula above and the baseline $G(z)$: the destabilizing $A$-channel ($\gamma_A$) strengthens monotonically while the $B$-channel ($\gamma_B$) weakens, so the region of $\theta$ supporting multiple equilibria is (weakly) increasing in $\sigma_\xi$, with the baseline model's multiplicity region as its $\sigma_\xi\to\infty$ upper bound. This is the mirror image of case (i): there, adding the "own-report" channel back in (i.e. moving from $g$ alone toward $\{g,f\}$, or letting $\sigma_\xi\to\infty$ so $f$ dominates) is what *creates* multiplicity; observing $y_{A,1}$ well ($\sigma_\xi$ small) is what removes it.

## Addendum: at $\sigma_\xi=0$, case (ii) is *always* unique (for every $\kappa$)

This is worth stating as a formal claim since it is not the naive guess: although $\gamma_A>0$ once $f$ is added (Section (ii)), the fixed point remains globally monotone at $\sigma_\xi=0$ regardless of $\kappa$ — multiplicity in case (ii) requires $\sigma_\xi$ strictly positive.

**Claim.** $G_{ii}(z;\kappa,0)$ is strictly increasing in $z$ on $(z_0,\infty)$ for every $\kappa\ge0$.

**Proof.** At $\kappa_\xi=0$, $\Omega(z)=n(z)\equiv(1+\kappa^2)z^2+\kappa^2$ and $D(z)\equiv(1+\kappa^2)^2+(z^2+1)^{-3/2}$, so
$$G_{ii}(z;\kappa,0)=\frac{A(z)\,n(z)^2}{z^3(z^2+1)^2 D(z)}.$$
Since $G_{ii}>0$ on $(z_0,\infty)$, its sign of derivative equals the sign of
$$f(z,c)\equiv\frac{d}{dz}\ln G_{ii}=\underbrace{\frac{A'(z)}{A(z)}-\frac3z-\frac{4z}{z^2+1}}_{\text{indep. of }c}+\underbrace{\frac{2n'(z)}{n(z)}}_{h(c)}-\underbrace{\frac{D'(z)}{D(z)}}_{-m(c)},\qquad c\equiv\kappa^2,$$
where $D'(z)=-3z(z^2+1)^{-5/2}$ does not depend on $c$ (only $D$'s level does), and
$$h(c)=\frac{4(1+c)z}{z^2+c(z^2+1)},\qquad m(c)=\frac{3z(z^2+1)^{-5/2}}{(1+c)^2+(z^2+1)^{-3/2}}.$$

*Both $h$ and $m$ are strictly decreasing in $c$ for every $z>0$.* For $h$: writing the denominator as $D_n(c)=z^2+c(z^2+1)$,
$$h'(c)=\frac{4z\big[D_n(c)-(1+c)(z^2+1)\big]}{D_n(c)^2}=\frac{4z\big[z^2-(z^2+1)\big]}{D_n(c)^2}=\frac{-4z}{D_n(c)^2}<0.$$
For $m$: the numerator is independent of $c$ and the denominator $(1+c)^2+(z^2+1)^{-3/2}$ is strictly increasing in $c$, so $m$ is strictly decreasing.

Hence $f(z,c)$ — a $c$-independent term plus two strictly decreasing functions of $c$ — is itself **strictly decreasing in $c$**, for every fixed $z$. Its infimum over $c\ge0$ is therefore its limit as $c\to\infty$. As $c\to\infty$, $h(c)\to 4z/(z^2+1)$ and $m(c)\to0$, so
$$\lim_{c\to\infty}f(z,c)=\frac{A'(z)}{A(z)}-\frac3z-\frac{4z}{z^2+1}+\frac{4z}{z^2+1}-0=\frac{A'(z)}{A(z)}-\frac3z=\frac{A'(z)z-3A(z)}{zA(z)}.$$
This is exactly the quantity already shown positive for all $z>0$ in the $\sigma_\xi=0$, case-(i) proof above (via $(z^4+3)^2(z^2+1)-z^2(z^2+2)^2=w^5+w^4+5w^3+2w^2+5w+9>0$, $w=z^2$).

Therefore, for every $z>z_0$ and every $c=\kappa^2\ge0$,
$$f(z,c)\;>\;\lim_{c\to\infty}f(z,c)\;=\;\frac{A'(z)z-3A(z)}{zA(z)}\;>\;0. \qquad\blacksquare$$

So $G_{ii}(\cdot;\kappa,0)$ is globally increasing for every $\kappa$: **the fixed point is unique for every $\theta>0$ when $\sigma_\xi=0$, no matter how noisy $\eta$ is.** Intuitively, adding $f$ on top of the exact order-flow signal $y_{A,1}$ only ever makes the incentive map *steeper* (both $h$ and the map itself are largest at $c=0$ and decrease toward the already-positive case-(i) floor as $\kappa\to\infty$) — it never flips the sign. The two boundary cases $\kappa=0$ and $\kappa\to\infty$ are each independently monotone (the first coincides with the baseline model at $\kappa=0$, which is always in the unique regime since $0\le H_m$; the second coincides with case (i) at $\sigma_\xi=0$), and the claim shows nothing in between escapes that monotonicity either. Multiplicity in case (ii) is therefore strictly a $\sigma_\xi>0$ phenomenon — and note this is *not* because $\gamma_A=0$ at $\sigma_\xi=0$ here (unlike case (i), $\gamma_A>0$ already at $\sigma_\xi=0$ once $f$ is observed, since $f$ lets investors partially back out $u_{A,1}$ from $y_{A,1}$). The A-channel is active from the start; it is simply that, combined with the rest of the FOC, it is not yet destabilizing until $\sigma_\xi$ pushes the map far enough from the case-(ii)-at-$\sigma_\xi=0$ shape and toward the baseline model's shape.

## Neither channel is essential on its own: A-channel-only, no asset $B$

A natural question is whether the $B$-fund is actually needed to generate multiplicity, or whether multiplicity is really an $A$-channel phenomenon that survives even if asset $B$ is removed from the model altogether (manager trades only $A$, investors see $f$ only, no $g$). Since the $A$-channel term $(1-\lambda\beta)^2\gamma^2/\sigma_A$ never referenced $B$ to begin with, deleting $B$ just deletes the "$1$" (the $B$-channel piece) from the baseline's $\Phi=\gamma^2[1/\sigma_s+(1-\lambda\beta)^2/\sigma_A]$, leaving $\Phi_{A\text{-only}}=\gamma^2(1-\lambda\beta)^2/\sigma_A=(\gamma^2/\sigma_s)(z^2+1)^{-3/2}$. The general identity then gives

$$\theta=G_{A\text{-only}}(z;\kappa)=\frac{(z^2+\kappa^2)^2A(z)}{z^3\sqrt{z^2+1}}.$$

**Claim: for $\kappa$ large enough, $G_{A\text{-only}}$ is non-monotone, so multiplicity survives with $B$ removed entirely.** Writing $c=\kappa^2$,
$$\frac{d}{dz}\ln G_{A\text{-only}}=\frac{4z}{z^2+c}+\frac{A'(z)}{A(z)}-\frac3z-\frac{z}{z^2+1},$$
and $4z/(z^2+c)$ is strictly decreasing in $c$ (derivative $-4z/(z^2+c)^2<0$), from $4/z$ at $c=0$ down to $0$ as $c\to\infty$. So the log-derivative is decreasing in $c$ with infimum $h(z)\equiv A'(z)/A(z)-3/z-z/(z^2+1)$. At $z=2$: $A(2)=15+2\sqrt5$ and $A'(2)\cdot2-3A(2)=19-\tfrac{12\sqrt5}{5}$ (exact), so
$$\frac{A'(2)}{A(2)}-\frac32=\frac{19-\tfrac{12\sqrt5}{5}}{2(15+2\sqrt5)}\approx0.3501,\qquad \frac{z}{z^2+1}\Big|_{z=2}=0.4,$$
giving $h(2)\approx-0.0499<0$. Since $\tfrac{d}{dz}\ln G_{A\text{-only}}$ is continuous and strictly decreasing in $c$ with a negative limit at $z=2$, there is a finite threshold $\bar c$ (numerically $\bar c\approx156$, i.e. $\kappa\approx12.5$) beyond which the derivative at $z=2$ is strictly negative. Combined with $G_{A\text{-only}}(z_0;\kappa)=0$ and $G_{A\text{-only}}(z;\kappa)\to\infty$ as $z\to\infty$ for any finite $\kappa$ (same argument as elsewhere: the $(z^2+\kappa^2)^2/(z^2+1)^{?}$-type ratio is dominated by $A(z)\sim z^4$ eventually), IVT forces a local max before $z=2$ and a local min after — i.e. multiplicity for an intermediate range of $\theta$, exactly as in the two-channel model, but with asset $B$ absent altogether.

**Symmetric fact (already shown above): the $B$-channel alone, with no $A$-channel** (case (i), large $\kappa_\xi$) is *also* independently sufficient for multiplicity.

**Conclusion.** Neither channel is privileged, and neither asset is essential per se. What generates the hump is that (a) the investor signal is genuinely different from what the market maker already prices in, and (b) it is noisy enough — large $\kappa$ for a self-report on $A$, large $\kappa_\xi$ for a garbled order-flow read — that the induced flow-performance loading, itself always Bayesian-shrinkage hump-shaped, interacts unfavorably with the ordinary Kyle cost terms. The two-asset structure of the original model is what makes *both* channels available at once (so multiplicity is easiest to trigger there, over the widest range of $\kappa$), not a requirement for multiplicity to exist at all.

## Single-asset model: only $A$ exists, investors observe $\{g,f\}=\{y_{A,1}+\xi,\,x_{A,1}+\eta\}$

Drop asset $B$ and combine the two extensions: investors see both signals about $A$. The $A$-channel loading $\gamma_A$ from case (ii) is unaffected by $B$'s absence (it never referenced $B$), so $\Phi=\gamma_A^2/\sigma_A$ with $\gamma_A=\dfrac{z(1+\kappa_\xi^2)}{\rho(z^2+1)\Omega(z)}$, $\Omega(z)=(1+\kappa_\xi^2)(z^2+\kappa^2)+z^2\kappa^2$, exactly as derived in case (ii). The general identity gives

$$\theta=G_{A,gf}(z;\kappa,\kappa_\xi)=\frac{A(z)\,\Omega(z)^2}{z^3\sqrt{z^2+1}\,(1+\kappa_\xi^2)^2}.$$

(Check: as $\kappa_\xi\to\infty$, $\Omega\sim\kappa_\xi^2(z^2+\kappa^2)$ so $\theta\to(z^2+\kappa^2)^2A(z)/[z^3\sqrt{z^2+1}]=G_{A\text{-only}}(z;\kappa)$ above, as it should — $g$ becomes worthless and only $f$ is left.)

**The problem collapses exactly to the single-signal case with a harmonic-mean substitution.** Writing $\Omega(z)=A_1z^2+B_1$ with $A_1=(1+\kappa_\xi^2)+\kappa^2$, $B_1=\kappa^2(1+\kappa_\xi^2)$,
$$\frac{d}{dz}\ln G_{A,gf}=\frac{A'(z)}{A(z)}-\frac3z-\frac{z}{z^2+1}+\frac{4A_1z}{A_1z^2+B_1}=h(z)+\frac{4z}{z^2+c'},\qquad c'\equiv\frac{B_1}{A_1}=\left(\frac1{\kappa^2}+\frac1{1+\kappa_\xi^2}\right)^{-1},$$
using $h(z)\equiv A'(z)/A(z)-3/z-z/(z^2+1)$ from the previous section. So $G_{A,gf}(z;\kappa,\kappa_\xi)$ has **exactly the shape of $G_{A\text{-only}}(z;\kappa)$ with $\kappa^2$ replaced by the harmonic ("parallel-resistor") combination** $c'=\kappa^2\parallel(1+\kappa_\xi^2)$. Since a harmonic mean never exceeds either input, $c'\le\min(\kappa^2,\,1+\kappa_\xi^2)$ always.

**Does $\sigma_\xi=0$ work? No — never, for any $\kappa$.** At $\kappa_\xi=0$, $c'=\kappa^2/(\kappa^2+1)\in[0,1)$, strictly below $1$ no matter how large $\kappa$ is. Since $4z/(z^2+c')$ is strictly decreasing in $c'$ (shown earlier), $d/dz\ln G_{A,gf}$ is decreasing in $c'$ and therefore, for every $\kappa$,
$$\frac{d}{dz}\ln G_{A,gf}(z;\kappa,0)\;>\;\lim_{c'\to1^-}\Big[h(z)+\frac{4z}{z^2+c'}\Big]=h(z)+\frac{4z}{z^2+1}=\frac{A'(z)}{A(z)}-\frac3z+\frac{3z}{z^2+1}\;>\;0,$$
where the last inequality holds because $A'(z)/A(z)-3/z>0$ (proved earlier) and $3z/(z^2+1)>0$. So **$G_{A,gf}(\cdot;\kappa,0)$ is globally increasing for every $\kappa$: unique equilibrium always, exactly as in the two-asset case (ii) at $\sigma_\xi=0$.** Adding $f$ to an exact read of $y_{A,1}$ is never destabilizing on its own, with or without asset $B$.

**Does $\sigma_\xi>0$ work? Only if it's large — and $\kappa$ must be large too, simultaneously.** Because $c'\le\min(\kappa^2,1+\kappa_\xi^2)$, no amount of one noise can compensate for a small value of the other: $c'$ is capped by whichever of $\kappa^2,\,1+\kappa_\xi^2$ is smaller. A concrete sufficient threshold, reusing the exact evaluation at $z=2$: $A(2)=15+2\sqrt5$ gives
$$h(2)=\frac{145-74\sqrt5}{410}<0\quad\text{(since }74^2\cdot5=27380>145^2=21025\text{)},$$
so $c'>c^*(2)=\dfrac{3280}{74\sqrt5-145}-4\approx156$ makes $d/dz\ln G_{A,gf}$ negative at $z=2$, forcing (by the same $G(z_0)=0$, $G\to\infty$ argument) a local max/min pair and hence multiplicity for an intermediate range $\theta\in(\theta_l,\theta_h)$ — $\theta_l=G_{A,gf}(z_l),\ \theta_h=G_{A,gf}(z_h)$ at the resulting local min/max, same qualitative structure as the baseline Proposition. Since $c'\le\min(\kappa^2,1+\kappa_\xi^2)$, achieving $c'>c^*(2)\approx156$ **requires both $\kappa^2>156$ and $\kappa_\xi^2>155$** — i.e. $\sigma_\eta/\sigma_u\gtrsim12.5$ *and* $\sigma_\xi/\sigma_u\gtrsim12.4$ together. (The true global threshold, minimizing $c^*(z)$ over $z$, is somewhat lower — numerically near $z\approx1.8$–$1.9$ it is about $142$–$146$ rather than $156$ — but the qualitative conclusion is unchanged: both signals must be simultaneously imprecise.)

**Summary.** In the single-asset model, multiplicity requires *both* investor signals to be individually poor approximations of what they're meant to reveal — a very noisy self-report ($\kappa$ large) *and* a very noisy read of the order flow ($\kappa_\xi$ large) — at the same time. Either signal being sharp (small $\kappa$ or small $\kappa_\xi$, including $\sigma_\xi=0$ exactly) is enough, on its own, to pin the model into the unique-equilibrium regime, because $c'$ is bottlenecked by the more informative of the two signals, not averaged between them.

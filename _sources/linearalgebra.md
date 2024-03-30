# Linear Algebra

We collect here some Linear Algebra concepts that appears here and there in these
notes.

In all the following discussion the symbol $\mathbb{K}$ can be read as either
the set of real numbers $\mathbb{R}$, or $\mathbb{C}$ the set of complex
numbers.

:::{prf:definition}
:label: matrix

An $m \times p$ **matrix** over $\mathbb{K}$ is an $m \times p$
rectangular array $A =
(a_{i,j})_{\substack{i=1,\ldots,m\\j=1,\ldots,p}}$ with entries in
$\mathbb{K}$. The **size** of $A$ is $m\times p$ and $A$ is said
to be square if $m = p$.
:::

Two matrices $A$ and $B$ are said to be equal if they have the same size
and $a_{i,j} = b_{i,j}$ $\forall \,i,j$. We can build
$\mathbb{K}^{m\times p}$ as the set of all the matrices of size
$m\times p$ over the field $\mathbb{K}$ and define an addition and a
scalar multiplication over $\mathbb{K}$ by $A+B \triangleq
(a_{i,j}+b_{i,j})_{i,j}$ and the product with a scalar $c\in\mathbb{K}$
as $c A = (c a_{i,j})_{i,j}$, for all $c \in
\mathbb{K}$.

:::{prf:definition}
:label: products

Let $A = (a_{i,j}) \in \mathbb{K}^{m\times p}$ and let $\mathbf{b}
\in \mathbb{K}^{p\times 1} \equiv \mathbb{K}^{p}$. The *matrix--vector
product* of $A$ and $\mathbf{b}$ is the vector $\mathbf{c}=A\mathbf{b}$
given elementwise by $c_i=
\sum_{j=1}^{p} \mathbf{a}_{i,j} b_j$.

Let $A \in \mathbb{K}^{m\times p}$, $B \in \mathbb{K}^{p\times n}$ we
define the *matrix product* of $A$ and
$B=[\mathbf{b}_{:,1},\ldots,\mathbf{b}_{:,n}]$ as $AB =
[A\mathbf{b}_{:,1},\ldots,A\mathbf{b}_{:,n}]$ and, elementwise as
```{math}
  C=AB, \quad C=(c_{i,j}), \quad c_{i,j}=\sum_{k=1}^p a_{i,k} b_{k,j}.
```
:::

The other operations that are interesting to look at for matrices and vectors
are **norms**. In an *abstract* setting, norms are particular type of
functions obeying the following characterization.

:::{prf:definition}
:label: norm

Let $(V,\mathbb{K})$ be a
vector space with $\mathbb{K} =
\mathbb{R}$ or $\mathbb{C}$ and $f:V\rightarrow \mathbb{R}$ a function
such that

1.  $f(\mathbf{v}) \geq 0$ $\forall \, \mathbf{v} \in V$ and such that
    $f(\mathbf{v}) = 0$ if and only if $\mathbf{v}=\mathbf{0}$;

2.  $f(\alpha \mathbf{v}) = |\alpha|f(\mathbf{v})$,
    $\forall\,\alpha \in\mathbb{K}$, $\forall\, \mathbf{v} \in V$;

3.  $f(\mathbf{v}+\mathbf{w}) \leq f(\mathbf{v})+f(\mathbf{w})$
    $\forall \, \mathbf{v},\mathbf{w} \in V$.

The function $f$ is a *norm* for the vector space $V$. The triple
$(V,\mathbb{K},f)$ is called a *normed space*.

:::

Then examples of such norms for vectors are given by

:::{prf:theorem}
:label: thm:p-norms

Let
$V = \mathbb{C}^n$ or $\mathbb{R}^n$. If $p \geq 1$ we have that
```{math}
\|\mathbf{x}\|_p \triangleq \left(\sum_{i=1}^{n}|x_i|^p\right)^{\frac{1}{p}}, \;\; \forall\, \mathbf{x} \in V,
```
is a norm. Moreover,
```{math}
\|\mathbf{x}\|_{\infty} \triangleq \max_i |x_i| = \lim_{p \rightarrow \infty} \|\mathbf{x}\|_p,
```
is a norm as well.
:::

In general one can define also norm for matrices, e.g.,

:::{prf:definition}
:label: frobenius_norm

Given a matrix $A \in \mathbb{K}^{m \times n}$, with
$\mathbb{K} = \mathbb{R}$ or $\mathbb{C}$, the *Frobenius norm* of $A$
is defined as,
```{math}
\|A\|_F \triangleq \left(\sum_{i=1}^{m} \sum_{j=1}^{n} |a_{i,j}|^2\right)^{\frac{1}{2}}.
```
The matrix norms associated to the
$p$--norms from {prf:ref}`thm:p-norms` can be defined also as
```{math}
\|A\|_p \triangleq \max_{\mathbf{v} \neq \mathbf{0}} \frac{\|A \mathbf{v} \|_p }{\| \mathbf{v} \|_p}.
```
Note that
```{math}
\|A\|_1 \triangleq \max_{1 \leq j \leq n} \sum_{i=1}^m |a_{i,j}|, \quad \|A\|_\infty \triangleq \max_{1 \leq 1 \leq m} \sum_{j=1}^n |a_{i,j}|.
```
:::

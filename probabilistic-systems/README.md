# what's this?

Notes for MIT 6.041: [Probabilistic Systems Analysis and Applied Probability](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-041-probabilistic-systems-analysis-and-applied-probability-fall-2010/index.htm)

I did probability theory and stochastic processes as part of my masters but that was ages ago and haven't done much with it. Thought this might be a good refresher even if it starts from the very basics.

Statistics and probability is everywhere. Just think A/B testing/analytics/data science/ operations monitoring.

# probability models and axioms

## sample space (Ω)
* mutually exclusive
* collectively exhaustive
* trick: right granularity

## event (A)
* subset of the sample space
* probability: assigned to events

## axioms
1. Non-negativity: P(A) ≥ 0
2. Normalization: P(Ω) = 1
3. Additivity: If A ∩ B = Ø, then P(A ∪ B) = P(A) + P(B)

## discrete uniform law
* all outcomes equally likely
* computing probabilities = counting

## continuous uniform law
* computing probabilities = area

## countable additivity axiom
* if A1, A2,... are disjoint events, then:
* P(A1 ∪ A2 ∪ ··· ) = P(A1) + P(A2) + ···

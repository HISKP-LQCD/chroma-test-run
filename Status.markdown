# Status

## Pure Gauge

Pure gauge works just fine:

![](plots/pure-gauge-plaquette.png)
![](plots/pure-gauge-deltaH.png)

## N_f = 2, Pure Wilson

Also works:

![](plots/wilson2-plaquette.png)
![](plots/wilson2-deltaH.png)

## N_f = 2, Clover but without extra even-even term

This should not work, the even-even term of the clover is missing. The fermions
are simulated using `CONSTDET`. It should not work. The results look kind of
sensible, though:

![](plots/partial_clover2-plaquette.png)
![](plots/partial_clover2-deltaH.png)

I don't have an explanation for this at the moment.

## N_f = 2, Clover with even-even term

Strangely enough, this also works rather good.

![](plots/full_clover2-plaquette.png)
![](plots/full_clover2-deltaH.png)

## N_f = 1, Pure Wilson

Just taking the strange quark without any clover term does not work.

![](plots/wilson1-plaquette.png)
![](plots/wilson1-deltaH.png)

There is probably something off regarding the rational approximation.

## N_f = 2, full clover, stout smearing ×1

Going back to the two flavors which have worked already, I now add the stout
smearing. With ×6 smearing on the small 4 lattice, it did not work. With ×1
smearing, it seems to work somewhat:

![](plots/clover2-stout1-plaquette.png)
![](plots/clover2-stout1-deltaH.png)

## N_f = 2, full clover, stout smearing ×3

That seems to be too much smearing, this does not work nicely any more:

![](plots/clover2-stout1-plaquette.png)
![](plots/clover2-stout1-deltaH.png)

## N_f = 2, full clover, stout smearing ×6

Six times smearing just does not work at all:

![](plots/clover2-stout1-plaquette.png)
![](plots/clover2-stout1-deltaH.png)

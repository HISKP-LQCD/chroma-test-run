# Status of Test Runs

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

### Stout smearing ×1

![](plots/clover2-stout1-plaquette.png)
![](plots/clover2-stout1-deltaH.png)

### Stout smearing ×3

That seems to be too much smearing, this does not work nicely any more:

![](plots/clover2-stout3-plaquette.png)
![](plots/clover2-stout3-deltaH.png)

### Stout smearing ×6

Six times smearing just does not work at all:

![](plots/clover2-stout6-plaquette.png)
![](plots/clover2-stout6-deltaH.png)

## N_f = 1, Remez

2016-11-10

Previously, the rational approximation coefficients have been copied from Tom's
restart script. This is probably not the best idea, they need to be computed
again. I have read that the Remez algorithm is used for that, Chroma
conveniently has that implemented.

In the restart script, the method is still `REMEZ`. So Tom must have supplied
the coefficients by hand somehow.

### Pure Wilson, first test

This is a first test. I have used the following for the action approximation:

    <RationalApprox>
      <ratApproxType>REMEZ</ratApproxType>
      <lowerMin>1.0e-3</lowerMin>
      <upperMax>33</upperMax>
      <numPower>-1</numPower>
      <denPower>2</denPower>
      <degree>16</degree>
    </RationalApprox>

And the following for the force approximation:

    <RationalApprox>
      <ratApproxType>REMEZ</ratApproxType>
      <lowerMin>1.0e-3</lowerMin>
      <upperMax>33</upperMax>
      <numPower>-1</numPower>
      <denPower>2</denPower>
      <degree>14</degree>
    </RationalApprox>

This run had stout ×6 activated. It does not work:

![](plots/wilson1-remez-test1-plaquette.png)
![](plots/wilson1-remez-test1-deltaH.png)

### No Smearing

Without the smearing, it is not as bad as before.

![](plots/wilson1-remez-test2-plaquette.png)
![](plots/wilson1-remez-test2-deltaH.png)

Still there is no sufficient acceptance rate.

### Denominator Power set to 4

Tom had a power of `-1/4` in his script. Perhaps that is really needed although
we just want a single flavor?

![](plots/wilson1-remez-test3-plaquette.png)
![](plots/wilson1-remez-test3-deltaH.png)

It works! I have yet to understand why this works, but at least it works now!

### Add stout smearing ×1

Run this again with ×1 stout smearing. This has worked acceptably before with
the light flavors.

![](plots/wilson1-remez-test4-plaquette.png)
![](plots/wilson1-remez-test4-deltaH.png)

### Adding Clover

The addition of the clover term also works just fine:

![](plots/clover1-remez-plaquette.png)
![](plots/clover1-remez-deltaH.png)

## N_f = 3 with clover, ×1 stout smearing

Everything together works now:

![](plots/clover3-plaquette.png)
![](plots/clover3-deltaH.png)

Problems so far were:

- Too much smearing.
- Wrong coefficients in the rational approximation.

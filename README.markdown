# Chroma Test Run

This is the input file for `hmc`. A first test run should 

Chroma `hmc` input file. It is based on [Carsten's `hmc`
tutorial](http://people.physik.hu-berlin.de/~urbach/lap08/hmc/).

Also it contains snippets from Joo-2008-Guide_to_Writing_Chroma_XML_Files.

## Tasks

### Boundary Conditions

Bartek said that we want twisted boundary conditions. From the source code I
gathered that we need an `int`-array `boundary`, a `Real`-array `phases_by_pi`
and another `int`-array `phases_dir`. I do not want to include pi numerically
as that would certainly introduce rounding errors, perhaps it should be
something like `1.0` in the directions that we want to have the twisted
boundary conditions?

### Hasenbusch Terms

Currently there is only the first Hasenbusch term (with desired mass in the
numerator) and the last Hasenbusch term (without a fraction). One needs to tune
the masses and add more of the terms, if desired. If more terms are added, they
need to be included in the integration at the end.

### Smearing

The stout smearing is configured to six times. One still needs to specify a
sensible value of ρ.

One can add `orthog_dir` to smear in certain directions. Do we need that?

### Inverter

The only inverters with `MULTIGRID` in their name seem to be the
`QOP_CLOVER_MULTIGRID_INVERTER` and the various `QUDA` ones.

### Predictor

Tom's example does not contain predictors. Do we want to use one?

### Trajectory Length

Currently the time step is 0.5 and there are 25 steps. This would give a
trajectory length of 12.5. Shouldn't the trajectory length be in the order of
unity?

### Integrator

There are four “minimal norm“ integrators, They differ in `STS` and `TST`. `S`
stands for action and `T` for the kinetic part, the momentum in the molecular
dynamics time direction. There are also variants with a `DTAU` suffix. Perhaps
one should find out what those are. Tom uses `LCM_STS_MIN_NORM_2` in his
example, so it probably is a sensible choice for us.

### Time Scales

The gauge part is integrated twice in each time step. All fermionic parts are
integrated on the coarsest time scale at the moment. We probably want to
integrate the various Hasenbusch terms on different scales.

### Inline Measurements

Are there any particular things that we want to measure in-line during the HMC?

## Notes

### CONV

We are not sure what `CONV` means in the context of monomials. Casten's guess
is “conventional” which is a good contrast to “ratio”. In Tom's example,
`CONV_CONV` is used for a Hasenbusch term. The usage of `RATIO_CONV_CONV`
should be fine in the Hasenbusch terms.

### Time Lattice Extent

From the various tutorials it seems that the last value in the lattice spacing
is special, that should be time.

<!-- vim: set spell textwidth=79 : -->

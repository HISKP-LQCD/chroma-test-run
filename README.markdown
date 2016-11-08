# Chroma Test Run

This is the input file for `hmc` to run something like a “smoke test”
(switching it on and seeing if smoke comes out).

Chroma `hmc` input file. It is based on [Carsten's `hmc`
tutorial](http://people.physik.hu-berlin.de/~urbach/lap08/hmc/) and a file
provided by Tom. It also contains snippets from
`Joo-2008-Guide_to_Writing_Chroma_XML_Files`.

## Tasks

### Hasenbusch Terms

Currently there is only the first Hasenbusch term (with desired mass in the
numerator) and the last Hasenbusch term (without a fraction). One needs to tune
the masses and add more of the terms, if desired. If more terms are added, they
need to be included in the integration at the end.

### Smearing

The stout smearing is configured to six times. One still needs to specify a
sensible value of ρ.

One can add `orthog_dir` to smear in certain directions. Do we need that?
Without this in the input file, `hmc` outputs:

    Using Default value: orthog_dir = 3, spatial only smearing

### Inverter

The only inverters with `MULTIGRID` in their name seem to be the
`QOP_CLOVER_MULTIGRID_INVERTER` and the various `QUDA` ones.

The various inverters used have different precision, this should perhaps be
unified somehow?

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

### `u0` Parameter in Gauge Action

The `LW_TREE_GAUGEACT` needs another parameter `u0`. I have copied the value
from Tom's script. I haven't understood what this value is for, though.

### Action Approximation

For the strange quark we need to take the square root and have chosen to use a
rational approximation. Tom has used `READ_COEFFS`. For this `hmc` needs a lot
of additional parameters, it seems. I have copied all the coefficients from
Tom's script. The power there is `-1/4` which seems a bit odd. We want a square
root, so it should be `-1/2`, right?

An alternative to `READ_COEFFS` is `REMEZ` which also needs a couple of
parameters.

The same applies to the approximation of the force in `ForceApprox`.

### Running with Multiple Threads

So far this runs with only one thread on my local machine. I have build the
`scalar` version and not the `parscalar` version. From what I understand, the
`parscalar` is for clusters whereas `scalar` is for shared memory workstations.
There is the `-geom px py pz pt` option for `hmc` which apparently does not
magically parallelize to 4 threads when I run it with `hmc … -geom 1 1 1 4` on
my laptop.

We need to know how to run this on a certain number of clusters (MPI like) with
a certain number of threads (OpenMP like) for a test run on a supercomputer.

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

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

## Notes

### CONV

We are not sure what `CONV` means in the context of monomials. Casten's guess
is “conventional” which is a good contrast to “ratio”. In Tom's example,
`CONV_CONV` is used for a Hasenbusch term. The usage of `RATIO_CONV_CONV`
should be fine in the Hasenbusch terms.

<!-- vim: set spell textwidth=79 : -->

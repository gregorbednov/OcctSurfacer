# OcctSurfaces

The OcctSurfacer intersects B-Rep parts and shows a full list of relations in
two possible notations, named and syllogical.

## The idea behind OcctSurfacer

1. Named notation have such possible results to show for each surface pair:

- **Equals**: means two surfaces are completely equal, including their
  orientation; A\B (A substracted to B) is empty as B\A too.

- **Negates**: means surfaces don't leave any substraction results (A\B = B\A =
  empty) but also A and B have different orientation (e.g. a cylinder part side
  surface and a cylinder hole side surface with the same diameters)

- **Included/Includes**: means A\B (or B\A) is empty while B\A (or A\B) is not,
  so B includes A (or A includes B)

- **Crosses**: intersection of A and B is not a surface

- **Intersects**: intersection of A and B is a surface, but A\B and B\A both is
  not empty

- **Irrelates** intersection of A and B is empty

2. Logical notation (AIEO) is a simpler option to show the same thing in classic
   syllogical terms:

- A Includes B = "all A are (has) B" = A "A" "B"
- A Included in B = "all B are (has) A" = A "B" "A"
- A Equals B = "all A are B, and vice versa" = (A "A" "B") and (A "B" "A")
- A Negated B = "No A are B" = E "A" "B" = E "B" "A"
- A Crosses B = "No A are B" = E "A" "B" = E "B" "A"
- A Intersects B = "there's an I subsurface which is a part of A (so A has I),
  and part of B too (so A has I). however, there're subsufaces A1 and B1 which
  are parts of A and B too": (A "A" "I") and (A "B" "I") and (A "B" "B0") and (A
  "A" "A0")

## Usage

To list relations with their names, send a B-Rep filenames list to stdin with
`-named` arg:

```sh
OcctSurfacer -named < brep_filename_list.txt
```

By default, `Irrelates` relations are hidden. To show it too, pass `-irrelates`
after `-named`:

```sh
OcctSurfacer -named -irrelates < brep_filename_list.txt
```

--------------------------------------------------------------------------------

The main objective of OcctSurfacer is *extracting facts*, so to use logical
notation you can pass it without additional arguments:

```sh
OcctSurfacer < brep_filename_list.txt
```

## Building and installation

### nix/NixOS flakes

```sh
nix run "git+https://forgejo.gregorbednov.ru/gregorbednov/OcctSurfacer" -- -named -irrelates
```

### classic build

You need a [OpenCASCADE Techology
OCCT](https://occt3d.com/open-cascade-technology/), CMake, OpenMP (optional),
and C++ compiler.

```sh
cmake -B build -S .
make
./OCCTSurfacer # to run it
make install # or to install it
```

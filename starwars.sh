#!/bin/bash

set -euo pipefail

declare idx=0

while read line; do
	echo "$(( idx++))" > starwars
	git add starwars
	git commit -m ":: $line" starwars
done < <(tac <<EOF
A long time ago, in a galaxy far,
far away....

It is a period of civil war.
Rebel spaceships, striking
from a hidden base, have won
their first victory against
the evil Galactic Empire.

During the battle, rebel
spies managed to steal secret
plans to the Empire's
ultimate weapon, the DEATH
STAR, an armored space
station with enough power to
destroy an entire planet.

Pursued by the Empire's
sinister agents, Princess
Leia races home aboard her
starship, custodian of the
stolen plans that can save
her people and restore
freedom to the galaxy....
EOF
)

git rm -- starwars
git commit -m "::"

#lang forge/bsl 


sig Person {spouse: lone Person}
--run { all p1,p2: Person | p1.spouse = p2.spouse implies p2.spouse}
run { some p: Person | p.spouse}

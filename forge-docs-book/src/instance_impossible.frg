#lang forge/bsl 

abstract sig Grade {} 
one sig A, B, C, None extends Grade {} 
sig Course {} 
sig Person { 
    grades: func Course -> Grade,
    spouse: lone Person 
}

pred wellformed { 
    all p: Person | p != p.spouse 
    all p1,p2: Person | p1 = p2.spouse implies p2 = p1.spouse
}

example selfloopNotWellformed is {wellformed} for {
    Person = `Tim + `Nim 
    Course = `CSCI1710 + `CSCI0320
    A = `A   B = `B   C = `C   None = `None 
    Grade = A + B + C + None

    -- this violates wellformed
    `Tim.spouse = `Tim 
    
    -- but this violates the sig definition that "grades" is a total function
    -- from courses to grades; there's no entry for `CSCI0320.
    `Tim.grades = (`CSCI1710) -> B
    
}
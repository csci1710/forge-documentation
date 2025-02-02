#lang forge/bsl

sig Course {}
sig Intro, Intermediate, UpperLevel extends Course {} 

pred wellformed {}

example someIntro is {wellformed} for {
    Intro = `CSCI0150
    Course = `CSCI0150
}
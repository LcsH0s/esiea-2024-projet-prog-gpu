# Rapport de projet : Programmation GPU
DE CASTRO Lucas
LATEB Samy

## Introduction
La premiere etape de notre projet, une etape absolument cruciale mais egalement complexe, fut de choisir un bon algorithme de depart qui ne soit a la fois pas trop complexe a "CUDA-iser" mais qui soit egalement suffisament interessant a implementer en CUDA afin que la difference de vitesse de calcul soit significative.

Pour cela, nous avons un peu au hasard decide de partir de tres simple, c'est a dire de la page wikipedia sur la definition des algorithmes paralleles. Dans cet article etait notamment mentionne l'existence de certains algorithmes tellement efficaces quand ils etaient parallelises que cela en etait "emabarassant" ([Embarrassingly parallel](https://en.wikipedia.org/wiki/Embarrassingly_parallel)).

Dans cette liste, un des premiers choix fut notamment l'integrations de polynomes en utilisant par exemple la methode relativement simple de la regle du trapeze qui nous permet de calculer numeriquement une aproximation d'une integrale d'a peu pres n'importe quelle fonction polynomiale.

NB: faire attentions aux limites et valeurs interdites des fonctions considerees sur les intervales considieres
# Projet Programmation GPU

*Par DE CASTRO Lucas et LATEB Samy*

## Introduction

Dans ce notebook, nous présentons une solution de calcul numérique d'intégrales optimisée en utilisant CUDA (Compute Unified Device Architecture), une plateforme de calcul parallèle développée par NVIDIA. Notre objectif est de tirer parti de la puissance de calcul massive offerte par les GPU, offrant ainsi des gains significatifs en termes de temps d'exécution par rapport aux approches séquentielles traditionnelles sur CPU.

Nous élaborerons d'abord une version de notre programme en C++ classique afin de pouvoir le comparer à notre implémentation CUDA par la suite, mais également pour montrer la logique de calcul de nos intégrales.

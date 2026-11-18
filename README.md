\# INF3610 — Laboratoire 2



\*\*Polytechnique Montréal — Automne 2026\*\*



\*\*Cours :\*\* INF3610 — Systèmes embarqués



\*\*Équipe :\*\* 7



\## Description



Ce projet porte sur la conception et l'intégration d'accélérateurs matériels pour la multiplication de matrices (GEMM) sur la carte FPGA PYNQ-Z2.



Le laboratoire utilise Vitis HLS, Vivado et Vitis Unified IDE 2025.2 pour explorer différentes architectures matérielles, intégrer des coprocesseurs au processeur ARM et comparer les performances des implémentations logicielles et matérielles.



\## Environnement de développement



\- \*\*Carte :\*\* PYNQ-Z2 (Zynq-7020)

\- \*\*FPGA :\*\* xc7z020clg400-1

\- \*\*Outils :\*\* Vitis HLS 2025.2, Vivado 2025.2 et Vitis Unified IDE 2025.2

\- \*\*Langages :\*\* C, C++, Tcl

\- \*\*Système d'exploitation :\*\* Windows



\## Architectures étudiées



| Architecture | Description | État |

|---|---|---|

| Float32-A | Multiplication matricielle 42 × 42 en virgule flottante 32 bits | Validée sur PYNQ-Z2 |

| Int8-A | Multiplication matricielle 180 × 180 avec entiers 8 bits | À réaliser |

| Float32-B | Architecture supplémentaire prévue pour la partie 2 | À réaliser |

| Int4-A | Multiplication avec entiers 4 bits | À réaliser |



\## Structure du projet



```text

INF3610\_Lab2/

├── sources/                 # Code source HLS et logiciel

├── hls\_A\_float32\_algo/      # Exploration architecturale Float32-A

├── hls\_A\_float32\_interface/ # Interface AXI du coprocesseur

├── platform\_float32\_A/      # Plateforme Vitis

├── app\_float32\_A/           # Application ARM

├── vivado/                  # Projets Vivado

├── implementation\_systeme/  # Fichiers matériels exportés

├── tcl/                     # Scripts de conception

├── resultats/               # Rapports, captures et mesures

└── rapport/                 # Rapport du laboratoire

```



Les fichiers générés automatiquement par les outils AMD peuvent être exclus du dépôt Git. Il peut donc être nécessaire de régénérer certains fichiers localement.



\## Partie 1 — Float32-A



\### Exploration HLS



Quatre solutions architecturales ont été étudiées :



1\. Sans optimisation.

2\. Pipeline sur la boucle L2.

3\. Pipeline avec partitionnement complet des tableaux.

4\. Pipeline avec partitionnement des tableaux par blocs.



Les performances et les ressources matérielles ont été analysées à partir des rapports de synthèse HLS.



\### Intégration matérielle



Le coprocesseur HLS a été intégré dans Vivado avec un processeur ARM Cortex-A9, un contrôleur AXI DMA et les interconnexions AXI.



Le système a été synthétisé et implémenté sur le FPGA de la PYNQ-Z2.



\### Résultats expérimentaux



La multiplication matricielle Float32-A a été validée sur la carte PYNQ-Z2 avec une matrice de dimension 42 × 42.



| Mesure | Résultat |

|---|---:|

| Nombre de tests | 1 000 |

| Exécution logicielle ARM | 386 375 cycles |

| Exécution matérielle DMA + FPGA | 9 376 cycles |

| Facteur d'accélération | \*\*41,207×\*\* |

| Validation fonctionnelle | SW and HW results match! |



Ces résultats proviennent de l'application exécutée sur la PYNQ-Z2.



\## Partie 2 — Int8-A



Cette partie consiste à explorer trois solutions architecturales pour la multiplication de matrices 180 × 180 en utilisant les types `int8\_t`, `int16\_t` et `int32\_t`.



Les étapes comprennent l'exploration HLS, la création des interfaces AXI, l'intégration Vivado et la validation sur PYNQ-Z2.



\## Collaboration



Ce dépôt permet aux membres de l'équipe 7 de partager le code source, les configurations, les rapports de synthèse et les résultats du laboratoire.



\## Rapport



Le rapport du laboratoire est disponible dans le dossier `rapport/`.


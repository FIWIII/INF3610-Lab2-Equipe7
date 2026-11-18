
# INF3610 — Laboratoire 2

**Polytechnique Montréal — Automne 2026**

**Cours :** INF3610 — Systèmes embarqués  
**Équipe :** 7

## Description

Ce projet porte sur la conception et l'intégration d'accélérateurs matériels pour la multiplication de matrices (GEMM) sur la carte FPGA PYNQ-Z2.

Le laboratoire utilise Vitis HLS, Vivado et Vitis Unified IDE 2025.2 pour explorer différentes architectures matérielles, intégrer des coprocesseurs au processeur ARM et comparer les performances des implémentations logicielles et matérielles.

## Environnement de développement

- **Carte :** PYNQ-Z2 (Zynq-7020)
- **FPGA :** xc7z020clg400-1
- **Outils :** Vitis HLS 2025.2, Vivado 2025.2 et Vitis Unified IDE 2025.2
- **Langages :** C, C++, Tcl
- **Système d'exploitation :** Windows

## Architectures étudiées

| Architecture | Description | État |
|---|---|---|
| Float32-A | Multiplication matricielle 42 × 42 en float32 | Terminée |
| Int8-A | Multiplication matricielle 180 × 180 en int8_t | À réaliser |
| Float32-B | Architecture supplémentaire de la partie 2 | À réaliser |
| Int4-A | Multiplication matricielle en précision 4 bits | À réaliser |

## Structure du projet

```text
INF3610_Lab2/
├── sources/                  # Codes sources HLS et logiciels
├── hls_A_float32_algo/       # Exploration HLS Float32-A
├── hls_A_float32_interface/  # Interface AXI Float32-A
├── platform_float32_A/       # Plateforme Vitis
├── app_float32_A/            # Application ARM
├── vivado/                   # Projets Vivado
├── implementation_systeme/   # Exportations matérielles
├── tcl/                      # Scripts Tcl
├── resultats/                # Rapports de synthèse et captures
└── rapport/                  # Rapport du laboratoire
```

## Partie 1 — Float32-A

### Exploration architecturale HLS

Quatre solutions ont été étudiées :

1. **Solution 1 :** sans optimisation.
2. **Solution 2 :** pipeline sur la boucle L2.
3. **Solution 3 :** pipeline et partitionnement complet des tableaux.
4. **Solution 4 :** pipeline et partitionnement des tableaux par blocs.

### Intégration Vivado

Le coprocesseur HLS a été intégré dans un système Zynq comprenant :

- Un processeur ARM Cortex-A9.
- Un contrôleur AXI DMA.
- Des interfaces AXI4-Stream et AXI4-Lite.
- Un AXI Timer.
- Les interconnexions AXI nécessaires.

Le système a été synthétisé, implémenté et programmé sur la carte PYNQ-Z2.

### Utilisation des ressources FPGA

| Ressource | Utilisée | Disponible | Utilisation |
|---|---:|---:|---:|
| LUT | 14 845 | 53 200 | 27,90 % |
| LUTRAM | 693 | 17 400 | 3,98 % |
| FF | 19 942 | 106 400 | 18,74 % |
| BRAM | 49 | 140 | 35,00 % |
| DSP | 212 | 220 | 96,36 % |

### Résultats expérimentaux

La multiplication matricielle Float32-A a été validée sur la PYNQ-Z2 avec des matrices de dimension 42 × 42.

| Mesure | Résultat |
|---|---:|
| Nombre de tests | 1 000 |
| Exécution logicielle ARM | 386 375 cycles |
| Exécution DMA + FPGA | 9 376 cycles |
| Facteur d'accélération | **41,207×** |
| Validation | SW and HW results match! |

Le coprocesseur matériel permet une accélération mesurée d'environ **41,2 fois** par rapport à l'exécution logicielle sur ARM dans les conditions du test.

## Partie 1 — Int8-A

Cette architecture utilisera des matrices de dimension 180 × 180 et les types numériques suivants :

- `int8_t` : représentation des opérandes.
- `int16_t` : représentation des produits.
- `int32_t` : accumulation des résultats.

Trois solutions HLS seront explorées avant l'intégration du coprocesseur dans Vivado et sa validation sur la PYNQ-Z2.

**État :** à réaliser.

## Partie 2 — Architectures supplémentaires

Les architectures Float32-B et Int4-A seront étudiées dans la deuxième partie du laboratoire.

**État :** à réaliser.

## Rapport et résultats

Le dossier `rapport/` contient le rapport du laboratoire.

Le dossier `resultats/` contient les rapports de synthèse HLS, les captures Vivado et les résultats expérimentaux.

## Collaboration

Ce dépôt est utilisé par l'équipe 7 pour partager les fichiers du laboratoire 2, documenter les résultats et faciliter le développement collaboratif.


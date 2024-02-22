# MSPR

## Table des Matières

- [À Propos](#about)
- [Commencer](#getting_started)
- [Installation](#installation)
- [Contribution](#contribution)

## À Propos <a name = "about"></a>

C'est un projet visant à mettre en relation des particuliers et des botanistes dans le but de s'entraider mutuellement dans la garde de plantes. Les particuliers peuvent partager leurs besoins en matière de garde de plantes et recevoir des conseils avisés des botanistes, tandis que ces derniers peuvent offrir leur expertise pour aider les particuliers à prendre soin de leurs plantes. L’Objectif pour nous, développeur est de concevoir l’application mobile en respectant les contraintes de technologies et de temps.

## Commencer <a name = "getting_started"></a>

Ces instructions vous permettront d'obtenir une copie du projet en fonctionnement sur votre machine locale à des fins de développement et de test.

### Prérequis

Assurez-vous d'avoir installé Java, Flutter et Git sur votre machine.

## Installation <a name = "installation"></a>

### Cloner le Repo

Pour faire marcher ce projet, vous allez avoir besoin de cloner deux repo. La partie BACK et FRONT du projet sont séparées. Exécutez ces deux commandes dans votre terminal :

```
Pour le FRONT : git clone https://github.com/EstebanBouts/MSPR.git

Pour le BACK : git clone https://github.com/Potowai/MSPR1-BACK.git
```

### Prérequis

Une fois le BACK et le FRONT récupérés, il faut comment par lancer le BACK sur un terminal de commandes pour avoir accès à notre API. Pour commencer aller à ce chemin dans le BACK : MSPR1-BACK\back\target\ et lancer cette commande : java -jar spring-boot-web.jar.

Aller sur votre répertoire d'installation de Flutter à ce chemin : flutter\packages\flutter_tools\lib\src\web . Ouvrez le chrome.dart qui se trouve à ce chemin et aller à la ligne 208 pour mettre en commentaires : --disable-extensions', et ajouter à la place '--disable-web-security',.

### RUN

Pour lancer le projet, il faut run le fichier "main.dart" qui se trouve dans front/lib/main.dart. Vous avez également besoin d'un device android pour lancer l'application. Personnellement, nous utilisons le "Pixel 7 Pro API 26".

## Contribution <a name = "contribution"></a>

Esteban BOUTS-BONHOMME
Alexis FIOLLEAU
Mathéo BERREZ

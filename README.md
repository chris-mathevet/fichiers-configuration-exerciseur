# Auteur

MATHEVET Chris  
Stagiaire au LIFO dans le cadre de la fin de BUT 2 à l'IUT d'Orléans. 
mathevet.chris@gmail.com 

# Explications

Ce dépôt git permet de stocker les différents fichiers de configurations nécessaires pour l'application "Exerciseur" utilisée par le LIFO dans le cadre de recherche et à l'IUT d'Orléans dans un but pédagogique.

**Remarque**: les fichiers pour Kubernetes sont des débuts, comme expliqué avec mon rapport de stage, il faudra changer l'exerciseur pour utiliser Knative au lieu d'OpenFaas et donc modifier ces fichiers de configurations.

# Répertoires

## Yaml

Contient les fichiers de configurations nécessaires au déploiement de stack docker (docker swarm) pour l'exerciseur.  
Contient également un fichier `local_dev.sh` pour créer les 3 stacks docker.

**ATTENTION**, il faut modifier le fichier `traefik.yaml` en y inscrivant une adresse email à la ligne **23**.

Vous pouvez également modifier la ligne **24**, en précisant un autre chemin pour le fichier `acme.json`, le répertoire doit exister, vous devrez également modifier la partie à gauche des `:` dans la définition des volume ligne **37**.

**ATTENTION**, il faut modifier `pcap-api.yaml` pour inscrire le nom de domaine souhaité. Il faut modifier "<DomainName>" présentes au lignes **108** (pcap-nginx) et **152** (pcap-rtd).

## Archives_volumes

Fichiers compressés pour pcap-api, postgress et readthedocs disponibles ici : https://drive.google.com/drive/folders/1jECw9rZmCGjETjN6i6rIu5rENtEGNsES?usp=sharing

Contient des archives `.tar` contenant les fichiers nécessaires aux différents volumes / stockage NFS.

Pour le répertoire "nginx", il faut configurer le serveur NFS (ou autre) pour que ce répertoire soit accessible sur l'ensemble des machines, mais il ne faut pas créer de volume docker.

Il est utilisé simplement en volume-bind pour le fichier de configuration.

Potentiellement modifier la ligne **120** de votre fichier pcap-api.yaml en fonction d'où le fichier nginx.conf sera placé.

#!/bin/bash

# Récupérer le pourcentage d'espace libre de la partition racine /
available_space=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

# Vérifier si l'espace libre est inférieur à 15%
threshold_space=15

if [ "$available_space" -lt "$threshold_space" ]; then
    echo "Attention : l'espace libre sur / est inférieur à $threshold_space% !"
    echo "Espace disponible actuel : $available_space%"
    # Vous pouvez ajouter d'autres actions ici, comme envoyer un email
    # echo "L'espace disque est bas" | mail -s "Alerte espace disque" votre_email@example.com
fi

# Compter le nombre de processus
process_count=$(ps -e | wc -l)

# Vérifier s'il y a plus de 400 processus démarrés
threshold_processes=400

if [ "$process_count" -gt "$threshold_processes" ]; then
    echo "Attention : le nombre de processus actifs est supérieur à $threshold_processes !"
    echo "Nombre de processus actuels : $process_count"
    # Vous pouvez ajouter d'autres actions ici, comme envoyer un email
    # echo "Trop de processus actifs" | mail -s "Alerte processus" votre_email@example.com
fi

# Compter le nombre d'utilisateurs connectés
user_count=$(who | awk '{print $1}' | sort | uniq | wc -l)

# Vérifier s'il y a plus de 3 utilisateurs différents connectés
threshold_users=3

if [ "$user_count" -gt "$threshold_users" ]; then
    echo "Attention : plus de 3 utilisateurs différents sont connectés !"
    echo "Nombre d'utilisateurs connectés : $user_count"
    # Vous pouvez ajouter d'autres actions ici, comme envoyer un email
    # echo "Trop d'utilisateurs connectés" | mail -s "Alerte utilisateurs" votre_email@example.com
fi

# Récupérer le pourcentage d'espace RAM libre
available_ram=$(free -m | awk 'NR==2 {print $4/$2 * 100}' | cut -d. -f1)

# Vérifier si moins de 20% de RAM libre
threshold_ram=20

if [ "$available_ram" -lt "$threshold_ram" ]; then
    echo "Attention : moins de $threshold_ram% de RAM libre !"
    echo "Espace RAM disponible actuel : $available_ram%"
    # Vous pouvez ajouter d'autres actions ici, comme envoyer un email
    # echo "Peu de RAM disponible" | mail -s "Alerte RAM" votre_email@example.com
fi

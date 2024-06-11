#!/bin/bash

available_space=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
threshold_space=15

if [ "$available_space" -lt "$threshold_space" ]; then
    echo "Attention : l'espace libre sur / est inférieur à $threshold_space% !"
    echo "Espace disponible actuel : $available_space%"
fi

process_count=$(ps -e | wc -l)
threshold_processes=400

if [ "$process_count" -gt "$threshold_processes" ]; then
    echo "Attention : le nombre de processus actifs est supérieur à $threshold_processes !"
    echo "Nombre de processus actuels : $process_count"
fi

# Compter le nombre d'utilisateurs connectés
user_count=$(who | awk '{print $1}' | sort | uniq | wc -l)

# Vérifier s'il y a plus de 3 utilisateurs différents connectés
threshold_users=3

if [ "$user_count" -gt "$threshold_users" ]; then
    echo "Attention : plus de 3 utilisateurs différents sont connectés !"
    echo "Nombre d'utilisateurs connectés : $user_count"
fi

available_ram=$(free -m | awk 'NR==2 {print $4/$2 * 100}' | cut -d. -f1)
threshold_ram=20

if [ "$available_ram" -lt "$threshold_ram" ]; then
    echo "Attention : moins de $threshold_ram% de RAM libre !"
    echo "Espace RAM disponible actuel : $available_ram%"
fi

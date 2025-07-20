#!/bin/bash

# Script de test avec menu de choix
while true; do
    echo "Veuillez choisir une option :"
    echo "a) Option A"
    echo "b) Option B" 
    echo "c) Option C"
    read -p "Votre choix (a/b/c) : " choix
    
    case $choix in
        a|A)
            echo "Vous avez choisi l'option A"
            # Remplacez cette ligne par votre commande
            echo "Exécution de la commande A..."
            break
            ;;
        b|B)
            echo "Vous avez choisi l'option B"
            # Remplacez cette ligne par votre commande
            echo "Exécution de la commande B..."
            break
            ;;
        c|C)
            echo "Vous avez choisi l'option C"
            # Remplacez cette ligne par votre commande
            echo "Exécution de la commande C..."
            break
            ;;
    esac
done

echo "Script terminé."
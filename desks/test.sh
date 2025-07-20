while true; do
    read -p "Host new site ? (y/n) : " choix
    case $choix in
        y|Y)
            echo "new site"
            ;;
        n|N)
            echo "stop"
            break
            ;;
    esac
done
# while true; do
#     read -p "Votre choix (a/b/c) : " choix
#     case $choix in
#         a|A)
#             echo "Exécution de la commande A..."
#             break
#             ;;
#         b|B)
#             echo "Exécution de la commande B..."
#             break
#             ;;
#         c|C)
#             echo "Exécution de la commande C..."
#             break
#             ;;
#     esac
# done
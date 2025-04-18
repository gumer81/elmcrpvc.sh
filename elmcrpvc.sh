#!/bin/bash
# pequeño script que elimina las carpetas vacias.
# Ruta a la carpeta principal
carpeta_principal="/home/"

# Variable para contar las carpetas eliminadas
total_eliminadas=0

# Bucle para repetir hasta que no se eliminen más carpetas
while true; do
    # Encuentra y elimina las carpetas vacías, guardando el número de eliminadas
    eliminadas=$(find "$carpeta_principal" -type d -empty -delete -print | wc -l)
    
    # Si no se eliminaron carpetas, salimos del bucle
    if [ "$eliminadas" -eq 0 ]; then
        break
    fi

    # Acumulamos el total de carpetas eliminadas
    total_eliminadas=$((total_eliminadas + eliminadas))

    # Mostramos cuántas carpetas fueron eliminadas en esta iteración
    echo "Se eliminaron $eliminadas carpetas vacías."
done

# Mostrar el total de carpetas eliminadas
echo "Total de carpetas eliminadas: $total_eliminadas"

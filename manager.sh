#!/bin/bash
# He arreglado la lógica para soportar commits raíz.
renombrar_commit() {
    local ruta=$1
    local hash=$2
    
    # MI CORRECCIÓN: Verifico si existe el padre antes de rebasear
    if git -C "$ruta" rev-parse --verify "$hash^" >/dev/null 2>&1; then
        TARGET="$hash^"
    else
        echo "He detectado un commit raíz. Usando modo --root."
        TARGET="--root"
    fi
    
    # Preservo mis fechas originales
    git -C "$ruta" rebase -i $TARGET --committer-date-is-author-date
}

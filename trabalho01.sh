#! /bin/bash 

# Função para adicionar entrada
adicionar() {
    clear
    echo "-----------------------------------------"
    echo "ADICIONAR CONTATO"
    echo "Nome: "
    read NOME
    echo "Sobrenome: "
    read SOBRENOME
    echo "Email: "
    read EMAIL
    echo "Telefone: "
    read TELEFONE
    
    VERIFICAR_NOME=`grep -i ${NOME} bd.txt`
    if [[ ${VERIFICAR_NOME} == "" ]]
    then
        echo "${NOME}, ${SOBRENOME}, ${EMAIL}, ${TELEFONE}" >> bd.txt
        echo
        echo "${NOME}, ${SOBRENOME}, ${EMAIL}, ${TELEFONE}" 
        echo "Contato adicionado com sucesso!" 
    else
        echo "Contato já exite!"
    fi
    echo "-----------------------------------------"
}

exibir() {
    clear
    echo "-----------------------------------------"
    echo "EXIBIR AGENDA"
    cat bd.txt
    echo "-----------------------------------------"
}

pesquisar() {
    clear
    echo "-----------------------------------------"
    echo "PESQUISAR CONTATO"
    echo "Digite o nome do contato a ser pesquisado: "
    read NOME_PESQUISADO
    grep -i ${NOME_PESQUISADO} bd.txt
    echo "-----------------------------------------"
}

while true 
do
clear
cat <<! 
----------------------------------------- 
|                                       |                
|            Menu de Usuario            |
|                                       |
|     1 - Adicionar entrada             |
|                                       |
|     2 - Pesquisar na agenda           |
|                                       |
|     3 - Remover entrada               |
|                                       |
|     4 - Editar entrada                |
|                                       |
|     5 - Exibir agenda                 |
|                                       |
|     6 - Sair                          |
|                                       | 
|   Digite sua Opcao :                  |
|                                       |
-----------------------------------------
!
while
tput cup 16 27 ; read opt [ "$opt" = "" ]
do
    : #Comando NULL(Apenas para o loop ocorrer
done
    case $opt in
        1) adicionar;;

        2) pesquisar ;;
        3) 
            clear who ;;
        4) 
            clear who ;;
        5) 
            exibir ;;
        6) 
            clear
            echo Adios Amigo
            exit 0 ;; 
        *) 
            clear
            echo Opcao Invalida! 
            sleep 2 ;;
    esac
        echo Tecle Enter para continuar.
    read 
done
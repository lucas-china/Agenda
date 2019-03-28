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
        echo "Contato já exite, deseja atualizar o contato? S/N "
        read OPT
        if [[ ${OPT} = "S" ]]
        then
            sed -i "/${NOME}/d" bd.txt
            echo "${NOME}, ${SOBRENOME}, ${EMAIL}, ${TELEFONE}" >> bd.txt 
            echo "Contato atualizado com sucesso!"
        else
            echo ""
        fi 
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
    VERIFICAR_NOME = `grep -i ${NOME_PESQUISADO} bd.txt`
    if [[ ${VERIFICAR_NOME} == "" ]]
    then
        echo "Contato não encontrado!" 
    else
        echo "${VERIFICAR_NOME}"
    fi
    echo "-----------------------------------------"
}

editar() {
    clear
    echo "-----------------------------------------"
    echo "PESQUISAR CONTATO"
    echo "Digite o nome do contato a ser editado: "
    read NOME_EDITADO
    VERIFICAR_NOME = `grep -i ${NOME_PESQUISADO} bd.txt`
    if [[ ${VERIFICAR_NOME} == "" ]]
    then
        echo "Contato não encontrado! Deseja adicionar o contato? S/N "
        read OPT
        if [[ ${OPT} = "S" ]]
        then
            adicionar
        else
            echo ""
        fi

    else
        echo "Sobrenome: "
        read SOBRENOME
        echo "Email: "
        read EMAIL
        echo "Telefone: "
        read TELEFONE
        sed -i "/${NOME_EDITADO}/d" bd.tx
        echo "${NOME_EDITADO}, ${SOBRENOME}, ${EMAIL}, ${TELEFONE}" >> bd.txt
    fi
    echo "-----------------------------------------"
}

deletar() {
    clear
    echo "-----------------------------------------"
    echo "Deletar CONTATO"
    echo "Digite o nome do contato a ser deletado: "
    read NOME_DELETADO
    sed -i "/${NOME_DELETADO}/d" bd.txt
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

        3) deletar ;;
        
        4) clear who ;;
        
        5) exibir ;;
        
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
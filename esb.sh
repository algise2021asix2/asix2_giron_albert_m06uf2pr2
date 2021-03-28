#!/bin/bash
clear
case $1 in 
	-e) if (( $# != 3 )) 
		then
			echo "Paràmetres incorrectes"
			exit 2
		fi
		#Comprova si el directori /paperera existeix
		if [[ ! -d ~/paperera ]]
		then
		#Si no exixteix el crea
			mkdir ~/paperera
		fi
		#Comprova si el directori indicat existeix
		if [[ ! -d $3 ]]
		then
			echo "La carpeta indicada no existeix"
		else
			#Comprova si els fitxers amb l'extensió indicada existeixen
			if (( $(ls -A $3/*.$2 2> /dev/null | wc -l) != 0 ))  
			then
				#Mou els fitxers que volem esborra del directori indicat, al directori paperera
				mv $3/*.$2 ~/paperera
				echo "Els fitxers s'han enviat a la paperera correctament"
			else
				echo "Els fitxers amb l'extensió indicada no existeixen"
			fi
		 fi		 
		 ;;	 
	-r) if (( $# != 1 )) 
		then
			echo "Paràmetres incorrectes"
			exit 1
		fi
		if [[ ! -d ~/paperera ]]
		then
			echo "La paperera encara no existeix"
		else
			#Compte els fitxers que hi ha al directori /paperera, en cas d'estar buit no fa falta esborrar
			if (( $(ls -A ~/paperera | wc -l) != 0 ))
			then
				#Buida el contingut del directori paperera
				rm ~/paperera/*
				echo "Paperera buida"
			else
				#Ens indica que la paperea ja es buida, per tant, no hi ha res dins
				echo "Paperera ja es buida"
			fi
		fi
esac
exit 0

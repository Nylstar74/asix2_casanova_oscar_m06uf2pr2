#!/bin/bash
#p08
#Oscar CAsanova
clear



if [[ -e nuevousuario.ldif ]]
then
    echo "Borrando nuevousuario.ldif (antiguo)"
    rm -R nuevousuario.ldif
else
    echo "No existe el fichero nouevousuario.ldif, se creara a continuacióncon los siguietnes datos::"
fi



while [[ true ]]
do
    echo "Numero de usuarios (validos entre 1 y 100) "
    read usuarios
    if ((usuarios >=1 && Tusuarios <= 100))
    then
       while [[ true ]]
       do
          echo "Valor uid per usuaris (minim 5000) "
          read uidNumber
          if ((uidNumber >= 5000))
          then

           for (( contador=0; contador<usuarios; contador++ ))
             do
                  
                echo "dn: uid=usr$uidNumber,cn=UsuarisDomini,ou=UsuarisGrups,dc=fjeclot,dc=net" >> nuevousuario.ldif
                echo "homeDirectory: /home/usr$uidNumber" >> nuevousuario.ldif
               echo "gidNumber: 100" >> nuevousuario.ldif
                echo "objectClass: shadowAccount" >> nuevousuario.ldif
                echo "sn: usr$uidNumber" >> nuevousuario.ldif
                echo "uid:usr$uidNumber" >> nuevousuario.ldif
                echo "loginShell: /bin/bash" >> nnuevousuario.ldif
                echo "objectClass: top" >> nuevousuario.ldif
                echo "objectClass: person" >> nuevousuario.ldif
                echo "objectClass: posixAccount" >> nuevousuario.ldif                    
                echo "cn: usr$uidNumber usr$uidNumber" >> nuevousuario.ldif
                echo "" >> nuevousuario.ldif
                echo "" >> nnuevousuario.ldif
               ((uidNumber++))
            done
            ldapadd -x -W -D "cn=UsuarisDomini,ou=UsuarisGrups,dc=fjeclot,dc=net" -f nousUsuaris.ldif
        
        break;
        fi
            
    done
break;        
fi
    
done





exit 0

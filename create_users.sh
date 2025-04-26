#!/bin/bash

echo "Criando usuários do sistema...."

for user in guest1 guest2 guest3 guest4; do
  useradd "$user" -c "Usuário convidado" -s /bin/bash -m -p "$(openssl passwd -crypt Senha123)"
  passwd "$user" -e
done

echo "Finalizado!!"

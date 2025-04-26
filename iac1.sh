#!/bin/bash

echo "Criando diretórios..."
for dir in /publico /adm /ven /sec; do
  mkdir "$dir"
done

echo "Criando grupos de usuários..."
for group in GRP_ADM GRP_VEN GRP_SEC; do
  groupadd "$group"
done

echo "Criando usuários..."
for user in carlos maria joao; do
  useradd "$user" -m -s /bin/bash -p "$(openssl passwd -crypt Senha123)" -G GRP_ADM
done

for user in debora sebastiana roberto; do
  useradd "$user" -m -s /bin/bash -p "$(openssl passwd -crypt Senha123)" -G GRP_VEN
done

for user in josefina amanda rogerio; do
  useradd "$user" -m -s /bin/bash -p "$(openssl passwd -crypt Senha123)" -G GRP_SEC
done

echo "Especificando permissões dos diretórios...."
declare -A dir_groups=( [/adm]=GRP_ADM [/ven]=GRP_VEN [/sec]=GRP_SEC )

for dir in "${!dir_groups[@]}"; do
  chown root:"${dir_groups[$dir]}" "$dir"
  chmod 770 "$dir"
done

chmod 777 /publico

echo "Fim....."

#!/bin/bash
set -e

echo "===> Ajustando PATH temporário"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

echo "===> Instalando pacotes essenciais"
apt update -y
apt install -y \
  fdisk \
  lvm2 \
  xfsprogs \
  parted \
  cloud-guest-utils \
  curl \
  wget \
  vim

echo "===> Corrigindo PATH permanente para root"
if ! grep -q "/sbin" /root/.profile; then
  echo 'export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' >> /root/.profile
fi

echo "===> Aplicando PATH"
source /root/.profile || true

echo "===> Testando comandos principais"
echo "fdisk: $(command -v fdisk || echo 'ERRO')"
echo "pvcreate: $(command -v pvcreate || echo 'ERRO')"
echo "mkfs.xfs: $(command -v mkfs.xfs || echo 'ERRO')"

echo "===> Versões"
fdisk -v || true
pvcreate --version || true
mkfs.xfs -V || true

echo "===> Ambiente pronto"
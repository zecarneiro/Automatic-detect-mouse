#!/bin/sh
# Autor: José M. C. Noronha
# Data: 07/01/2017

# Deve ir a pasta /dev/input e verificar quantos ficheiros existem com o nome
# mouse, mas antes deve certificar que os ratos externos não estão inseridos.
# E de seguida deve introduzir esse número na variável num_file_mouse.
num_file_mouse="1"

# ==============================================================================
# Tempo usado para fazer as verificações
tempo_do_sleep="10" # tempo em segundos

# ==============================================================================
# O nome do device, ou seja, do Touchpad é obtido através do comando
# "xinput --list" (sem ""). No meu caso chama-se ETPS/2 Elantech Touchpad
device_name="DEVICENAME"

# ============================== Principal =====================================
# Ciclo infinito
while [ 1 ] ; do
  # Vou pesquisar quantos ficheiros existem com o nome "mouse" com o comando
  # find cujo o retorno é um número de ficheiros existentes e armazeno esse
  # número na variavel number_of_mouse
  number_of_mouse=$( find /dev/input/mouse* | wc -l )

  # Vou buscar o ID do device(nesse caso Touchpad), e armazeno esse valor na
  # variavel ID
  ID=$( xinput --list --id-only "$device_name" )

  # Caso o numero que foi armazenado na variavel number_of_mouse fôr maior do
  # que 1 e o Touchpad ainda estiver activo, então, vai desactivar o Touchpad
  if [ $number_of_mouse -gt $num_file_mouse ];
  then
    # Com este comando vou desactivar o device( que neste caso é o Touchpad)
    # que tem o respectivo ID
    xinput disable $ID
  fi

  # Caso o numero que foi armazenado na variavel number_of_mouse fôr menor ou
  # igual a 1, e o Touchpad ainda estiver activo, então, vai activar o Touchpad
  if [ $number_of_mouse -le $num_file_mouse ];
  then
    # Com este comando vou activar o device( que neste caso é o Touchpad)
    # que tem o respectivo ID
    xinput enable $ID
  fi

  # Adormece x segundos
  sleep $tempo_do_sleep
done

#!/bin/bash

function welcome() {
  echo "This is the configuration script to start building HexoLibre."
  echo "Please make sure to have a private key created in order to proceed."
  echo "If you don't have one, create one using i. e. Android Studio"
  echo "Then come back to this script and enter your credentials"
  echo "Note: The keystore must be saved as privatekey.jks"
}

function goodbye() {
  echo "Congratz! Seems that the configuration process was successful."
}

if [ "$1" == "--clearPw" ]; then
  export ENV_HEXOLIBRE_KEYPWD=""
  export ENV_HEXOLIBRE_STOREPWD=""
fi

THE_STOREPWD=""
THE_KEYPWD=""

if [ "$1" == "--gpw" ]; then
  export ENV_HEXOLIBRE_KEYPWD="$2"
  export ENV_HEXOLIBRE_STOREPWD="$3"
fi

if [ "$1" == "nocert" ]; then
  export ENV_HEXOLIBRE_KEYPWD="dummy"
  export ENV_HEXOLIBRE_STOREPWD="dummy"
fi

if [ -z $ENV_HEXOLIBRE_KEYPWD ]; then
  welcome
  echo "First of all the keystore needs to be configured."
  echo -en "\nKeystore password: "
  read -s -p "" THE_STOREPWD
  echo -en "\nKey      password: "
  read -s -p "" THE_KEYPWD
  export ENV_HEXOLIBRE_KEYPWD="$THE_KEYPWD"
  export ENV_HEXOLIBRE_STOREPWD="$THE_STOREPWD"
  echo -en "\n"
  goodbye
fi

echo -en "\n"

echo "Executing makescripts..."

for script in $(ls makescripts/); do
  if [ "$script" != "99cleanup.sh" ]; then source makescripts/$script; fi
done

echo -en "\n"

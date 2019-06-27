#!/bin/bash

source $(dirname "$0")/common.sh "$@"

function main() {

  local menu_choice=$(

    menu --title "Programming Menu" --checklist --separate-output "Install various programming languages support\n[SPACE to select, ENTER to confirm]:" 16 95 8 \
      "C++" "Install support for Linux C/C++ programming in Visual Studio and CLion  " off \
      "DOTNET" "Install .NET Core SDK from Microsoft and optionally install NuGet  " off \
      "GO" "Install the latest Go from Google" off \
      "JAVA" "Install the SDKMan to manage Java SDKs" off \
      "LATEX" "Install TexLive for Latex Support" \
      "NODEJS" "Install Node.js and npm" off \
      "PYTHONPI" "Install Python 3.7 and download and install latest PyPi" off \
      "RUBY" "Install Ruby using rbenv and optionally install Rails" off \
      "RUST" "Install latest version of Rust via rustup installer" off \

  3>&1 1>&2 2>&3)

  if [[ ${menu_choice} == "CANCELLED" ]] ; then
    return 1
  fi

  if [[ ${menu_choice} == *"C++"* ]] ; then
    echo "C++"
    bash ${SetupDir}/cpp-vs-clion.sh "$@"
    exit_status=$?
  fi

  if [[ ${menu_choice} == *"DOTNET"* ]] ; then
    echo "DOTNET"
    bash ${SetupDir}/dotnet.sh "$@"
  fi

  if [[ ${menu_choice} == *"GO"* ]] ; then
    echo "GO"
    bash ${SetupDir}/go.sh "$@"
  fi

  if [[ ${menu_choice} == *"JAVA"* ]] ; then
    echo "JAVA"
    bash ${SetupDir}/java.sh "$@"
  fi

  if [[ ${menu_choice} == *"LATEX"* ]] ; then
    echo "LATEX"
    bash ${SetupDir}/latex.sh "$@"
  fi

  if [[ ${menu_choice} == *"NODEJS"* ]] ; then
    echo "NODE"
    bash ${SetupDir}/nodejs.sh "$@"
  fi

  if [[ ${menu_choice} == *"PYTHONPI"* ]] ; then
    echo "PYTHON"
    bash ${SetupDir}/pythonpi.sh "$@"
  fi

  if [[ ${menu_choice} == *"RUBY"* ]] ; then
    echo "RUBY"
    bash ${SetupDir}/ruby.sh "$@"
  fi

  if [[ ${menu_choice} == *"RUST"* ]] ; then
    echo "RUST"
    bash ${SetupDir}/rust.sh "$@"
  fi


}

main "$@"

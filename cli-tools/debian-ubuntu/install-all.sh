#!/usr/bin/env bash

print_fail() {
  printf '%b' "\033[31m [FAIL] \033[0m$1\n"
}

print_success() {
  printf '%b' "\033[32m [OK] \033[0m$1\n"
}


_is_GNU_linux64(){
  architecture=`uname -p`
  os=`uname -o`
  result=1 #false
  if  [ "${architecture}" == "x86_64" ] && [ "${os}" == "GNU/Linux" ] ; then
    result=0 #true
  fi
  return ${result}
}

_update_packages(){
  echo "Updating Packages"
  sudo apt-get update
  print_success "Packages Updated"
}

# REF: https://pip.pypa.io/en/stable/installing/
_install_pip()
  if ! type "pip3" &> /dev/null; then
    echo "Installing python-pip"
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py --user
    rm get-pip.py
    print_success "python-pip Successfully installed"
  fi


preflight_checks(){
  echo "Verifying System"
  if ! _is_GNU_linux64 ; then
    print_fail "This script works only for GNU/Linux x64 platforms."
    return 1
  fi

  _update_packages
  sudo apt-get install apt-transport-https

  if ! type "curl" &> /dev/null; then
    sudo apt install curl
  fi

  if ! type "python3" &> /dev/null; then
    sudo apt-get install python3
  fi
  print_success "Successfull preflight checks"
}

# REF: https://docs.aws.amazon.com/cli/latest/userguide/awscli-install-linux.html
install_aws_cli(){
  if ! type "aws" &> /dev/null; then
    echo "Installing AWS CLI"
    _install_pip
    pip3 install --user awscli
  fi
  
  aws_version=$(aws --version)
  print_success "AWS CLI Successfully installed"
  printf "Version: ${aws_version}\n\n"
}

# REF: https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
install_gcloud_cli(){
  if ! type "gcloud" &> /dev/null; then
    echo "Installing Google Cloud SDK"
    CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    _update_packages

    sudo apt-get install google-cloud-sdk
  fi

  gcloud_version=$(gcloud --version)
  print_success "Google Cloud SDK Successfully installed"
  printf "Version: ${gcloud_version}\n\n"
}

# REF: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
install_azure_cli(){
  if ! type "az" &> /dev/null; then
    echo "Installing Azure CLI"
    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
      sudo tee /etc/apt/sources.list.d/azure-cli.list

    curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    _update_packages

    sudo apt-get install azure-cli
  fi

  az_version=$(az --version)
  print_success "Azure CLI Successfully installed"
  printf "Version: ${az_version}\n\n"
}

main(){
  preflight_checks
  install_aws_cli
  install_azure_cli
  install_gcloud_cli
}

main

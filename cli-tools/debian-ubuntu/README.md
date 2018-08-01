## Installing CLI tools for GNU/Linux x64 Debian based distros

Follow the instructions below to install a specific CLI.  
If you want to install all (Google Cloud SDK, AWS CLI and Azure CLI) click [here](#Installing-ALL-above).

### Installing Google Cloud SDK
```bash
# REF: https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
echo "Installing Google Cloud SDK"
CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo apt-get update && sudo apt-get install google-cloud-sdk
```

### Installing AWS CLI
You can install the AWS CLI using [pip](https://pypi.org/project/pip/).
```bash
# Getting pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
rm get-pip.py

# REF: https://docs.aws.amazon.com/cli/latest/userguide/awscli-install-linux.html
pip3 install --user awscli
```

### Installing Azure CLI
```bash
# REF: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list

curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli
```

### Installing ALL above
The [install-all.sh](install-all.sh) script installs each CLI above if it not present.
```bash
. install-all.sh 
```

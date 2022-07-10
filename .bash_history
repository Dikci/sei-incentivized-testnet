sudo apt update && sudo apt upgrade -y
sudo apt install curl build-essential git wget jq make gcc tmux htop nvme-cli pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev -y
ver="1.18.1" && wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz" && sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz" && rm "go$ver.linux-amd64.tar.gz" && echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile && source $HOME/.bash_profile && go version
git clone https://github.com/sei-protocol/sei-chain.git && cd sei-chain
git checkout 1.0.6beta
make install
seid version --long | head
seid init Dikci --chain-id atlantic-1
wget -O $HOME/.sei/config/genesis.json ""
sha256sum ~/.sei/config/genesis.json
wget -O $HOME/.sei/config/genesis.json ""
cd && cat .sei/data/priv_validator_state.json
wget -O $HOME/.sei/config/addrbook.json ""
cd sei-chain#
ls -la
cd sei-chain
wget -O $HOME/.sei/config/genesis.json ""
wget -O $HOME/.sei/config/addrbook.json ""
ls -la
cd sei-chain
wget -O $HOME/.sei/config/genesis.json ""
wget -O $HOME/.sei/config/addrbook.json ""
seid config chain-id atlantic-1
sed -i.bak -e "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0.0025usei\"/;" ~/.sei/config/app.toml
external_address=$(wget -qO- eth0.me)
sed -i.bak -e "s/^external_address *=.*/external_address = \"$external_address:26656\"/" $HOME/.sei/config/config.toml
peers=""
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$peers\"/" $HOME/.sei/config/config.toml
seeds=""
sed -i.bak -e "s/^seeds =.*/seeds = \"$seeds\"/" $HOME/.sei/config/config.toml
sed -i 's/max_num_inbound_peers =.*/max_num_inbound_peers = 100/g' $HOME/.sei/config/config.toml
sed -i 's/max_num_outbound_peers =.*/max_num_outbound_peers = 100/g' $HOME/.sei/config/config.toml
wget -qO optimize-configs.sh https://raw.githubusercontent.com/sei-protocol/testnet/main/sei-testnet-2/optimize-configs.sh
sudo chmod +x optimize-configs.sh && ./optimize-configs.sh
sudo systemctl restart seid && sudo journalctl -u seid -f -o cat
pruning="custom" && pruning_keep_recent="100" && pruning_keep_every="0" && pruning_interval="50" && sed -i -e "s/^pruning *=.*/pruning = \"$pruning\"/" $HOME/.sei/config/app.toml && sed -i -e "s/^pruning-keep-recent *=.*/pruning-keep-recent = \"$pruning_keep_recent\"/" $HOME/.sei/config/app.toml && sed -i -e "s/^pruning-keep-every *=.*/pruning-keep-every = \"$pruning_keep_every\"/" $HOME/.sei/config/app.toml && sed -i -e "s/^pruning-interval *=.*/pruning-interval = \"$pruning_interval\"/" $HOME/.sei/config/app.toml
indexer="null" && sed -i -e "s/^indexer *=.*/indexer = \"$indexer\"/" $HOME/.sei/config/config.toml
snapshot_interval="1000" && sed -i.bak -e "s/^snapshot-interval *=.*/snapshot-interval = \"$snapshot_interval\"/" ~/.sei/config/app.toml
SNAP_RPC=
LATEST_HEIGHT=$(curl -s $SNAP_RPC/block | jq -r .result.block.header.height); BLOCK_HEIGHT=$((LATEST_HEIGHT - 1000)); TRUST_HASH=$(curl -s "$SNAP_RPC/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)
echo $LATEST_HEIGHT $BLOCK_HEIGHT $TRUST_HASH
sed -i.bak -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1true| ; \
s|^(rpc_servers[[:space:]]+=[[:space:]]+).*$|\1\"$SNAP_RPC,$SNAP_RPC\"| ; \
s|^(trust_height[[:space:]]+=[[:space:]]+).*$|\1$BLOCK_HEIGHT| ; \
s|^(trust_hash[[:space:]]+=[[:space:]]+).*$|\1\"$TRUST_HASH\"| ; \
s|^(seeds[[:space:]]+=[[:space:]]+).*$|\1\"\"|" $HOME/.sei/config/config.toml
sudo tee /etc/systemd/system/seid.service > /dev/null <<EOF
[Unit]
Description=seid
After=network-online.target

[Service]
User=$USER
ExecStart=$(which seid) start
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload && sudo systemctl enable seid && sudo systemctl restart seid && sudo journalctl -u seid -f -o cat
sudo systemctl daemon-reload && sudo systemctl enable seid && sudo systemctl restart seid && sudo journalctl -u seid -f -o cat
sudo systemctl stop seid && sudo systemctl disable seid && rm /etc/systemd/system/seid.service && sudo systemctl daemon-reload && cd $HOME && rm -rf .sei .sei-chain sei-chain && rm -rf $(which seid)
NODENAME=Dikci
echo "export NODENAME=$NODENAME" >> $HOME/.bash_profile
echo "export WALLET=wallet" >> $HOME/.bash_profile
echo "export CHAIN_ID=atlantic-1" >> $HOME/.bash_profile
source $HOME/.bash_profile
sudo apt-get install make build-essential gcc git jq chrony -y
sudo apt update && sudo apt upgrade -y
ver="1.18.2"
cd $HOME
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
rm "go$ver.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bash_profile
source ~/.bash_profile
cd $HOME
git clone https://github.com/sei-protocol/sei-chain.git && cd $HOME/sei-chain
git checkout 1.0.6beta
make install
seid config chain-id $CHAIN_ID
seid config keyring-backend test
seid init $NODENAME --chain-id $CHAIN_ID
seid keys add $WALLET
WALLET_ADDRESS=$(seid keys show $WALLET -a)
seid add-genesis-account $WALLET_ADDRESS 10000000usei
sudo journalctl -u seid -f -o cat
sudo tee /etc/systemd/system/seid.service > /dev/null <<EOF
[Unit]
Description=seid
After=network-online.target

[Service]
User=$USER
ExecStart=$(which seid) start
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload && sudo systemctl enable seid && sudo systemctl restart seid && sudo journalctl -u seid -f -o cat
wget -O $HOME/.sei/config/addrbook.json ""
cd
wget -O $HOME/.sei/config/addrbook.json ""
wget -O $HOME/.sei/config/addrbook.json ""wget -O $HOME/.sei/config/addrbook.json ""
wget -O $HOME/.sei/config/addrbook.json ""
seid version --long | head
seid init Dikci --chain-id atlantic-1
seid keys add Dikci --recover
seid add-genesis-account <name_wallet> 100000000usei
seid add-genesis-account Dikci 100000000usei
sudo systemctl stop seid && sudo systemctl disable seid && rm /etc/systemd/system/seid.service && sudo systemctl daemon-reload && cd $HOME && rm -rf .sei .sei-chain sei-chain && rm -rf $(which seid)
git clone https://github.com/sei-protocol/sei-chain.git && cd sei-chain
git checkout 1.0.6beta
make install
seid init Dikci --chain-id atlantic-1
seid keys addDikci --recover
seid add-genesis-account Dikci 100000000usei
wget -O $HOME/.sei/config/genesis.json ""
seid config chain-id $CHAIN_ID
seid config keyring-backend test
seid init $NODENAME --chain-id $CHAIN_ID
seid keys add $WALLET --recover
WALLET_ADDRESS=$(seid keys show $WALLET -a)
seid add-genesis-account $WALLET_ADDRESS 10000000usei
sudo systemctl stop seid && sudo systemctl disable seid && rm /etc/systemd/system/seid.service && sudo systemctl daemon-reload && cd $HOME && rm -rf .sei .sei-chain sei-chain && rm -rf $(which seid)
cd
sudo systemctl stop seid && sudo systemctl disable seid && rm /etc/systemd/system/seid.service && sudo systemctl daemon-reload && cd $HOME && rm -rf .sei .sei-chain sei-chain && rm -rf $(which seid)
ls -la
rm /etc/systemd/system/seid.service && sudo systemctl daemon-reload && cd $HOME && rm -rf .sei .sei-chain sei-chain && rm -rf $(which seid)
cd $HOME && rm -rf .sei .sei-chain sei-chain && rm -rf $(which seid)
NODENAME=Dikci
echo "export NODENAME=$NODENAME" >> $HOME/.bash_profile
echo "export WALLET=wallet" >> $HOME/.bash_profile
echo "export CHAIN_ID=atlantic-1" >> $HOME/.bash_profile
source $HOME/.bash_profile
sudo apt update && sudo apt upgrade -y
sudo apt-get install make build-essential gcc git jq chrony -y
ver="1.18.2"
cd $HOME
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
rm "go$ver.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bash_profile
source ~/.bash_profile
cd $HOME
git clone https://github.com/sei-protocol/sei-chain.git && cd $HOME/sei-chain
git checkout 1.0.6beta
make install
seid config chain-id $CHAIN_ID
seid config keyring-backend test
seid init $NODENAME --chain-id $CHAIN_ID
seid keys add $WALLET --recover
WALLET_ADDRESS=$(seid keys show $WALLET -a)
seid add-genesis-account $WALLET_ADDRESS 10000000usei
seid gentx Dikci 100000000usei --chain-id atlantic-1 --commission-rate=0.1 --commission-max-rate=0.2 --commission-max-change-rate=0.1 --pubkey $(seid tendermint show-validator) --moniker "Dikci"
seid gentx $WALLET 10000000usei --chain-id $CHAIN_ID --moniker=$NODENAME --commission-max-change-rate=0.01 --commission-max-rate=0.20 --commission-rate=0.05 --pubkey $(seid tendermint show-validator) --moniker "Dikci"
cat ~/.sei/config/gentx/gentx-*
$HOME/.sei/config/gentx/gentx-XXXXXXXX.json
cd
$HOME/.sei/config/gentx/gentx-XXXXXXXX.json
git remote add origin https://github.com/Dikci/sei-incentivized-testnet.git
echo "# sei-incentivized-testnet" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Dikci/sei-incentivized-testnet.git
git push -u origin main
git push -u origin main
git remote add origin https://github.com/Dikci/sei-incentivized-testnet.git
git branch -M main
git push -u origin main

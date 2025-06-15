# install nerd font
link=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
name=JetBrainsMono.zip

echo "Downloading JetBrainsMono fonts from ${link}..."
wget -O $name $link
echo "Unzipping Font: ${name}..."
mkdir -p ~/.fonts/custom
unzip $name -d ~/.fonts/custom "JetBrainsMonoNerdFont-*.ttf"
fc-cache -fv
echo "Downloaded and unzipped ${name}"
rm $name

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# install zsh plugins (zsh-autosuggestions, zsh-syntax-highlighting)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# activate plugins
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# install starship
curl -sS https://starship.rs/install.sh | sh -s -- --yes
# add starship to zsh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
# create starship config directory
mkdir -p ~/.config
# copy starship.toml 
cp starship.toml ~/.config/starship.toml
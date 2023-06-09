# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Enable MPI Kernel modules
source /etc/profile.d/modules.sh
module load mpi/openmpi-x86_64

# Add cargo applications to path
if ! [[ "$PATH" =~ "$HOME/.cargo/bin" ]]; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi

# Utilize NeoVim as our terminal editor
export EDITOR=/usr/bin/nvim

# Update History File Size
export HISTSIZE=1000000
export HISTFILESIZE=1000000000

export PAGER="less"

# Initialize Starhip
eval "$(starship init bash)"


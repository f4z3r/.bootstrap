#=================================================================================================
#============================================== Path =============================================
#=================================================================================================

if [ -d "$HOME/local/bin/" ]; then
  export PATH="$HOME/.local/bin/:$PATH"
fi

if [ -d "$HOME/nimble/bin" ]; then
  export PATH="$HOME/.nimble/bin:$PATH"
fi

if [ -d "$HOME/cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

export PATH=".:$PATH"

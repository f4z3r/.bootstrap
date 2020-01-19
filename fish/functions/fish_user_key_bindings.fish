function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M insert -m insert \cf accept-autosuggestion
  bind -M default -m default \cf accept-autosuggestion
  bind -M insert -m default fd backward-char force-repaint 
  # commented out because highlighting is broken
  # bind -M visual -m default fd force-repaint
end

{ pkgs, ... }:
{
  programs.tmux = {
    enable = false;
    shortcut = "a";
    baseIndex = 1;
    newSession = false;
    escapeTime = 0;
    clock24 = true;
    keyMode = "vi";

    plugins = with pkgs; [
      tmuxPlugins.continuum
      tmuxPlugins.resurrect
    ];

    extraConfig = ''
      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      set-option -g allow-passthrough on

      set -g status-style 'bg=#333333 fg=#5eacd3'

      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

      # vim-like pane switching
      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      bind-key -r f run-shell "tmux neww ~/.local/bin/tmux-sessionizer"

      set -g @continuum-boot 'on'
      set -g @continuum-restore 'on'
      set -g @resurrect-strategy-nvim 'session'
    '';
  };

  programs.tmate = {
    enable = false;
    # FIXME: This causes tmate to hang.
    # extraConfig = config.xdg.configFile."tmux/tmux.conf".text;
  };
}

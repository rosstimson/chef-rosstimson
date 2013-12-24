#!/usr/bin/env bats

@test "bash is installed / in path" {
  which bash
}

@test "zsh is installed / in path" {
  which zsh
}

@test "less is installed / in path" {
  which less
}

@test "curl is installed / in path" {
  which curl
}

@test "wget is installed / in path" {
  which wget
}

@test "git is installed / in path" {
  which wget
}

@test "make is installed / in path" {
  which make
}

@test "tree is installed / in path" {
  which tree
}

@test "tmux is installed / in path" {
  which tmux
}

@test "rosstimson user exists" {
  getent passwd rosstimson
}

@test "rosstimson user has home directory /home/rosstimson" {
  run getent passwd rosstimson
  echo "$output" | cut -d: -f6 | grep -Eq "/home/rosstimson"
}

@test "rosstimson user has default shell /bin/zsh" {
  run getent passwd rosstimson
  echo "$output" | cut -d: -f7 | grep -Eq "/bin/zsh"
}

@test "/home/rosstimson directory exists" {
  ls -d /home/rosstimson
}

@test "/home/rosstimson directory is owned by rosstimson" {
  run stat -c "%U" /home/rosstimson
  echo "$output" | grep -Eq "rosstimson"
}

@test "/home/rosstimson directory group is rosstimson" {
  run stat -c "%G" /home/rosstimson
  echo "$output" | grep -Eq "rosstimson"
}

@test "dotfiles directory is present" {
  ls -d /home/rosstimson/dotfiles
}

# Test a handful of key dotfiles are symlinked.  I can assume others are
# present too if these are as they are all done with the same Makefile.
@test ".zshrc dotfile is symlinked" {
  [ -h /home/rosstimson/.zshrc ]
}

@test ".zsh dotfile is symlinked" {
  [ -h /home/rosstimson/.zsh ]
}

@test ".vimrc dotfile is symlinked" {
  [ -h /home/rosstimson/.vimrc ]
}

@test ".vim dotfile is symlinked" {
  [ -h /home/rosstimson/.vim ]
}

@test "bin directory is symlinked" {
  [ -h /home/rosstimson/bin ]
}

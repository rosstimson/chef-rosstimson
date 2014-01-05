require 'spec_helper'

describe 'rosstimson::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs bash' do
    expect(chef_run).to install_package('bash')
  end

  it 'installs zsh' do
    expect(chef_run).to install_package('zsh')
  end

  it 'installs less' do
    expect(chef_run).to install_package('less')
  end

  it 'installs curl' do
    expect(chef_run).to install_package('curl')
  end

  it 'installs wget' do
    expect(chef_run).to install_package('wget')
  end

  it 'installs git' do
    expect(chef_run).to install_package('git')
  end

  it 'installs build-essential' do
    expect(chef_run).to install_package('build-essential')
  end

  it 'installs tree' do
    expect(chef_run).to install_package('tree')
  end

  it 'installs tmux' do
    expect(chef_run).to install_package('tmux')
  end

  it 'creates rosstimson user & sets shell + password' do
    expect(chef_run).to create_user('rosstimson')
      .with(shell: '/usr/local/bin/zsh',
            password: '$1$Hv3zo1/O$Q1HsO8bqAhz8EpxVnP1//0')
  end

  it "clones rosstimson's dotfiles with Git" do
    expect(chef_run).to sync_git('/home/rosstimson/dotfiles')
      .with(repository: 'https://github.com/rosstimson/dotfiles.git',
            reference: 'master',
            enable_submodules: true,
            user: 'rosstimson',
            group: 'rosstimson')
  end
end


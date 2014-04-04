require 'spec_helper'

describe 'RC files' do

  describe file('/etc/zsh/zshenv') do
    it { should contain 'DEBIAN_PREVENT_KEYBOARD_CHANGES=yes' }
  end

  describe file('/etc/zsh/zprofile') do
    it { should contain 'source /etc/profile' }
  end

end

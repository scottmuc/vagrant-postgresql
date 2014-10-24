require 'spec_helper'

describe Chef::Sugar::Virtualization do
  it_behaves_like 'a chef sugar'

  describe '#lxc?' do
    it 'returns true when the machine is a linux contianer' do
      node = { 'virtualization' => { 'system' => 'lxc' } }
      expect(described_class.lxc?(node)).to be true
    end

    it 'returns false when the virtual machine is not lxc' do
      node = { 'virtualization' => { 'system' => 'vbox' } }
      expect(described_class.lxc?(node)).to be false
    end

    it 'returns false when the machine is not virtual' do
      node = {}
      expect(described_class.lxc?(node)).to be false
    end
  end

  describe '#vmware?' do
    it 'returns true when the machine is under vmware' do
      node = { 'virtualization' => { 'system' => 'vmware' } }
      expect(described_class.vmware?(node)).to be true
    end

    it 'returns false when the virtual machine is not under vmware' do
      node = { 'virtualization' => { 'system' => 'vbox' } }
      expect(described_class.vmware?(node)).to be false
    end

    it 'returns false when the machine is not virtual' do
      node = {}
      expect(described_class.vmware?(node)).to be false
    end
  end
end

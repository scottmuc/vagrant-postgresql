require 'spec_helper'

describe Chef::Sugar::Docker do
  it_behaves_like 'a chef sugar'

  before(:each) do
    allow(File).to receive(:exist?)
      .with("/.dockerenv")
      .and_return(false)
    allow(File).to receive(:exist?)
      .with("/.dockerinit")
      .and_return(false)
  end

  describe '#docker?' do
    it 'is true when the file /.dockerenv is present' do
      allow(File).to receive(:exist?)
        .with("/.dockerenv")
        .and_return(true)

      node = { 'docker' => nil }
      expect(described_class.docker?(node)).to be true
    end

    it 'is true when the file /.dockerinit is present' do
      allow(File).to receive(:exist?)
        .with("/.dockerinit")
        .and_return(true)

      node = { 'docker' => nil }
      expect(described_class.docker?(node)).to be true
    end

    it 'is false when the node is not on cloud' do
      node = { 'docker' => nil }
      expect(described_class.docker?(node)).to be false
    end
  end
end

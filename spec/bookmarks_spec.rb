require 'bookmarks'

describe Bookmarks do

  describe '.all' do
    it 'returns all bookmarks stored in class' do
      expect(described_class.all).to include 'www.google.com'
      expect(described_class.all).to include 'www.bbc.com'
      expect(described_class.all).to include 'www.twitter.com'
    end
  end

end

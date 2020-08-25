require 'bookmarks'

describe Bookmarks do

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmarks.create(url: 'www.google.com', title: 'Google')
      Bookmarks.create(url: 'www.bbc.com', title: 'BBC')
      Bookmarks.create(url: 'www.twitter.com', title: 'Twitter')

      expect(described_class.all).to include 'www.google.com'
      expect(described_class.all).to include 'www.bbc.com'
      expect(described_class.all).to include 'www.twitter.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmarks.create(url: 'www.mytestsite.com', title: 'Test Site').first

      expect(bookmark['url']).to eq 'www.mytestsite.com'
      expect(bookmark['title']).to eq 'Test Site'
    end
  end

end

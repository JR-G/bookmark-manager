require 'bookmarks'

describe Bookmarks do

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmarks.create(url: 'www.google.com', title: 'Google')
      Bookmarks.create(url: 'www.bbc.com', title: 'BBC')
      Bookmarks.create(url: 'www.twitter.com', title: 'Twitter')

      bookmarks = Bookmarks.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'www.google.com'
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

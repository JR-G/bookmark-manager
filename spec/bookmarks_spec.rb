require 'bookmarks'
require 'database_helpers'

describe Bookmarks do

  describe '.all' do
    it 'returns a list of bookmarks' do
      PG.connect(dbname: 'bookmark_manager_test')

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
      bookmark = Bookmarks.create(url: 'www.mytestsite.com', title: 'Test Site')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Site'
      expect(bookmark.url).to eq 'www.mytestsite.com'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmarks.create(url: 'http://www.website.com', title: 'Website')

      Bookmarks.delete(id: bookmark.id)

      expect(Bookmarks.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'Update a bookmark' do
      bookmark = Bookmarks.create(url: 'http://www.fixthis.com', title: 'Wrong')
      updated_bookmark = Bookmarks.update(id: bookmark.id, url: 'http://www.thisisfixed.com', title: 'Right')

      expect(updated_bookmark).to be_a Bookmarks
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.url).to eq 'http://www.thisisfixed.com'
      expect(updated_bookmark.title).to eq 'Right'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark' do
      bookmark = Bookmarks.create(url: 'http://www.website.com', title: 'Website')

      search_result = Bookmarks.find(id: bookmark.id)

      expect(search_result).to be_a Bookmarks
      expect(search_result.id).to eq bookmark.id
      expect(search_result.url).to eq 'http://www.website.com'
      expect(search_result.title).to eq 'Website'
    end
  end
end

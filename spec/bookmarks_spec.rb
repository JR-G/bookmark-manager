require 'bookmarks'

describe Bookmarks do

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('www.bbc.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('www.twitter.com');")

      expect(described_class.all).to include 'www.google.com'
      expect(described_class.all).to include 'www.bbc.com'
      expect(described_class.all).to include 'www.twitter.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmarks.create(url: 'www.mytestsite.com')

      expect(Bookmarks.all).to include 'www.mytestsite.com'
    end
  end

end

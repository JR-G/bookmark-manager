require 'pg'

class Bookmarks
  def self.all
    con = PG.connect(dbname: 'bookmark_manager')
    result = con.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end
end

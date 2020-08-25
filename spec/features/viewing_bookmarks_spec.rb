feature 'viewing bookmarks' do
  before do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'www.google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'www.bbc.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'www.twitter.com');")
  end
  
  scenario 'user can view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.bbc.com'
    expect(page).to have_content 'www.twitter.com'
  end
end

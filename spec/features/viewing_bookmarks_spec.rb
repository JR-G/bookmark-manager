feature 'viewing bookmarks' do
  before do

    Bookmarks.create(url: 'www.google.com')
    Bookmarks.create(url: 'www.bbc.com')
    Bookmarks.create(url: 'www.twitter.com')
  end
  
  scenario 'user can view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.bbc.com'
    expect(page).to have_content 'www.twitter.com'
  end
end

feature 'viewing bookmarks' do
  before do

    Bookmarks.create(url: 'www.google.com', title: 'Google')
    Bookmarks.create(url: 'www.bbc.com', title: 'BBC')
    Bookmarks.create(url: 'www.twitter.com', title: 'Twitter')
  end
  
  scenario 'user can view bookmarks' do
    visit '/bookmarks'
    expect(page).to have_link 'Google', href: 'www.google.com'
    expect(page).to have_link 'BBC', href: 'www.bbc.com'
    expect(page).to have_link 'Twitter', href: 'www.twitter.com'
  end
end

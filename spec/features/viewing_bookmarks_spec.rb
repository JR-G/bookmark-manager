feature 'viewing bookmarks' do
  scenario 'visiting /bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "www.google.com"
  end
end

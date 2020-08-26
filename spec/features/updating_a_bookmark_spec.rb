feature 'Updating a bookmark' do
  scenario 'User can update a bookmark' do
    Bookmarks.create(url: 'http://www.thisiswrong.com', title: 'Fix this URL')
    visit('/bookmarks')
    expect(page).to have_link('Fix this URL', href: 'http://www.thisiswrong.com')

    first('.bookmark').click_button 'Update'

    expect(current_path).to eq '/bookmarks/1/update'
    fill_in :url, with: 'http://www.thisisright.com'
    fill_in :title, with: 'Fix this URL'
    click_button 'Update'

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('Fix this URL', href: 'http://www.thisisright.com')
  end
end

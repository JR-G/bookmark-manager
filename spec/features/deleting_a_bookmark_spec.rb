feature 'Deleting a bookmark' do
  scenario 'User can delete a bookmark' do
    Bookmarks.create(url: 'http://www.fakeurl.com', title: 'Fake URL')
    visit('/bookmarks')
    expect(page).to have_link('Fake URL', href: 'http://www.fakeurl.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link 'Fake URL', href: 'http://www.fakeurl.com'
  end
end
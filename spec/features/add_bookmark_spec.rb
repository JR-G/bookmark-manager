feature 'Adding bookmarks' do
  scenario 'user can submit bookmarks' do
    visit '/bookmarks/new'
    fill_in :url, with: 'www.mytestsite.com'
    fill_in :title, with: 'Test Site'
    click_button 'Submit'

    expect(page).to have_link 'Test Site', href: 'www.mytestsite.com'
  end
end

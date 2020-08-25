feature 'Adding bookmarks' do
  scenario 'user can submit bookmarks' do
    visit '/bookmarks/new'
    fill_in 'url', with: 'www.mytestsite.com'
    click_button 'Submit'

    expect(page).to have_content 'www.mytestsite.com'
  end
end
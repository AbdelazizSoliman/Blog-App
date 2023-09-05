require 'rails_helper'

RSpec.feature "User Index", type: :feature do
  let!(:user1) { create(:user, name: 'Alex', photo: 'https://www.goodfreephotos.com/albums/bolivia/other-bolivia/mountains-and-lake-landscape-scenic.jpg') }
  let!(:user2) { create(:user, name: 'Abdelaziz', photo: 'https://www.goodfreephotos.com/albums/bolivia/other-bolivia/mountains-and-lake-landscape-scenic.jpg') }
  let!(:user3) { create(:user, name: 'Ronald') }

  scenario 'visiting the user index page' do
    visit users_path

    expect(page).to have_content("Alex")
    expect(page).to have_content("Abdelaziz")
    expect(page).to have_css("img[alt='Alex']", count: 1)
    expect(page).to have_css("img[alt='Abdelaziz']", count: 1)
  end

  scenario 'visiting the user index page, you see the number of posts each user has written' do
    create(:post, author: user1, title: 'first post')
    create(:post, author: user1, title: 'second post')
    create(:post, author: user1, title: 'third post')

    visit users_path

    expect(page).to have_content("3")
    expect(page).to have_content("0")
  end

  scenario 'clicking on a user redirects to their show page' do 
    visit users_path
    click_link 'Ronald'

    expect(page).to have_current_path(user_posts_path(user3))
  end
end

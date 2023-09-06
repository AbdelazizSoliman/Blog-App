require 'rails_helper'

RSpec.feature 'User Index', type: :feature do
  scenario 'visiting the user index page' do
    User.create(name: 'Alex', photo: 'https://www.goodfreephotos.com/albums/bolivia/other-bolivia/mountains-and-lake-landscape-scenic.jpg')
    User.create(name: 'Abdelaziz', photo: 'https://www.goodfreephotos.com/albums/bolivia/other-bolivia/mountains-and-lake-landscape-scenic.jpg')

    visit users_path

    expect(page).to have_content('Alex')
    expect(page).to have_content('Abdelaziz')
    expect(page).to have_css("img[alt='Alex']", count: 1)
    expect(page).to have_css("img[alt='Abdelaziz']", count: 1)
  end

  scenario 'visiting the user index page, you see the number of posts each user has written..' do
    user1 = User.create(name: 'Alex')
    User.create(name: 'Abdelaziz')
    Post.create(author: user1, title: 'first post')
    Post.create(author: user1, title: 'second post')
    Post.create(author: user1, title: 'third post')

    visit users_path

    expect(page).to have_content('3')
    expect(page).to have_content('0')
  end
end

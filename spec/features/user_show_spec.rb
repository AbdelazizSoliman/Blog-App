require 'rails_helper'

RSpec.feature 'User Show', type: :feature do
  let(:user) { User.create(name: 'Alex', photo: 'https://www.goodfreephotos.com/albums/bolivia/other-bolivia/mountains-and-lake-landscape-scenic.jpg', bio: 'He is a good programmer') }

  scenario 'visiting the user Show page' do
    visit user_path(user)

    expect(page).to have_content('Alex')
    expect(page).to have_css("img[alt='Alex']", count: 1)
  end

  scenario 'visiting the user show page, you see the number of posts the user has written..' do
    visit user_path(user)

    expect(page).to have_content('0 posts')
  end

  scenario 'visiting the user show page, you see the bio of the user..' do
    visit user_path(user)
    expect(page).to have_content('He is a good programmer')
  end

  scenario 'has a link to the user index page' do
    visit user_path(user)

    expect(page).to have_button('See all posts')
    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end

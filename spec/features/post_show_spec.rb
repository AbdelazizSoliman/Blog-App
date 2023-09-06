require 'rails_helper'

RSpec.feature 'Post Show', type: :feature do
  let(:user) { User.create(name: 'Alex', photo: 'https://www.goodfreephotos.com/albums/bolivia/other-bolivia/mountains-and-lake-landscape-scenic.jpg', bio: 'He is a good programmer') }
  let!(:post) { Post.create(author: user, title: "first post's title", text: 'first text') }

  scenario 'see the title of the post and who wrote it and the interactions' do
    visit user_post_path(user, post)
    expect(page).to have_content("first post's title")
    expect(page).to have_content('by Alex')
    expect(page).to have_content('Comments: 0')
    expect(page).to have_content('Likes: 0')
  end

  scenario "see the post's body" do
    visit user_post_path(user, post)
    expect(page).to have_content('first text')
  end
end

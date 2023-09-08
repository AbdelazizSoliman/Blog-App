require 'rails_helper'

RSpec.feature 'Post Show', type: :feature do
  let(:user) { User.create(name: 'Alex', photo: 'https://www.goodfreephotos.com/albums/bolivia/other-bolivia/mountains-and-lake-landscape-scenic.jpg', bio: 'He is a good programmer') }
  let!(:post) { Post.create(author: user, title: "first post's title", text: 'first text') }

  scenario 'see the title of the post' do
    visit user_post_path(user, post)
    expect(page).to have_content("first post's title")
  end

  scenario 'see who wrote the post' do
    visit user_post_path(user, post)
    expect(page).to have_content('by Alex')
  end

  scenario 'see the number of comments on the post' do
    visit user_post_path(user, post)
    expect(page).to have_content('Comments: 0')
  end

  scenario 'see the number of likes on the post' do
    visit user_post_path(user, post)
    expect(page).to have_content('Likes: 0')
  end

  scenario "see the post's body" do
    visit user_post_path(user, post)
    expect(page).to have_content('first text')
  end

  scenario 'I can see the username of each commentor and the comment each commentor left' do
    user2 = User.create(name: 'John')
    Comment.create(post:, author: user2, text: 'Great post!')

    visit user_post_path(user, post)

    expect(page).to have_content('Alex')
    expect(page).to have_content('John')
    expect(page).to have_content('Great post!')
  end
end

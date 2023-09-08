require 'rails_helper'

RSpec.feature 'Post Index', type: :feature do
  let(:user) { User.create(name: 'Abdelaziz', photo: 'https://www.goodfreephotos.com/albums/bolivia/other-bolivia/mountains-and-lake-landscape-scenic.jpg', bio: 'He is a good programmer') }
  let!(:post) { Post.create(author: user, title: "first post's title", text: 'first text') }
  let!(:comment1) { Comment.create(author: user, post:, text: 'first comment') }
  let!(:comment2) { Comment.create(author: user, post:, text: 'second comment') }
  let!(:comment3) { Comment.create(author: user, post:, text: 'third comment') }
  let!(:like1) { Like.create(author: user, post:) }

  scenario "see user's profile picture" do
    visit user_posts_path(user)
    expect(page).to have_css("img[alt='Abdelaziz']", count: 1)
  end

  scenario "see user's username" do
    visit user_posts_path(user)
    expect(page).to have_content('Abdelaziz')
  end

  scenario 'see the number of posts by the user' do
    visit user_posts_path(user)
    expect(page).to have_content('1 post')
  end

  scenario "see the number of comments on the user's posts" do
    visit user_posts_path(user)
    expect(page).to have_content('Comments: 3')
  end

  scenario "see the number of likes on the user's posts" do
    visit user_posts_path(user)
    expect(page).to have_content('Likes: 1')
  end

  scenario "see some of the post's title" do
    visit user_posts_path(user)
    expect(page).to have_content("first post's title")
  end

  scenario "see some of the post's body" do
    visit user_posts_path(user)
    expect(page).to have_content('first text')
  end

  scenario 'see the first comment on the post' do
    visit user_posts_path(user)
    expect(page).to have_content('first comment')
  end

  scenario 'see a section for pagination if there are more posts than fit on the view' do
    # Assuming there are more than one post
    Post.create(author: user, title: 'second post', text: 'second text')

    visit user_posts_path(user)
    expect(page).to have_content('Pagination')
  end

  scenario "clicking on a post title redirects me to that post's show page" do
    visit user_posts_path(user)
    click_link "first post's title"
    expect(page).to have_current_path(user_post_path(user, post))
  end
end

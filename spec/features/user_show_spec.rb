require 'rails_helper'

RSpec.feature "User Show", type: :feature do
  scenario 'visiting the user Show page' do
    user1 = User.create(name: 'Alex', photo: 'https://www.goodfreephotos.com/albums/bolivia/other-bolivia/mountains-and-lake-landscape-scenic.jpg')

    visit user_path(user1)

    expect(page).to have_content("Alex")
    expect(page).to have_css("img[alt='Alex']", count: 1)    
  end

  scenario 'visiting the user show page, you see the number of posts the user has written..' do
    user1 = User.create(name: 'Alex')
    post1 = Post.create(author: user1, title: 'first post')
    post2 = Post.create(author: user1, title: 'second post')
    post3 = Post.create(author: user1, title: 'third post')

    visit user_path(user1)

    expect(page).to have_content("3 posts")
  end
  
  scenario 'visiting the user show page, you see the 3 most recent post and bio of the user has written..' do
    user1 = User.create(name: 'Alex', bio: "He is a good programmar")
    post1 = Post.create(author: user1, title: 'first post', text: 'first text')
    post2 = Post.create(author: user1, title: 'second post', text: 'second text')
    post3 = Post.create(author: user1, title: 'third post',text: '3 text' )
    post4 = Post.create(author: user1, title: '4 post',text: '4 text')


    visit user_path(user1)

    expect(page).to have_content("He is a good programmar")
    expect(page).to have_content('second text')
    expect(page).not_to have_content("fist text")
    expect(page).to have_content("3 text")
    expect(page).to have_content("4 text")

  end
end

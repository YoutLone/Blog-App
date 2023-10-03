require 'rails_helper'

RSpec.feature 'Post Show', type: :feature do
  let(:user) do
    User.create(name: 'Kante', photo: 'https://unsplash.com/photos/OgqWLzWRSaI',
                bio: 'He is a good football player')
  end
  let!(:post) { Post.create(author: user, title: "first post's title", text: 'first text') }
  let!(:comment1) { Comment.create(author: user, post:, text: 'first comment') }
  let!(:comment2) { Comment.create(author: user, post:, text: 'second comment') }
  let!(:like1) { Like.create(user:, post:) }

  before do
    visit user_post_path(user, post)
  end

  scenario 'see the post details' do
    expect(page).to have_content("first post's title")
    expect(page).to have_content('by Kante')
    expect(page).to have_content('Comments: 2')
    expect(page).to have_content('Likes: 1')
  end

end

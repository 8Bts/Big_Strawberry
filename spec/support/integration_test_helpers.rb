module IntegrationTestHelpers
  def do_login(name)
    visit new_session_path
    fill_in('name', with: name)
    click_button('Sign In')
  end

  def do_signup(name)
    visit new_user_path
    fill_in('name', with: name)
    click_on('Sign Up')
  end

  def create_article(username)
    do_login(username)
    click_button('Add New Recipe')

    fill_in('article_title', with: 'Salad')
    fill_in('article_text', with: 'It is very healthy')
    attach_file('Image', Down.download('https://res.cloudinary.com/strawberry-cloud/image/upload/v1597406835/sample.jpg'))
    click_button('Publish')
  end

  def make_vote(name)
    create_article(name)
    click_button('Vote')
  end

  def delete_article(username)
    create_article(username)
    click_link('Delete')
  end

  def edit_article(username)
    create_article(username)
    click_link('Edit')
    select('Diet', from: 'article_category_id')
    fill_in('article_title', with: 'Salad')
    fill_in('article_text', with: 'It is very healthy')
    attach_file('Image', 'https://res.cloudinary.com/strawberry-cloud/image/upload/v1597865982/ldzcdires5aiomtgxffz.png')
    click_button('Publish')
  end
end

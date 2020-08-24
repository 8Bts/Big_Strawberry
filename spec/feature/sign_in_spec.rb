require 'rails_helper'
require 'support/integration_test_helpers'
RSpec.describe 'Authentication', type: :system do
  include IntegrationTestHelpers
  before :each do
    User.create(name: 'Tim')
  end

  it 'Does a login' do
    do_login('Tim')
    expect(page).to have_content 'Tim'
  end

  it 'prevents login with blank or non-existing username' do
    do_login('Steve')
    expect(page).to have_content 'There is no user with that name'
  end

  it 'Does a logout' do
    do_login('Tim')
    click_link('SIGN OUT')
    expect(page).to have_content 'SIGN IN'
  end

  it 'Does a sign-up' do
    do_signup('Morty')
    expect(page).to have_content 'User with name Morty successfully created'
  end

  it 'prevents sign-up with existing username' do
    do_signup('Tim')
    expect(page).to have_content 'Name has already been taken'
  end

  it 'prevents sign-up with blank username' do
    do_signup(' ')
    expect(page).to have_content "Name can't be blank"
  end
end

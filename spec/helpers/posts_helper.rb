def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
end

def user_two_sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
end

def sign_in
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  click_button('Log in')
end

def user_two_sign_in
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: 'testtest')
  click_button('Log in')
end

def write_post(content)
  visit '/'
  click_link('Add Post')
  fill_in('Content', with: "#{content}")
  click_button 'Create Post'
end

def sign_out
  visit '/'
  click_link 'Sign out'
end

  

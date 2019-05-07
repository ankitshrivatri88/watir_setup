class LoginPage

  include PageObject
  page_url "https://accounts.google.com"

  div(:log_in, :text => 'Sign in')
  text_field(:userfield, :type => 'email')
  div(:user_next, :id => 'identifierNext')
  text_field(:passfield, :type => 'password')
  div(:pass_next, :id => 'passwordNext')

  def enter_username()
    userfield.set ENV['USERNAME']
  end

  def enter_password()
    passfield.set ENV['PASSWORD']
  end

  def click_sign_in()
    log_in.click
  end

end
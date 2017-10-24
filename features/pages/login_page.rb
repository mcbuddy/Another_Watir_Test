
module LoginPage

  def self.login_with(email, password)
    $browser.find_element(id: 'email').send_keys(email)
    $browser.find_element(xpath: '//*[@id="fouc"]/div/div[4]/div/div/div[2]/div/form/div[1]/fieldset/div[2]/div[2]/input').send_keys(password)
    $browser.find_element(id: 'submit_login').click
  end

end
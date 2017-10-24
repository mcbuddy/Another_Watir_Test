
module PlayerBuilderPage

  def self.click_navbar(link)
    case link
      when 'Players'
        link_path = '//*[@id="fouc"]/div[1]/div[2]/div[2]/div[3]/div[2]/div[1]/a'
      when 'Tools'
        link_path = '//*[@id="fouc"]/div[1]/div[2]/div[2]/div[3]/div[2]/div[4]/a'
      else
        raise 'Wrong navbar link'
    end
    $browser.find_element(xpath: link_path).click
  end

  def self.search_player(name)
    $browser.find_element(id: 'plyr_search').send_keys(name, :return)

  end

  def self.first_element
    $browser.find_element(xpath: '//*[@id="fouc"]/div[2]/div[5]/div/div/div[2]/div[2]/div[2]/div[2]/div[1]/table/tbody/tr[1]/td[2]/a')
  end

  def self.validate_search_result(name)
    self.first_element
    $wait.until { self.first_element.text == name }
    expect(self.first_element.text).to eql(name)
  end

  def self.validate_ratio(size)
    expect($browser.find_element(xpath: '//*[@id="fouc"]/div[2]/div[5]/div/div/div[2]/div[2]/div[2]/div[2]/div[1]/table/tbody/tr/td[3]').text).to eql(size)
  end

  def self.click_first_element(name)
    self.first_element.click
  end

  def self.change_player_name(new_name)
    $browser.find_element(id: 'player-name').clear
    $browser.find_element(id: 'player-name').send_keys(new_name)
  end

  def self.find_and_click_text(text)
    script = "function getElementsByText(str, tag = 'a') {
                return Array.prototype.slice.call(document.getElementsByTagName(tag)).filter(el => el.textContent.trim() === str.trim());
              }
              var elem = getElementsByText('#{text}')

              elem[0].click();"
    $browser.execute_script(script)
  end

  def self.change_aspect_ratio(size)
    # click the dropdown
    $browser.find_element(xpath: '/html/body/div[3]/div[2]/div[5]/div/div/div[2]/div[2]/form/div[1]/div/div[1]/div/ng-include/ng-form/div[2]/div[3]/jw-dropdown/div[1]/a').click
    sleep 1
    case size
      when '16:9'
        $browser.find_element(xpath: '/html/body/div[3]/div[2]/div[5]/div/div/div[2]/div[2]/form/div[1]/div/div[1]/div/ng-include/ng-form/div[2]/div[3]/jw-dropdown/div[1]/ul/li[1]/a').click
      when '4:3'
        $browser.find_element(xpath: '/html/body/div[3]/div[2]/div[5]/div/div/div[2]/div[2]/form/div[1]/div/div[1]/div/ng-include/ng-form/div[2]/div[3]/jw-dropdown/div[1]/ul/li[3]/a').click
      else
        raise 'Wrong aspect ratio'
    end
  end

  def self.press_save
    $browser.find_element(xpath: '//*[@id="fouc"]/div[2]/div[5]/div/div/div[2]/div[2]/form/div[2]/div[1]/div[2]/button[2]/span[1]').click
  end

  def self.check_flash_msg
    flash_msg_xpath = '/html/body/div[3]/div[2]/div[4]/div[4]/div'
    $wait.until { $browser.find_element(xpath: flash_msg_xpath) == "Player successfully saved" || sleep(2)}
    expect($browser.find_element(xpath: flash_msg_xpath).text).to eql("Player successfully saved")
  end

  def self.press_close
    $browser.find_element(xpath: '//*[@id="fouc"]/div[2]/div[5]/div/div/div[2]/div[2]/form/div[2]/div[1]/div[2]/button[1]').click
  end

end
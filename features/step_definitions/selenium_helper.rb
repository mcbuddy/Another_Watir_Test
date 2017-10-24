# ../selenium_helper.rb
require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

module SeleniumHelper
  def self.set_browser
    browser = Selenium::WebDriver.for ENV['BROWSER'].to_sym
    browser.manage.window.resize_to(1200, 800)
    browser.manage.timeouts.implicit_wait = 30
    return browser
  end

  def self.set_wait
    wait = Selenium::WebDriver::Wait.new(:timeout => 60)
    return wait
  end

end

require_relative 'selenium_helper'
require_relative '../pages/login_page'
require_relative '../pages/player_builder_page'
include SeleniumHelper
include LoginPage
include PlayerBuilderPage

Before do |scenario|
  $browser = SeleniumHelper.set_browser
  $wait = SeleniumHelper.set_wait
end

After do |scenario|
  $browser.quit
end


Given(/^I logged in at jwplayer homepage$/) do
  $browser.get ENV['URI']
  LoginPage.login_with(ENV['EMAIL'], ENV['PASSWORD'])
end

And(/^I click on "([^"]*)" navbar$/) do |link|
  PlayerBuilderPage.click_navbar(link)
end

And(/^I search and select "([^"]*)" name on the player builder page$/) do |name|
  PlayerBuilderPage.search_player(name)
  PlayerBuilderPage.validate_search_result(name)
  PlayerBuilderPage.click_first_element(name)
end

When(/^I change the name to "([^"]*)"$/) do |new_name|
  PlayerBuilderPage.change_player_name(new_name)
end

And(/^I change the aspect ratio to "([^"]*)"$/) do |size|
PlayerBuilderPage.change_aspect_ratio(size)
end

And(/^I save the changes$/) do
  PlayerBuilderPage.press_save
end

Then(/^I should see my player updated to "([^"]*)" with aspect ratio "([^"]*)"$/) do |new_name, size|
  PlayerBuilderPage.check_flash_msg
  PlayerBuilderPage.press_close
  PlayerBuilderPage.search_player(new_name)
  PlayerBuilderPage.validate_search_result(new_name)
  PlayerBuilderPage.validate_ratio(size)
end
require 'watir-webdriver/atoms'
require 'page-object/page_factory'

include PageObject::PageFactory

Given(/^user is on google page$/) do
  visit_page(LoginPage)
end

When(/^a user enters username$/) do
  on LoginPage do |page|
    page.userfield = ENV['USERNAME']
    page.user_next
  end
end

When(/^a user enters password$/) do
  on LoginPage do |page|
    page.passfield = ENV['PASSWORD']
    page.pass_next
  end
end

And(/^I click on Sign in button$/) do
  on LoginPage do |page|
    page.click_sign_in
  end
end

Then(/^I return to homepage$/) do
  expect(@browser.url).to match("https://www.google.com")

end
Given(/^I am on the home page$/) do
  visit 'http://localhost:3000/'
end

When(/^I click '([^"]*)' on the '([^"]*)' picture$/) do |link, picture|
  find("##{picture.downcase}").click_link("#{link}")
end

Then(/^I expect to see the '([^"]*)' picture$/) do |picture_name|
  expect(page).to have_content("Name: #{picture_name}")
end

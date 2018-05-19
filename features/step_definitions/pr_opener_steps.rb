Given("I have configured a valid API token") do
  step('I set the environment variable "VALID_TOKEN" to "true"')
end

Given("The remote branch {string} exists") do |string|
  step('I append "string" to the environment variable "REMOTE_BRANCHES"')
end

Then("Github should respond with success") do
  step('the output should contain "PR Opened Successfully"')
end

When(/^(.*) within a cassette named "([^"]*)"$/) do |step, cassette_name|
  VCR.use_cassette(cassette_name) { When step }
end

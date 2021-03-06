require "selenium-webdriver"
require "rspec"

# TEST sign up for blog
describe "Blog application" do
    describe "signup for blog application" do
        it "confirms that user can successfully sign up" do
            timestamp = Time.now.to_i
            driver = Selenium::WebDriver.for :firefox
            # go to the signup form
            driver.navigate.to "https://selenium-blog.herokuapp.com/signup"
            # fill out and submit form
            username_field = driver.find_element(id: 'user_username')
            username_field.send_keys("Betsy#{timestamp}")
            
            email_field = driver.find_element(id: 'user_email')
            email_field.send_keys("betsy#{timestamp}@ilovemoo.com")
            
            password_field = driver.find_element(id: 'user_password')
            password_field.send_keys("betsygoesmoo")

            sign_up_button = driver.find_element(id: 'submit')
            sign_up_button.click

            # Confirm user is signed up successfully
  		    banner = driver.find_element(id: 'flash_success')
  		    banner_text = banner.text
  		    expect(banner_text).to eq("Welcome to the alpha blog Betsy#{timestamp}")

  		    driver.quit
        end
    end
end
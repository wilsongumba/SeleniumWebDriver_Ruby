require "selenium-webdriver"

require "webdrivers"

require "rspec"

  describe "automating a form" do

    it "submits a form" do
        

      driver = Selenium::WebDriver.for :chrome

      #driver = Selenium::WebDriver.for :firefox

      driver.navigate.to "https://formy-project.herokuapp.com/form"

      driver.find_element(id: 'first-name').send_keys('John')

      driver.find_element(id: 'last-name').send_keys('Doe')

      driver.find_element(id: 'job-title').send_keys('QA')

      driver.find_element(id: 'radio-button-2').click

      driver.find_element(id: 'checkbox-2').click

      driver.find_element(css: 'option[value="2"]').click

      driver.find_element(id: 'datepicker').send_keys('05/25/2025')

      driver.find_element(id: 'datepicker').send_keys :return

      driver.find_element(css: '.btn.btn-lg.btn-primary').click

      wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds

      wait.until { driver.find_element(class: 'alert') }

      expect(driver.find_element(class: 'alert').text).to eql('The form was successfully submitted!')

      driver.quit

    end

  end

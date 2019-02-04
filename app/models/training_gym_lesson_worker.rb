require 'selenium-webdriver'
require 'nokogiri'
require 'pp'

module TrainingGymLessonWorker
  def self.get_driver
    options = Selenium::WebDriver::Remote::Capabilities
    options = options.chrome('chromeOptions' => { args: ['--headless'] })
    Selenium::WebDriver.for :chrome, desired_capabilities: options
  end
end

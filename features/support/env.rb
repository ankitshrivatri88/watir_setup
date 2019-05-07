require 'cucumber'
require 'dotenv'
Dotenv.load

require 'ffaker'
require 'page-object'
require 'page-object/page_factory'
require 'selenium-webdriver'


World (PageObject::PageFactory)

Before do

  ENV['BROWSER'] = "chrome" if ENV['BROWSER'].nil?
  ENV['WHERE'] = "local" if ENV['WHERE'].nil?
  ENV['GRID_URL'] = ENV['GRID_URL'] || "http://#{ENV['SELENIUM_REMOTE_HOST']}:4444/wd/hub"  #http://127.0.0.1:4444/ #10.123.73.121

  if (ENV['WHERE'] == "remote")

    # caps = Selenium::WebDriver::Remote::Capabilities.new
    # caps[:browserName] = ENV['BROWSER']

    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
        'goog:chromeOptions': {
            args: [
                "--headless",
            ]
        })
    @browser = Watir::Browser.new(
        :remote,
        :url => ENV['GRID_URL'],
        :desired_capabilities => caps
    )
    # @browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym,{url:"http://172.17.0.3:4444/wd/hub"})
  else
    # @browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym)
    @browser = Watir::Browser.new ENV['BROWSER'].to_sym
  end
end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  @browser.cookies.clear
  @browser.close
end
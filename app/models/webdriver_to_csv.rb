# frozen_string_literal: true

require 'selenium-webdriver'
require 'csv'

class Scraper
  def initialize
    # 何秒待つか
    @long = 3
    # 取得元のURL
    @root_path = 'https://quotes.toscrape.com/js/'
    # webdriverのインスタンス
    options = Selenium::WebDriver::Chrome::Options.new
    options.headless!
    @driver = Selenium::WebDriver.for(:chrome, capabilities: [options])
  end

  def main
    @driver.navigate.to @root_path
    obtain_contents
    sleep @long

    @driver.quit
  end

  def obtain_contents
    quotes = []
    # ページ内でデータを取得できている限りこの操作が続く
    loop do
      # .quotaがつくクラスのコンテンツを配列にして返す
      quote_elements = @driver.find_elements(css: '.quote')
      # 返ってきた配列の中から、欲しい要素のみをquotes（配列）へ入れる
      quote_elements.each do |quote_el|
        # .quota.teztの中の文
        quote_text = quote_el.find_element(css: '.text').attribute('textContent')
        # .quote.authorの中の文
        author = quote_el.find_element(css: '.author').attribute('textContent')
        quotes << [quote_text, author]
      end
      begin
        # .nextというボタンがあったらクリックする
        @driver.find_element(css: '.next >a').click
      rescue StandardError
        break # Next button not found
      end
    end
    # quotes = []の中身を、quotes.csvというファイル名で転記
    CSV.open('quotes.csv', 'w+', write_headers: true,
                                 headers: %w[Quote Author]) do |csv|
      quotes.each do |quote|
        csv << quote
      end
    end
  end
end

start = Scraper.new
start.main

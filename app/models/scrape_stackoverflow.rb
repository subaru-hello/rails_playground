# frozen_string_literal: true

require 'selenium-webdriver'

class Scraper
  def initialize
    # 何秒待つか
    @long = 3
    # 取得元のURL
    @root_path = 'https://stackoverflow.com/questions'
    # webdriverのインスタンス
    @driver = Selenium::WebDriver.for :chrome
  end

  def main
    @driver.navigate.to @root_path
    get_questions
    sleep @long

    @driver.quit
  end

  def get_questions
    questions = @driver.find_elements(class: 'question-summary')
    questions.each do |question|
      question_text = question.find_element(class: 'question-hyperlink').text
      Rails.logger.debug question_text
      vote_count = question.find_element(class: 'vote-count-post').text
      Rails.logger.debug vote_count
      answer_count = question.find_element(class: 'status').text
      Rails.logger.debug answer_count
      views = question.find_element(class: 'views').text
      Rails.logger.debug views
    end
  end
end

start = Scraper.new
start.main

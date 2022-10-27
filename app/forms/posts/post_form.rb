# frozen_string_literal: true

class PostValidationForm
  include ActiveModel::Model
  attr_accessor :title, :body

  validate :at_least_one_email

  def initialize(params = {})
    super(params)
    @body ||= params[:body]
    @title ||= params[:title]
  end

  def save
    return false if invalid?

    emails.each { |email| Rails.logger.debug email } # do something with it
  end

  private

  def at_least_one_email
    errors.add(:emails, 'are blank') if emails.blank?
  end
end

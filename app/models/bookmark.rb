class Bookmark < ActiveRecord::Base

  #validate that we have a title
  validates :title, presence: true

  #validates that title is unique
  validates :title, uniqueness: true

  #validate that the name has at least 3 characters
  validates :title, length: {minimum: 3}

  ####validate that we have a url
  validates :url, presence: true

  #validates that url is unique
  validates :url, uniqueness: true

  #validate that the url starts w/ http
  # validates :url, format: { :with => /\Ahttp:+\z/}
  #validates :url, start_with?:('http')

end

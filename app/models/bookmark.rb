class Bookmark < ActiveRecord::Base

  #validate that we have a title, that it's unique, and that it has at least 3 characters
  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }

  ####validate that we have a url
  validates :url, presence: true, uniqueness: true


  #validate that the url starts w/ http
  validates :url, format: { with: /\Ahttp:/ }
  # validates :url, with: {"/\Ahttp:+\z/"}
  #validates_presence_of {"/\Ahttp:+\z/"}
  #validates :url, start_with?:('http')

  #validates :category, uniqueness: true

end

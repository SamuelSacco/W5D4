# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'securerandom'

class ShortenedUrl < ApplicationRecord
  include SecureRandom
  validates :long_url, presence: true

  def self.random_code
    flag = false
    until flag 
      random_string = SecureRandom::urlsafe_base64
      if !self.exists?(random_string)
        flag = true
      end
    end

    random_string
  end

  def self.create!(user_object, long_url)
    ShortenedUrl.create(long_url: long_url, short_url: random_code, 
    user_id: user_object.id)
  end
end

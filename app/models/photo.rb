class Photo < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user


  scope :most_recent, -> { order(id: :desc) }

  def should_generate_new_friendly_id?
    title_changed?
  end

  def published_date
    "a date"
  end

  def taken_date
    "a date"
  end


end

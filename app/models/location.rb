class Location < ApplicationRecord
  has_many :reviews
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

class Picture < ActiveRecord::Base
    validates :title, :comment, :image_url, presence: true
    mount_uploader :image_url, ContentUploader
    belongs_to :user
end

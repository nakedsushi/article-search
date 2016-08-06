class Audio < ApplicationRecord
  has_attached_file :clip
  validates_attachment_content_type :clip, content_type: /\Aaudio\/.*\Z/
end

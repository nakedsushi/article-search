require 'rails_helper'

RSpec.describe Audio, :type => :model do

  it { should have_attached_file(:clip) }
  it { should validate_attachment_content_type(:clip).
      allowing('audio/mp3').
      rejecting('text/plain', 'text/xml', 'image/png') }
end

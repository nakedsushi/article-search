class AddAttachmentClipToAudios < ActiveRecord::Migration
  def self.up
    change_table :audios do |t|
      t.attachment :clip
    end
  end

  def self.down
    remove_attachment :audios, :clip
  end
end

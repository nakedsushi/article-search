class AddMetaToAudios < ActiveRecord::Migration[5.0]
  def change
    add_column :audios, :meta, :text
  end
end

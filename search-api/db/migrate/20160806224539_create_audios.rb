class CreateAudios < ActiveRecord::Migration[5.0]
  def change
    create_table :audios do |t|
      t.string :url
      t.timestamps
    end
  end
end

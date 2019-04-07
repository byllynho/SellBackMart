class AddAttachmentPhotoToItems < ActiveRecord::Migration[5.2]
  def self.up
    change_table :items do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :items, :photo
  end
end

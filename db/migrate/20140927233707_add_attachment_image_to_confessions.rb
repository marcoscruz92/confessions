class AddAttachmentImageToConfessions < ActiveRecord::Migration
  def self.up
    change_table :confessions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :confessions, :image
  end
end

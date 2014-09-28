class Confession < ActiveRecord::Base
	belongs_to :user
    has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
    validates :description, presence: true

    has_reputation :votes, source: :user,  aggregated_by: :sum

end

class Comment < ActiveRecord::Base
	belongs_to :donation, dependent: :destroy
	belongs_to :ngo, dependent: :destroy
end

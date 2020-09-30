class Like < ApplicationRecord
    belongs_to :cat
    belongs_to :user
    validates :cat_id, uniqueness: {scope: :user_id}

end

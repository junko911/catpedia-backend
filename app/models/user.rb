class User < ApplicationRecord
    has_many :likes
    has_many :cats, through: :likes
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
end

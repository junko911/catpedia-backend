class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false, message: 'Shoot! Someone is already using this username...'}
    validates :username, presence: { message: 'You need a username! How else will we know what to call you?'}
    has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
    has_many :followeds, through: :active_relationships, source: :followed
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :avatar, :bio, :followers, :followeds
end

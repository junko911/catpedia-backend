class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :followers, :followeds
end

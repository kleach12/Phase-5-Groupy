class GroupUserSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :group_id
end

class SurvivorSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :status
end
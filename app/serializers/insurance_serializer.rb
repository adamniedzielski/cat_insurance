# frozen_string_literal: true

class InsuranceSerializer < ActiveModel::Serializer
  attributes :name, :price_cents, :code_name

  def code_name
    "#{object.id} #{object.name}"
  end
end

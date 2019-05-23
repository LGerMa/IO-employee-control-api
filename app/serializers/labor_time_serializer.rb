class LaborTimeSerializer < ActiveModel::Serializer
  attributes :id, :test

  def test
    'prueba2'
  end
end

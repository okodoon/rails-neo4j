class Player 
  include Neo4j::ActiveNode

  self.mapped_label_name = "選手"

  property :name
  property :salary
  property :birthday

  has_one :out, :team, type: :belongs_to, model_class: :Team
  has_one :out, :blood_type, type: :blood_type, model_class: :BloodType
  has_one :out, :position, type: :rolled, model_class: :Position
  has_one :out, :career, type: :how_long, model_class: :Career
  has_one :out, :thrower_striker_type, type: :throw_and_strike, model_class: :ThrowerStrikerType
  has_one :out, :tall, type: :tall, model_class: :Tall
  has_one :out, :weight, type: :weight, model_class: :Weight
  has_one :out, :birth_place, type: :born_in, model_class: :BirthPlace
  has_one :out, :age, type: :how_old, model_class: :Age
end

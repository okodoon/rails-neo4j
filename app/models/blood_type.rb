class BloodType 
  include Neo4j::ActiveNode

  self.mapped_label_name = "血液型"
  property :type
  has_many :in, :players, type: :blood_type, model_class: :Player

end

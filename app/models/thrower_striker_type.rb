class ThrowerStrikerType 
  include Neo4j::ActiveNode

  self.mapped_label_name = "投打"
  property :type
  has_many :in, :players, type: :throw_strike, model_class: :Player

end

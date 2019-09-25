class Position 
  include Neo4j::ActiveNode

  self.mapped_label_name = "ポジション"
  property :position
  has_many :in, :players, type: :rolled, model_class: :Player


end

class Team 
  include Neo4j::ActiveNode

  self.mapped_label_name = "チーム"
  property :name
  has_many :in, :players, type: :belongs_to, model_class: :Player

end

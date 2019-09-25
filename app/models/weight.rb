class Weight 
  include Neo4j::ActiveNode

  self.mapped_label_name = "体重"
  property :kg
  has_many :in, :players, type: :weight, model_class: :Player

end

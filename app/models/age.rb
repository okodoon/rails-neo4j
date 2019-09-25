class Age 
  include Neo4j::ActiveNode

  self.mapped_label_name = "年齢"
  property :age
  has_many :in, :players, type: :how_old, model_class: :Player

end

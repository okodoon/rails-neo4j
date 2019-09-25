class Career 
  include Neo4j::ActiveNode

  self.mapped_label_name = "年数"
  property :year
  has_many :in, :players, type: :how_long, model_class: :Player

end

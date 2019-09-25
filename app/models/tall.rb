class Tall 
  include Neo4j::ActiveNode

  self.mapped_label_name = "身長"
  property :cm
  has_many :in, :players, type: :tall, model_class: :Player

end

class BirthPlace 
  include Neo4j::ActiveNode

  self.mapped_label_name = "出身地"
  property :name
  has_many :in, :players, type: :born_in, model_class: :Player

end

class Faculty 
  include Neo4j::ActiveNode

  self.mapped_label_name = "学部"
  property :name
  has_many :in, :universities, type: :has, model_class: :University

end

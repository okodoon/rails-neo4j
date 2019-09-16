class University 
  include Neo4j::ActiveNode

  self.mapped_label_name = "大学"
  property :name
  has_many :out, :faculties, type: :has, model_class: :Faculty
end

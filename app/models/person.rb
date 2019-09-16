class Person 
  include Neo4j::ActiveNode

  property :name
  property :born, type: Integer, default: 0

end

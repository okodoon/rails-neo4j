class ForceCreate血液型positionIndex < Neo4j::Migrations::Base
  def up
    add_index :血液型, :position, force: true
  end

  def down
    drop_index :血液型, :position
  end
end

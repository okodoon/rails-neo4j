class ForceCreate血液型typeIndex < Neo4j::Migrations::Base
  def up
    add_index :血液型, :type, force: true
  end

  def down
    drop_index :血液型, :type
  end
end

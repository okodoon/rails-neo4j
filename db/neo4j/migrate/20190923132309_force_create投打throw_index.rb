class ForceCreate投打throwIndex < Neo4j::Migrations::Base
  def up
    add_index :投打, :throw, force: true
  end

  def down
    drop_index :投打, :throw
  end
end

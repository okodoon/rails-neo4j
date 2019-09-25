class ForceCreate投打battingIndex < Neo4j::Migrations::Base
  def up
    add_index :投打, :batting, force: true
  end

  def down
    drop_index :投打, :batting
  end
end

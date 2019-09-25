class ForceCreateポジションuuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :ポジション, :uuid, force: true
  end

  def down
    drop_constraint :ポジション, :uuid
  end
end

class CreateTriggersOnShips < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL

    CREATE TRIGGER log_ship_is_created
    AFTER INSERT ON ships
    FOR EACH ROW
    EXECUTE PROCEDURE log_ship_created();

    CREATE TRIGGER log_ship_is_deleted
    AFTER DELETE ON ships
    FOR EACH ROW
    EXECUTE PROCEDURE log_ship_deleted();

    SQL
  end

  def down
    execute <<-SQL
    DROP TRIGGER log_ship_is_created ON ships;
    DROP TRIGGER log_ship_is_deleted ON ships;
    SQL
  end
end

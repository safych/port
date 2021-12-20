class CreateShipProcedures < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL

    CREATE FUNCTION log_ship_created()
    RETURNS TRIGGER AS $$
    BEGIN
    INSERT INTO ships_logs(event_type, ship_data, created_at, updated_at) VALUES ('created', row_to_json(NEW), NOW(), NOW());
    RETURN NEW;
    END;
    $$
    LANGUAGE plpgsql;

    CREATE FUNCTION log_ship_deleted()
    RETURNS TRIGGER AS $$
    BEGIN
    INSERT INTO ships_logs(event_type, ship_data, created_at, updated_at) VALUES ('deleted', row_to_json(OLD), NOW(), NOW());
    RETURN OLD;
    END;
    $$
    LANGUAGE plpgsql;

    SQL
  end

  def down
    execute <<-SQL
    DROP FUNCTION log_ship_created;
    DROP FUNCTION log_ship_deleted;
    SQL
  end
end

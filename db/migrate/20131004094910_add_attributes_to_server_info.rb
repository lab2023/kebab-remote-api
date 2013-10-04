class AddAttributesToServerInfo < ActiveRecord::Migration
  def change
    add_column :server_infos, :cpu_load,   :float
    add_column :server_infos, :mem_total,  :integer
    add_column :server_infos, :mem_used,   :integer
    add_column :server_infos, :disk_total, :integer
    add_column :server_infos, :disk_used,  :integer
    add_column :server_infos, :uptime,     :integer
  end
end

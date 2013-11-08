class CreateServerInfos < ActiveRecord::Migration
  def change
    create_table :server_infos do |t|

      t.timestamps
    end
  end
end

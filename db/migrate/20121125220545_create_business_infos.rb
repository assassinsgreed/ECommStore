class CreateBusinessInfos < ActiveRecord::Migration
  def change
    create_table :business_infos do |t|
      t.text :about
      t.text :contact

      t.timestamps
    end
  end
end

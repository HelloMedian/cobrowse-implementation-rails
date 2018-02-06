class CreateMedianSubaccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :median_subaccounts do |t|
      t.belongs_to :company, foreign_key: true
      t.string :subaccount_id
      t.boolean :dev_mode
      t.boolean :request_permission
      t.string :request_permission_text
      t.string :excluded_selectors
      t.boolean :phone_mode

      t.timestamps
    end
  end
end

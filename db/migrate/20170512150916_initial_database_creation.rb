class InitialDatabaseCreation < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:relationships) do |t|
      t.belongs_to :store, index: true
      t.belongs_to :brand, index: true
      t.timestamps
    end

    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:price, :integer)
      t.timestamps
    end

  end
end

class CreateLegacyapis < ActiveRecord::Migration[5.2]
  def change
    create_table :legacyapis do |t|
      t.boolean :LoginSucceeded
      t.boolean :RetryLimitExceeded
      t.boolean :IsEmailValidated
      t.boolean :ReusePassword
      t.decimal :Version
      t.string :Status
      t.string :UserMessage
      t.string :DeveloperMessage
      t.string :RequestId

      t.timestamps
    end
  end
end

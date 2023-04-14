class JtiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :jti, :string
    add_index :users, :jti, unique: true

    User.where(jti: nil).each do |user|
      user.update_column(:jti, SecureRandom.uuid)
    end

    change_column_null :users, :jti, false
  end
end
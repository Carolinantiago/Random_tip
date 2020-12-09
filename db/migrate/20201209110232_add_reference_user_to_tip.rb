class AddReferenceUserToTip < ActiveRecord::Migration[6.0]
  def change
    add_reference :tips, :user
  end
end

class AddCompanyReferenceToInsurance < ActiveRecord::Migration[7.1]
  def change
    change_table :insurances do |t|
      t.references :company
    end
  end
end

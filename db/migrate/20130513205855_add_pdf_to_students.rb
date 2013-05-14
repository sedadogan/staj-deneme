class AddPdfToStudents < ActiveRecord::Migration
  def change
    add_column :students, :pdf, :string
  end
end

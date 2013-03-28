class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	#t.image "attachment"
    	t.text "content"
    	t.references :group
    	t.references :project
      t.timestamps
    end
  end
end
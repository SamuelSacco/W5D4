class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false
      t.string :short_url
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :shortened_urls, :short_url, unique: true
    # [:short_url, :long_url]
  end
end

# When we're done we'll eventually want to be able to find urls for a particular user.
# We'll also want users to be able to type in the short url and get back the long version, although our app won't have this functionality right away.

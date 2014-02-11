# Rails Migrations

## Methods:

  create_table(name, options)
  drop_table(name)
  rename_table(old_name, new_name)
  add_column(table_name, column_name, type, options)
  rename_column(table_name, column_name, new_column_name)
  change_column(table_name, column_name, type, options)
  remove_column(table_name, column_name)
  add_index(table_name, column_name, index_type)
  remove_index(table_name, column_name)
  change_table(table_name) { |table| ... }

## Available Column Types (mappings are below):

* integer
* float
* datetime
* date
* timestamp
* time
* text
* string
* binary
* boolean
* decimal
  - precision
  - scale

## Valid Column Options:

* limit
* null (i.e. `null: false` implies NOT NULL)
* default (to specify default values)
* precision (only decimal)
* scale (only decimal)

## Rake Tasks:

- rake db:schema:dump: run after you create a model to capture the schema.rb
- rake db:schema:import: import the schema file into the current database
  (on error, check if your schema.rb has `force: true` on the create table
  statements)
- rails generate migration (migration name): generate a new migration with
  a new 'highest' version (run 'rails generate migration' for this info at
  your fingertips)
- rake db:migrate: migrate your current database to the most recent version
- rake db:migrate VERSION=5: migrate your current database to a specific
  version (in this case, version 5)
- rake db:rollback: migrate down one migration
- rake db:rollback STEP=3: migrate down three migrations
- rake db:migrate RAILS_ENV=production: migrate your production database

## SQL:

Queries can be executed directly:

    execute <<SQL
      ALTER TABLE researchers
        ADD CONSTRAINT fk_researchers_departments
        FOREIGN KEY ( department_id ) REFERENCES departments( id )
    SQL

## Example:

    class UpdateUsersAndCreateProducts < ActiveRecord::Migration
      def self.up
        rename_column :users, :password:, :hashed_password
        remove_column :users, :email

        create_table :people do |t|
          t.integer :account_id
          t.string  :first_name, :last_name, null: false
          t.text    :description
          t.references :category # is the equivalent of t.integer :category_id
          t.timestamps
        end
      end

      def self.down
        rename_column :users, :hashed_password, :password
        add_column :users, :email, :string

        drop_table :products
      end
    end

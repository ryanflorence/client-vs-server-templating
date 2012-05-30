class SeedData < ActiveRecord::Migration
  def up
    100.times do |i|
      whatev = Whatev.new
      whatev.foo = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim.'
      whatev.bar = i
      whatev.save!
    end
  end

  def down
    Whatev.destroy_all
  end
end

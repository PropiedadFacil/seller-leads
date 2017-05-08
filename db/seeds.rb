# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).

characteristics = ['Leased solar panels', 'Owned solar panels',
                   'Known foundation issues', 'Gated community']
characteristics.each do |char|
  Characteristic.create(name: char)
end

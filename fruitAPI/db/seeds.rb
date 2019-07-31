# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create({ Fruit_Type: "melon" })

category = Category.last

Fruit.create({ category_id: category.id, name: "watermelon" })
Fruit.create({ category_id: category.id, name: "honeydew" })
Fruit.create({ category_id: category.id name: "cantaloupe"})

Category.create({ Fruit_Type: "berries" })

category = Category.last

Fruit.create({ category_id: category.id, name: "strawberry" })
Fruit.create({ category_id: category.id, name: "blackberry" })
Fruit.create({ category_id: category.id, name: "blueberry" })

Category.create({ Fruit_Type: "citrus" })

category = Category.last

Fruit.create({ category_id: category.id, name: "grapefruit" })
Fruit.create({ category_id: category.id, name: "lime" })
Fruit.create({ category_id: category.id, name: "orange" })

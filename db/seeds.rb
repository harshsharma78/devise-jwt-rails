# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.create([
  {
    name: "TestOne",
    brand: "TestBrandOne",
    price: "$20.33",
    description: "This is Test One.",
  },
  {
    name: "TestTwo",
    brand: "TestBrandTwo",
    price: "$23.33",
    description: "This is Test Two.",
  },
  {
    name: "TestThree",
    brand: "TestBrandThree",
    price: "$278.33",
    description: "This is Test Three.",
  },
  {
    name: "TestFour",
    brand: "TestBrandFour",
    price: "$244.33",
    description: "This is Test Four.",
  },
  {
    name: "TestFive",
    brand: "TestBrandFive",
    price: "$25.33",
    description: "This is Test Five.",
  },
])

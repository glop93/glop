# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = ["Books", "Bicycles", "Electronics","Fashion & Clothing", "Sports", "Cars", "Other"]
categories.each{|d| Category.where(:name => d).first_or_create!}

universities = ["Universidad de Salamanca", "Universidad de Madrid", "Universidad de Valencia"]
universities.each{|u| University.where(:name => u).first_or_create!}
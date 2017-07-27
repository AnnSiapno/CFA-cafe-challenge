require 'artii'
require 'terminal-table'
require 'tty-prompt'


# Define the classes
class MenuItem

  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end

  attr_accessor :name, :price, :description


  def self.all
    ObjectSpace.each_object(self).to_a
  end

end


class OrderItem

  def initialize(item, quantity, price)
    @item = item
    @quantity = quantity
    @price = price
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.count
    all.count
  end

  attr_accessor :item, :quantity, :price

end

# Create the Menu Items
@wedges = MenuItem.new("Sweet Potato Wedges", 6.5, "Baked sweet potato wedges")
@springrolls = MenuItem.new("Spring Rolls", 5.5, "Homemade spring roles")
@soup = MenuItem.new("Soup", 5.0, "Soup of the day")

@salad = MenuItem.new("Salad", 9.0, "Fresh salad")
@steak = MenuItem.new("Steak", 19.5, "Aussie steak")
@lamb = MenuItem.new("Lamb", 17.5, "Lamb chops with mint sauce")
@sandwich = MenuItem.new("Sandwich", 14.0, "Steak sandwich with BBQ sauce")

@cake = MenuItem.new("Cake", 6.0, "Mud cake")
@icecream = MenuItem.new("Ice Cream", 5.0, "Choc Chip Ice Cream")

@coffee = MenuItem.new("Coffee", 3.0, "Warm coffee")
@tea = MenuItem.new("Tea", 3.0, "Hot tea")
@milkshake = MenuItem.new("Milkshake", 5.5, "Chilled milkshake")
@beer = MenuItem.new("Beer", 7.0, "Local beer")
@redwine = MenuItem.new("Red Wine", 8.5, "Dry Red Wine")
@whitewine = MenuItem.new("White Wine", 8.5, "Dry White Wine")
@daiquiri = MenuItem.new("Mango Daiquiri", 12, "Made from fresh mangos")
@longisland = MenuItem.new("Long Island Iced Tea", 12, "For a guarantee knock-out")
@martini = MenuItem.new("Espresso Martini", 12, "From Arabica coffee beans")
@mojito = MenuItem.new("Mojito", 12, "Fruit Mojito")
@pinacolada = MenuItem.new("Pina Colada", 12, "For that islander taste")
@cosmopolitan = MenuItem.new("Cosmopolitan", 12, "Perfect for the ladies")



# Create menus
title = Artii::Base.new :font => 'slant'

# Set value of Artii and prints it
puts title.asciify("Ann's Cafe")

# Create the tables
@menus = []
@menus << ['Entree']
@menus << ['Main']
@menus << ['Dessert']
@menus << ['Drinks']
@menu_table = Terminal::Table.new :rows => @menus

@entree = []
@entree << ['Items', 'Price', "Description"]
@entree << [@wedges.name, @wedges.price, @wedges.description]
@entree << [@springrolls.name, @springrolls.price, @springrolls.description]
@entree << [@soup.name, @soup.price, @soup.description]
@entree_menu = Terminal::Table.new :rows => @entree

@main = []
@main << ['Items', 'Price', "Description"]
@main << [@salad.name, @salad.price, @salad.description]
@main << [@steak.name, @steak.price, @steak.description]
@main << [@lamb.name, @lamb.price, @lamb.description]
@main << [@sandwich.name, @sandwich.price, @sandwich.description]
@main_menu = Terminal::Table.new :rows => @main

@dessert = []
@dessert << ['Items', 'Price', "Description"]
@dessert << [@cake.name, @cake.price, @cake.description]
@dessert << [@icecream.name, @icecream.price, @icecream.description]
@dessert_menu = Terminal::Table.new :rows => @dessert

@drinks = []
@drinks << ['Items', 'Price', "Description"]
@drinks << [@coffee.name, @coffee.price, @coffee.description]
@drinks << [@tea.name, @tea.price, @tea.description]
@drinks << [@milkshake.name, @milkshake.price, @milkshake.description]
@drinks << [@beer.name, @beer.price, @beer.description]
@drinks << [@redwine.name, @redwine.price, @redwine.description]
@drinks << [@whitewine.name, @whitewine.price, @whitewine.description]
@drinks << [@daiquiri.name, @daiquiri.price, @daiquiri.description]
@drinks << [@longisland.name, @longisland.price, @longisland.description]
@drinks << [@martini.name, @martini.price, @martini.description]
@drinks << [@mojito.name, @mojito.price, @mojito.description]
@drinks << [@pinacolada.name, @pinacolada.price, @pinacolada.description]
@drinks << [@cosmopolitan.name, @cosmopolitan.price, @cosmopolitan.description]
@drinks_menu = Terminal::Table.new :rows => @drinks


# Create the functions
 def options()
   prompt = TTY::Prompt.new

   puts "\n"

   selector = prompt.select("What would you like to do?") do |menu|
     menu.choice "View a Menu"
     menu.choice "Order Items"
     menu.choice "Ask For Bill"
   end

   case selector
    when "View a Menu"
      show_menu()
    when "Order Items"
      order_menu()
    when "Ask For Bill"
      bill()
    end
 end


def show_menu()
  prompt = TTY::Prompt.new

  puts "\n"

  selector = prompt.select("Which menu would you like to look at?") do |menu|
    menu.choice "Entree"
    menu.choice "Main"
    menu.choice "Dessert"
    menu.choice "Drinks"
  end

  case selector
  when "Entree"
    puts @entree_menu
    options()
  when "Main"
    puts @main_menu
    options()
  when "Dessert"
    puts @dessert_menu
    options()
  when "Drinks"
    puts @drinks_menu
    options()
  end
end

def order_menu
  prompt = TTY::Prompt.new

  puts "\n"

  selector = prompt.select("Which menu would you like to order from?") do |menu|
    menu.choice "Entree"
    menu.choice "Main"
    menu.choice "Dessert"
    menu.choice "Drinks"
  end

  case selector
    when "Entree"
      entree()
    when "Main"
      main()
    when "Dessert"
      dessert()
    when "Drinks"
      drinks()
  end
end

def entree
  puts @entree_menu
  prompt = TTY::Prompt.new

  puts "\n"

  selector = prompt.select("What would you like to order?") do |menu|
    menu.choice "Sweet Potato Wedges"
    menu.choice "Spring Rolls"
    menu.choice "Soup"
  end

  case selector
    when "Sweet Potato Wedges"
      place_order(@springrolls)
    when "Spring Rolls"
      place_order(@springrolls)
    when "Soup"
      place_order(@soup)
  end
end

def main
  puts @main_menu
  prompt = TTY::Prompt.new

  puts "\n"

  selector = prompt.select("What would you like to order?") do |menu|
    menu.choice "Salad"
    menu.choice "Steak"
    menu.choice "Lamb"
    menu.choice "Sandwich"
  end

  case selector
    when "Salad"
      place_order(@salad)
    when "Steak"
      place_order(@steak)
    when "Lamb"
      place_order(@lamb)
    when "Sandwich"
      place_order(@sandwich)
  end
end

def dessert
  puts @dessert_menu
  prompt = TTY::Prompt.new

  puts "\n"

  selector = prompt.select("What would you like to order?") do |menu|
    menu.choice "Cake"
    menu.choice "Ice Cream"
  end

  case selector
    when "Cake"
      place_order(@cake)
    when "Ice Cream"
      place_order(@icecream)
  end
end

def drinks
  puts @drinks_menu
  prompt = TTY::Prompt.new

  puts "\n"

  selector = prompt.select("What would you like to order?") do |menu|
    menu.choice "Coffee"
    menu.choice "Tea"
    menu.choice "Milkshake"
    menu.choice "Beer"
    menu.choice "Red Wine"
    menu.choice "White Wine"
    menu.choice "Mango Daiquiri"
    menu.choice "Long Island Iced Tea"
    menu.choice "Espresso Martini"
    menu.choice "Mojito"
    menu.choice "Pina Colada"
    menu.choice "Cosmopolitan"
  end

  case selector
    when "Coffee"
      place_order(@coffee)
    when "Tea"
      place_order(@wine)
    when "Milkshake"
      place_order(@milkshake)
    when "Beer"
      place_order(@beer)
    when "Red Wine"
      place_order(@redwine)
    when "White Wine"
      place_order(@whitewine)
    when "Mango Daiquiri"
      place_order(@daiquiri)
    when "Long Island Iced Tea"
      place_order(@longisland)
    when "Espresso Martini"
      place_order(@martini)
    when "Mojito"
      place_order(@mojito)
    when "Pina Colada"
      place_order(@pinacolada)
    when "Cosmopolitan"
      place_order(@cosmopolitan)
  end
end

def place_order(item)
  puts "How many?"
  print ">"
  quantity = gets.chomp
  puts "Please enter special requirements: "
  requirements = gets.chomp
  @orderitems << item.name
  @itemquantity << quantity
  @unitprice << item.price
  @total += quantity.to_i * item.price
  puts "That was #{quantity} x #{item.name}..."

  anything_else()

end

def anything_else
  prompt = TTY::Prompt.new

  puts "\n"

  selector = prompt.select("Would you like to order anything else?") do |menu|
    menu.choice "Yes"
    menu.choice "No"
  end

  case selector
    when "Yes"
      order_menu()
    when "No"
      bill()
  end
end

def bill()
  puts "Your Bill:"
  bill = []
  bill << ['Items', 'Quantity', "Unit Price"]
  i = 0
  while i < @orderitems.length()
    bill << [@orderitems[i], @itemquantity[i], @unitprice[i]]
    i += 1
  end
  bill_table = Terminal::Table.new :rows => bill
  puts bill_table
  puts "Your total is: #{@total}"
  payment()
end

def payment()
  prompt = TTY::Prompt.new

  puts "\n"

  selector = prompt.select("How would you like to pay?") do |menu|
    menu.choice "Cash"
    menu.choice "Card"
  end

  case selector
  when "Cash"
      puts "Thank you, have a great day!"
    when "Card"
      puts "There will be a 1.5% surcharge, your new total is #{@total * 1.015}"
      puts "Please enter a pin"
      print "> "
      pin = gets.chomp
      puts "Thank you, have a great day!"
  end
end


puts "Welcome to Ann's cafe!"
  @orderitems = []
  @itemquantity = []
  @unitprice = []
  @total = 0
options()

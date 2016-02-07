#This program should be a simple to do list

#choices should be add, delete, view, modify, exit

#Create a multi dimentional array to store to do list

  
  def option_add
  end
  
  def option_del
  end
  
  def option_mod
  end
  
  def option_view
  end
  
  def option_exit
  quitx += 1
  end
  

quitx = 0
#get the option form the user
until quitx == 1
  puts "What would you like to do?"
  puts "Add, Delete, Modify, View, Exit"
  choice = gets.chomp
  choice = choice.to_s.downcase
  case choice
    when "add" then puts "add"
    when "delete" then puts "delete"
	when "modify" then puts "modify"
    when "view" then puts "view"
    when "delete" then puts "delete"
    when "exit" 
	  puts "exit"
	  quitx += 1
    else  puts "I didn't understand, please type a choice as listed."
  end
end
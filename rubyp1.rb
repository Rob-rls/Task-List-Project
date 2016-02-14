#This program should be a simple to do list
#the user can add, delete, view, modify, and exit
#Create an array to store to do list
#The array should be stored in an external file that is recalled when run again
#the program requries a file named listdata.txt to be stored in the same directory before it can be run

def select_item #this gets the user input when a specific item in the list needs to be selected
  valid_option = false
  while valid_option == false
    item_num = Integer(gets) rescue false
    if item_num == false
	  puts "Please enter a valid option."
  	elsif item_num > 0 and $to_do_list[item_num - 1] != nil
      valid_option = true
	else
	  puts "Please enter a valid option."
	end
  end
  return item_num - 1
end
  
def option_add (menu_opt) #add a new item to the list
  puts "What would like to #{menu_opt}?"
  new_item = $stdin.gets
end
  
def option_del  #delete an item
  option_view
  puts "Which item number would you like to delete? "
  del_item = select_item
  $to_do_list.slice!(del_item)
end
  
def option_mod #change an item on the list
  option_view
  puts "Which item number would you like to modify? "
  mod_item_num = select_item
  add_item = option_add("modify it to")
  $to_do_list[mod_item_num] = add_item
end
  
def option_view #displays each item in the list
	puts "Your current items to do are as follows:\n\n"
	puts "*" * 15
	$to_do_list.each do |item|
	  puts "#{$to_do_list.index(item) + 1} - #{item}"
	end
	puts "*" * 15, "\n"
end

#opens the previous to do list and saves it to an array
#creates the to do list as a global vriable in order for it to be used in methods
$to_do_list = Array.new
file_name = "listdata.txt"
read_file = open(file_name)
$to_do_list = File.readlines(file_name)
read_file.close

#get the option form the user; the below menu loops until the exit option is selected
quitx = 0
until quitx == 1
  
  puts "What would you like to do?"
  puts "Add, Delete, Modify, View, Exit"
  choice = gets.chomp
  choice = choice.to_s.downcase
  
  case choice
  
    when "add" 
	  add_item = option_add("add")
	  $to_do_list.push(add_item)
	  puts "You have added: #{add_item}"
	  
    when "delete" 
	  puts "You have delted: #{option_del}"
		
	when "modify" 
	  puts "The item now reads: #{option_mod}"
    
	when "view" 
      option_view

    when "exit" 
	  puts "Saving list and exiting..."
	  quitx += 1
	  
    else  puts "I didn't understand, please type a choice as listed."
  end
end

#saves the to do list to file
writefile = open(file_name, "w")
$to_do_list.each {|item| writefile.write(item)}
writefile.close
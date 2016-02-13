#This program should be a simple to do list
#choices should be add, delete, view, modify, exit
#Create an array to store to do list
#The array should be stored in an external file that is recalled when run again
#the program requries a file named listdata.txt to be stored in the same directory before it can be run
  
def option_add (menu_opt)
  puts "What would like to #{menu_opt}?"
  new_item = $stdin.gets
  end
  
def option_del #need to add check to make sure option is valid
  option_view
  puts "Which item number would you like to delete? "
  del_item = $stdin.gets.chomp.to_i
  $to_do_list.slice!(del_item - 1)
end
  
def option_mod
  option_view
  puts "Which item number would you like to modify? "
  mod_item_num = $stdin.gets.chomp.to_i
  add_item = option_add("modify it to")
  $to_do_list[mod_item_num - 1] = add_item
  
end
  
def option_view
	puts "Your current items to do are as follows: "
	$to_do_list.each do |item|
	  puts "#{$to_do_list.index(item) + 1}- #{item}"
	end
end

#opens the previous to do list and saves it to an array
$to_do_list = Array.new
file_name = "listdata.txt"
read_file = open(file_name)
$to_do_list = File.readlines(file_name)
read_file.close

#get the option form the user; the below menu loops until the exit optin is selected
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
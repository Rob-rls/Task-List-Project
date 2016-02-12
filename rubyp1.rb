#This program should be a simple to do list
#choices should be add, delete, view, modify, exit
#Create an array to store to do list
#The array should be stored in an external file
  
def option_add
  puts "What is it you would like to add? "
  new_item = $stdin.gets
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

#opens the previous to do list and saves it to an array
to_do_list = Array.new
file_name = "listdata.txt"
read_file = open(file_name)
to_do_list = File.readlines(file_name)
read_file.close
#the below puts were for debugging the IO File - remove from final version
puts to_do_list
puts to_do_list.class

quitx = 0
#get the option form the user
until quitx == 1
  
  puts "What would you like to do?"
  puts "Add, Delete, Modify, View, Exit"
  choice = gets.chomp
  choice = choice.to_s.downcase
  
  case choice
  
    when "add" 
	  add_item = option_add
	  to_do_list.push(add_item)
	  puts "You have added: #{add_item}"
	  
    when "delete" then puts "delete"
	
	when "modify" then puts "modify"
    
	when "view" then puts "view"
    
	when "delete" then puts "delete"
	
    when "exit" 
	  puts "exiting..."
	  quitx += 1
	  
    else  puts "I didn't understand, please type a choice as listed."
  end
end

writefile = open(file_name, "w")
to_do_list.each {|item| writefile.write(item)}
writefile.close
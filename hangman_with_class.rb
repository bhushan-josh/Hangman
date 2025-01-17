class Hangman
  def initialize 
    @hint = ['Animal','Body Part','Fruit','Food', 'Profession']
    @word_to_guess = ['DOG','HEAD','APPLE', 'BIRYANI','PILOT']
    @currect_guess = false
    @choice = "yes"
    @chances = 5
    @level = 0
  end

  def play
    loop do
      current_word = @word_to_guess[@level]
      display_string = '-' * current_word.length
  
      while @chances > 0 && current_word != display_string
        unless @choice == "no" || @choice == "n" 
          print "\n"
          print "------------------------------------ HangMan ------------------------------------\n"
          print "\n\n"
          print "Guess the word by help of given @hint, You have 5 @chances".center(80)
          print "\n\n"
          print ("@level : #{@level + 1}\t @chances :  #{@chances}").center(80)
          print "\n\n"
          puts "---------------------------------------------------------------------------------"
          print "\n"
          print ("@hint => #{@hint[@level]}").center(80)
          print "\n\n"
          puts "---------------------------------------------------------------------------------"
          print "\n\n"
          print ("[#{display_string}]").center(80)
          print "\n"
  
          user_input = gets.chomp
          
          # Lower case convert to upcase
          if user_input >= 'a' and user_input <= 'z'
            user_input = user_input.upcase
          end
          
          if user_input.length == 1
            @currect_guess = false
            for i in 0..current_word.length do 
              if current_word[i] == user_input
                display_string[i] = user_input
                @currect_guess = true
              end
            end
          elsif user_input.length == 0
            puts "Empty input, Please enter valid input".center(80)
          else
            @chances -= 1
            puts "Single letter only, Remaining @chances : #{@chances}".center(80)
          end
  
          if @currect_guess and user_input.length == 1
            puts ("Right guess, Continue").center(80)
          elsif @currect_guess == false and user_input.length == 1
            @chances -= 1
            puts ("Wrong guess, Remaining @chances : #{@chances}").center(80)
          end
  
          sleep(1)
          system("clear")
  
          if current_word == display_string
            print "\n"
            puts "---------------------------------------------------------------------------------"
            print "\n"
            print ("Congratulation, @level #{@level + 1} has been cleared!!!").center(80)
            print "\n"
            print ("Do you want to play next @level (yes/no) : \n").center(80)
            @choice = gets.chomp.downcase
            print "\n\n"
            puts "---------------------------------------------------------------------------------"
          elsif @chances == 0 and current_word != display_string
            print "\n"
            puts "---------------------------------------------------------------------------------"
            print "\n"
            puts "You are dead, Try again!!!".center(80)
            break
          end
        else
          return
        end
      end
  
      # To exit game after all @chances end.
      if @chances == 0 and current_word != display_string
        break
      end
  
      @chances = 5
      @level += 1
  
      if @level == 5
        print "\n-------------------- You had successfully completed the Game --------------------\n"
        break
      end
  
      sleep(2)
      system("clear")
    end
  
    print "\n----------------------------------- ©bhushan ------------------------------------\n"
    print "---------------------------------------------------------------------------------\n"
  
    sleep(3)
    system("clear")
  
  end
  
end

system("clear")
game = Hangman.new
game.play
module AppQuestions
  def app_questions
    puts "What is the name of the application?"
    @application_name = gets.chomp

    puts "What language do you want to use?"
    @language = gets.chomp

    puts "What is your name?"
    @owner = gets.chomp

    application_generator(@application_name, @language)
    puts "Application: #{@application_name} has been created"
  end
end
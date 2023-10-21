class Question

  attr_accessor :question

  def generate_question
    number_one = rand(1..20)
    number_two = rand(1..20)
    @question = "What does #{number_one} plus #{number_two} equal?"
  end
end

# Design a Scalable Chatbot Simulator

# Define Chatbot Class
class Chatbot
  attr_accessor :name, :intents, :responses

  def initialize(name)
    @name = name
    @intents = {}
    @responses = {}
  end

  def add_intent(intent, response)
    @intents[intent] = response
    @responses[response] = intent
  end

  def process_input(input)
    intent = @intents.key(input) || @responses.key(input)
    return "I didn't understand that" if intent.nil?
    respond(intent)
  end

  private

  def respond(intent)
    @responses[intent]
  end
end

# Define Simulator Class
class Simulator
  def self.run(chatbot, inputs)
    inputs.each do |input|
      puts "User: #{input}"
      puts "Chatbot: #{chatbot.process_input(input)}"
    end
  end
end

# Create a Chatbot instance
chatbot = Chatbot.new("Crez")

# Train the Chatbot
chatbot.add_intent("hello", "Hi! How can I help you today?")
chatbot.add_intent("how are you", "I'm doing great, thanks!")
chatbot.add_intent("what is your name", "My name is Crez, nice to meet you!")

# Define inputs for the Simulator
inputs = ["hello", "how are you", "what is your name", "I love you"]

# Run the Simulator
Simulator.run(chatbot, inputs)
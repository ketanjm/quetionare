require 'spec_helper'

# describe Questionnaire do
#   before do
#     @dog = AwesomeGem::Awesome.new(name: 'woofer!')
#   end

#   it 'should have a name' do
#     @dog.name.should eq 'woofer!'
#   end

#   context '#lick_things' do
#     it 'should return the dog\'s name in a string' do
#       @dog.lick_things.should include 'woofer!:'
#     end
#   end
  
# end



require_relative '../questionnaire'

describe Questionnaire do
  describe '#do_prompt' do
    it 'do_prompt quetions for answers' do
      input = "hello\n" # Add '\n' to simulate input from a file
      expected_report = "Processed input: hello, Processed output: olleh, Final output: olleh"
      expect(process_input(input)).to eq(expected_report)
    end

    # Add more test cases as needed
  end
end


# describe Questionnaire do
#   describe 'do_prompt' do
#     it 'does prompt' do
#       byebug 
#       expect(add(2, 3)).to eq(5)
#     end
    
    # it 'adds a positive and a negative number' do
    #   expect(add(2, -3)).to eq(-1)
    # end
    
    # it 'adds two negative numbers' do
    #   expect(add(-2, -3)).to eq(-5)
    # end
    
    # it 'adds zero to a number' do
    #   expect(add(0, 5)).to eq(5)
    # end
    
    # it 'adds two zero numbers' do
    #   expect(add(0, 0)).to eq(0)
    # end
#   end
# end
require "pstore" # https://github.com/ruby/pstore
require 'byebug'

STORE_NAME = "tendable.pstore"
store = PStore.new(STORE_NAME)

QUESTIONS = {
  q1: "Can you code in Ruby?",
  q2: "Can you code in JavaScript?",
  q3: "Can you code in Swift?",
  q4: "Can you code in Java?",
  q5: "Can you code in C#?"
}.freeze

# TODO: FULLY IMPLEMENT
def do_prompt(store)
  # Ask each question and get an answer from the user's input.
  print 'Enter uniq name: '
  name = gets.chomp.downcase
  
  store.transaction do
    if store[:questionnaire][name]
      print "Already given answers! your score #{ store[:questionnaire][name][:score]} %"
      exit
    end

    QUESTIONS.each_key do |question_key|
      print "#{ QUESTIONS[question_key] }: "
      ans = gets.chomp.downcase
      until ['yes', 'y', 'no', 'n'].include?(ans)
        puts "Please enter 'Yes' or 'No'or 'Y' or 'N'."
        ans = gets.chomp.downcase
      end

      # store.roots.each do |root|
      #   store.delete(root)
      # end
      # exit

      store[:questionnaire] ||= {}
      store[:questionnaire][name] ||= {}
      store[:questionnaire][name][question_key] = ans 
    end
  end
  do_report(store, name)
end

def do_report(store, name = nil)
  unless name
    print 'Enter uniq name to ger report for: '
    name = gets.chomp.downcase
  end
  # TODO: IMPLEMENT
  yes = 0
  no = 0
  store.transaction do
    (print 'Could not find name!!' and exit)  unless store[:questionnaire][name]
    QUESTIONS.each_key do |question_key|
      yes = yes + 1 if ['yes', 'y'].include? store[:questionnaire][name][question_key]
      no = no + 1 if ['no', 'n'].include? store[:questionnaire][name][question_key]
    end
    score = (100 * yes / store[:questionnaire][name].size)
    puts score
    store[:questionnaire][name][:score] = score
  end  
end

do_prompt store
# do_report store

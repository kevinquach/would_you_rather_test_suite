module Seeders
  module Questions
    class << self
      def seed

        questions.each do |description, options|
          question = Question.new
          question.description = description

          options.each do |option|
            option = question.options.build({content: option})
            question.options << option
          end

        end
      end

      def questions
        {
          "Language" => [
            "Be able to speak and write in every language",
            "Be able to read and listen (understand speech) in every language"
          ],
          "Free for year" => [
            "Free Starbucks for a year",
            "Free iTunes music for a year"
          ],
          "Living situation" => [
            "Live in a retirement home",
            "Live in a mental institution where everyone is hot"
          ],
          "Lying" => [
            "Always know when someone is lying",
            "Always get away with lying"
          ],
          "Fantasy" => [
            "Have mermaids be real",
            "Have unicorns be real"
          ]
        }
      end
    end
  end
end

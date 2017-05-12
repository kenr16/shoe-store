class Brand < ActiveRecord::Base
  validates :name, presence: true, length: { in: 3..100 }, :uniqueness => true

  has_many :relationships
  has_many :stores, through: :relationships

  before_save(:downcase_name)
  before_save(:capitalize_first)

  private

  def downcase_name
    self.name = name.downcase
  end

  def capitalize_first
    word_array = name.split(" ")
    final_output = []
    word_array.each do |word|
      if word == 'and' || word == 'of' || word == 'or'
        final_output.push(word)
      else
        letter_array = word.split("")
        letter_array[0].upcase!
        final_output.push(letter_array.join)
      end

    end

    self.name = final_output.join(" ")
  end
end

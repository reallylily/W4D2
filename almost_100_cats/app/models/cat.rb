# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(2)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLOR = %w(black white orange calico brown spotted)
  SEX = %w(M F TF TM NB)
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLOR,
      message: "%{value} isn't even a real cat color you idiot!!" }
  validates :sex, inclusion: { in: SEX,
      message: "Sorry. We'll get woke about the %{value} gender as soon as we can" }

  def age
    DateTime.now.year - self.birth_date.year 
  end
end

# kitty1 = Cat.new(birth_date: '2012/06/20', color: 'black', name: 'Cats Malone', sex: 'NB')         
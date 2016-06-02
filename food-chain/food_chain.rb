class FoodChain
  def self.song
    animals = %w(fly spider bird cat dog goat cow horse)
    song = ""

    animals.each do |animal|
      song << "I know an old lady who swallowed a #{animal}.\n"
      song << eval(animal)

      unless animal == "horse" || animal == "fly"
        previous_animals =  animals[0..animals.index(animal)]
        previous_animals.reverse.each do |prev_animal|
          unless prev_animal == "fly"
            song << swallowed(prev_animal, previous_animals[previous_animals.index(prev_animal) - 1])
          end
        end

        song << fly
      end
    end

    song
  end

  def self.swallowed(animal_1, animal_2)
    if animal_1 == "bird"
      "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
    else
      "She swallowed the #{animal_1} to catch the #{animal_2}.\n"
    end
  end

  def self.fly
    "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
  end

  def self.spider
    "It wriggled and jiggled and tickled inside her.\n"
  end

  def self.bird
    "How absurd to swallow a bird!\n"
  end

  def self.cat
    "Imagine that, to swallow a cat!\n"
  end

  def self.dog
    "What a hog, to swallow a dog!\n"
  end

  def self.goat
    "Just opened her throat and swallowed a goat!\n"
  end

  def self.cow
    "I don't know how she swallowed a cow!\n"
  end

  def self.horse
    "She's dead, of course!\n"
  end
end

class BookKeeping
  VERSION = 2
end

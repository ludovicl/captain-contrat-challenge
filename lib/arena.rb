# frozen_string_literal: true

module Arena
  mattr_accessor :fighter1_attacks, :fighter2_attacks
  mattr_accessor :fighter1, :fighter2
  class << self
    ##
    # This function confront two fighters, each attack is weighted by a random number
    # Input : fighter1, Fighter who will start the round
    #         fighter 2, oposant of fighter1
    #         weapon1, weapon from db/weapons.jon used by fighter1
    #         weapon2, weapon from db/weapons.jon used by fighter2
    # Output : {winner: fighter1, stats: [1, 2, 3], looser: fighter2, stats, [1, 2, 3] }
    #         winner is the fighter who win the arena, looser is the fighter who loose the arena
    #         stats are attacks given
    def result(fighter1, fighter2, weapon1 = nil, weapon2 = nil)
      self.fighter1_attacks = []
      self.fighter2_attacks = []
      self.fighter1 = fighter1
      self.fighter2 = fighter2
      assign_weapon(weapon1, weapon2)
      round while fighter1.health_points > 1 && fighter2.health_points > 1
      winner, looser = compute_result
      Combat.create(winner: winner[0], looser: looser[0])
      serialize(winner, looser)
    end

    private

    def round
      fighter1_attacks << fighter1.attack
      fighter2.health_points -= fighter1_attacks.last
      return if fighter2.health_points < 1

      fighter2_attacks << fighter2.attack
      fighter1.health_points -= fighter2_attacks.last
    end

    def compute_result
      winner = fighter1.health_points > fighter2.health_points ? [fighter1, fighter1_attacks] : [fighter2, fighter2_attacks]
      looser = fighter1.health_points < fighter2.health_points ? [fighter1, fighter1_attacks] : [fighter2, fighter2_attacks]
      [winner, looser]
    end

    def get_weapon_charact(weapon)
      weapon = JSON.parse(File.read('db/weapons.json'))[weapon]
      [weapon['attack'], weapon['defense']]
    end

    def assign_weapon(weapon1, weapon2)
      if weapon1
        as, hp = get_weapon_charact(weapon1)
        fighter1.health_points += hp
        fighter1.attack_strength += as
      end

      return unless weapon2

      as, hp = get_weapon_charact(weapon2)
      fighter2.health_points += hp
      fighter2.attack_strength += as
    end

    def serialize(winner, looser)
      {
        winner: { fighter: winner[0], stats: winner[1] },
        looser: { fighter: looser[0], stats: looser[1] }
      }
    end
  end
end

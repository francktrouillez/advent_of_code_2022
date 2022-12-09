module Day02
  module Game
    OPPONENT_CHOICES = ["A", "B", "C"]
    PLAYER_CHOICES = ["X", "Y", "Z"]
    OUTCOME_CHOICES = ["X", "Y", "Z"]

    def score(opponent, player)
      opponent_choice = OPPONENT_CHOICES.index(opponent)
      player_choice = PLAYER_CHOICES.index(player)

      player_choice + 1 + 3 * ((player_choice - opponent_choice + 1) % 3)
    end

    def move(opponent, outcome)
      opponent_choice = OPPONENT_CHOICES.index(opponent)
      outcome_choice = OUTCOME_CHOICES.index(outcome)

      PLAYER_CHOICES[(opponent_choice + outcome_choice - 1) % 3]
    end
  end
end

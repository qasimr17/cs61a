# Bee.action from the working EC2 solution. Reference only.
# Needs these on the Bee class:  scared_turns = 0 / has_been_scared = False

    def action(self, gamestate: GameState):
        """A Bee's action stings the Ant that blocks its exit if it is blocked,
        or moves to the exit of its current place otherwise.

        gamestate -- The GameState, used to access game state information.
        """
        blocked = self.blocked() and self.place is not None and self.place.ant

        # BEGIN Problem EC 2
        # Fear only redirects a Bee that would otherwise advance; a blocked Bee
        # still stings, and stinging is not an attempted retreat.
        if self.scared_turns > 0 and not blocked:
            self.scared_turns -= 1
            entrance = self.place.entrance if self.place else None
            if entrance is not None and not entrance.is_hive:
                self.move_to(entrance)
            return
        # END Problem EC 2

        destination = None
        if self.place:
            destination = self.place.exit

        if blocked:
            self.sting(self.place.ant)
        elif self.health > 0 and destination is not None:
            self.move_to(destination)

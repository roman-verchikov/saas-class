#!/usr/bin/ruby

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError if game.length != 2
    game.each { |v| raise NoSuchStrategyError unless v.last.match(%Q{[PRS]}) }

    if (game.last.last == 'P' && game.first.last == 'R' ||
        game.last.last == 'S' && game.first.last == 'P' ||
        game.last.last == 'R' && game.first.last == 'S') then
        return game.last
    end

    return game.first
end


def rps_tournament_winner(tournament)
    begin 
        return rps_game_winner(tournament)
    rescue
        winner1 = rps_tournament_winner(tournament.first)
        winner2 = rps_tournament_winner(tournament.last)

        return rps_game_winner([winner1, winner2])
    end
end


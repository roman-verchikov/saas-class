load 'rock_paper_scissors.rb'
load 'test_helpers.rb'

def test_wrong_number_of_players_rps_game_winner
    test_result = false

    begin
        wrong_number_of_players = [ ["Dave", "S"] ]
        rps_game_winner(wrong_number_of_players)
    rescue WrongNumberOfPlayersError
        test_result = true
    end

    return test_result
end

def test_no_such_strategy_error
    test_result = false

    begin
        # illegal value (must be one of RSP)
        game = [ ["Dave", "S"], ["Other guy", "Q"]]

        rps_game_winner(game)
    rescue NoSuchStrategyError 
        test_result = true
    end

    # must not throw error
    game = [ ["Dave", "P"], ["Other guy", "R"]] 

    rps_game_winner(game)

    return test_result
end

def test_game_winner
    game = [ ["Dave", "P"], ["Other guy", "R"]] 
    test_result = (rps_game_winner(game) == game.first)

    game = [ ["Dave", "S"], ["Other guy", "R"]] 
    test_result = test_result && (rps_game_winner(game) == game.last)

    game = [ ["Dave", "S"], ["Other guy", "S"]] 
    test_result = test_result && (rps_game_winner(game) == game.first)

    game = [ ["Dave", "R"], ["Other guy", "P"]] 
    test_result = test_result && (rps_game_winner(game) == game.last)

    return test_result
end

def test_tournament
    tournament = 
        [
            # B1
            [
                # B1
                [
                    [ ["A1", "P"], ["A2", "S"] ],
                    [ ["B1", "R"], ["B2", "S"] ],
                ],
                # C1
                [
                    [ ["C1", "S"], ["C2", "P"] ],
                    [ ["D1", "R"], ["D2", "P"] ]
                ]
            ],
            # G2
            [
                # E2
                [
                    [ ["E1", "P"], ["E2", "S"] ],
                    [ ["F1", "R"], ["F2", "P"] ],
                ],
                # G2
                [
                    [ ["G1", "S"], ["G2", "R"] ],
                    [ ["H1", "R"], ["H2", "S"] ]
                ]
            ]
        ]

    test_result = (rps_tournament_winner(tournament) == ["B1", "R"])

    return test_result 
end

run_test :test_wrong_number_of_players_rps_game_winner, "Wrong number of players test"
run_test :test_no_such_strategy_error, "Illegal strategy test"
run_test :test_game_winner, "Game logic test"
run_test :test_tournament, "Tournament test"


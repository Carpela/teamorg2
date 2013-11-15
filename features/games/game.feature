Feature: Organise games
  In order to organise games
  An organiser
  Should be able to create games
    Scenario: Create Game
      Given I am signed in
      When I visit the new game page
      And I fill in:
      | name | Game1 |
      | players | 5 |    
      | sides | 2 |
      | Date | Date.today + 1.weeks   |
      | Time     | 12:00   |
      # This should be a 5 a side game
      # Sides should default to  but one should be an option
      # format should have options 5, 6, 7, 11
      And I click submit
      Then A new game should be created
      And I should be on the game page
      And I should see an add players section
      And I should see an available section
      And I should see an unavailable section
      And I should see a selected section 
      And the selected section should have a list for the number of players required     
    
    @wip
    Scenario: Invite players
      Given I am logged in
      And a game exists that I organized
      And some players exist
      When I visit the game page
      Then I should see a list of players in the players section
      And I should see an invite button
      When I click the invite button
      Then I should send an email to all players
      And the email should contain
      |Time|
      |Date|
      |Location|
      And the email should contain a link to the game
      When they click on the game link in the email
      Then they should be on the game page

    @wip 
    Scenario: Add yourself to the game
      Given a game exists
      When I visit the game page
      Then I should see a section "Add Player"
      And I should see a field "Name"
      And I should see a field "Email"
      And I fill in:
        | name | Bob | 
        |email | bob@example.com|
      And I press return
      Then I should be on the game page
      And I should see "Bob" in the players section
      And I should see an Available button
      And I should see an Unavailable button
      When I click the Available button
      Then I should see "Bob" in the Available section


    @wip 
    Scenario: Add yourself to the game without email
      Given a game exists
      When I visit the game page
      Then I should see a section "Add Player"
      And I should see a field "Name"
      When I fill in
        | name | Bob | 
      Then I should see "Bob (@!)" in the players section
      And I should see "Bob" in the players section
      And I should see an Available button
      And I should see an Unavailable button
      When I click the Available button
      Then I should see "Bob" in the Available section

    @wip
    Scenario: Email reply - available
      Given I have a list of people to invite
      When my email is sent out
      Then it should contain a link for "Available" specific to that player
      And it should contain a link for "Not Available" specific to that player
      When they click "Available" in their invite email
      Then they should be on the game page
      And they should see their name in the available list
      When I log in
      And I visit the game page
      Then I should see their name in the available list 
    
    @wip
    Scenario: Email reply - unavailable
      Given I have a list of people to invite
      When my email is sent out
      Then it should contain a link for "Available" specific to that player
      And it should contain a link for "Not Available" specific to that player
      When they click "Unavailable" in their invite email
      Then they should be on the game page
      And they should see their name in the Unavailable list
      When I log in
      And I visit the game page
      Then I should see their name in the Unavailable list 
    @wip
    Scenario: Players declare and undeclare availability
      Given I have been invited to a game
      When I click 'Available'
      Then I should be on the game page
      And I should see my name in the "Available" list
      And I should see a "Unavailable" link next to my name
      When I click the "Unavailable" link
      Then I should see my name in the "Unavailable" list

    

    @wip
    Scenario: Select Players
      Given I am logged in as the game organizer
      And my game exists
      And a set of players exist for the game and have replied
      When I visit the game page
      Then I should see a list of unavailable players
      And I should see a list of available players with a select option
      And I should see a space for team selection
      When I click select on a player
      Then the player should move into the team selection space
      When I click "confirm selection"
      Then an email should be sent out to inform players they have been selected
    @wip
    Scenario: Set up team
      Given I am logged in as an organiser
      And I click on the link new team
      And I fill in a name
      And I submit
      Then I should be on the team show page
      When I click add players
      And I fill in a name and an email
      And I submit
      Then I should see the player name in my team list
    @wip
    Scenario: Populate team from email group
      Given I am logged in
      When I visit the "team" page
      Then I should see a link to add players
      When I click the add players link
      Then I should see a space to bulk add players by email addresses
      When I paste a set of email addresses into the space
      Then the system should break up the addresses and construct players from each one
      When I click "Add players"
      Then the system should add a player for each email address into my team
    @wip
    Scenario: Populate team from email group recognises existing players
    Given I am logged in
    And I am an organiser
    And I have players in my team
    When I visit the add players to team page
    And I paste a set of email addresses into the space
    Then the system should recognise existing players
    When I click "Add players"
    Then the system should not add players whose emails are already in place
    @wip
    Scenario: Associate user with player
      Given a player exists
      When that player received an invite
      Then they should see a link to add an account
      When they click the link add an account
      Then they should be prompted with a social login screen
      And should be able to log in with facebook
      When the facebook user is identified
      Then the user, player and social login should be linked
    
    @wip
    Scenario: Assign team
      Given a game exists that I have organised
      And a team exists that I have created
      And the team has players
      When I visit the game page
      Then should see an "Assign Team" dropdown
      When I select the team dropdown
      And click assign team
      Then I should be on the game page
      And I should see the players from the team in the players list




    @wip
    Scenario: Assign team automatically
      Given I am signed in
      And a team exists that I have created
      When I visit the new game page
      Then I should see a dropdown for team
      And if I select my team
      And create a new game
      Then I should be on the game page
      And I should see players from my team

    @wip
    Scenario: Add players from facebook

    @wip
    Scenario: Add players from gmail contacts

    @wip
    Scenario: Allow payments

    @wip
    Scenario: Different sports



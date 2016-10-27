# BoutTime
Enhanced quiz app

This game involves users taking historical events and seeing if they can put them in the correct chronological order. A single round of play consists of ordering four random events and there are six rounds played in one full game. When the user is finished ordering the events, they should be able to shake their phone to check whether or not the order is correct.

# Instructions
Create a list of at least 25 “historical” events to be used as the content for the game. If you’d like the game to be playable many times, we suggest a list of at least 40 events, but that is not required.

Create types to model events as well as any other entities you think should be modeled using custom types.

Create functions to randomly populate the events for each round of play, making sure no event appears twice in the same round of play. (An event may be repeated during a game, just not in an individual round.)

Create logic to allow users to re-order events using the up and down buttons. (Note, the labels containing the events should not move, but rather be re-populated when events are moved up and down.

Create a function to assess whether or not events were ordered correctly. Points should be awarded for fully correct solutions only and then another round of play begins. You can choose whether the oldest events should be at the top or at the bottom, depending on your game's content and feel free to add a text label or icon to signal that to to users.

Create a countdown timer to give users 60sec to correctly order the events. When the timer expires, the events are checked for correct order.

If a user completes the ordering in less than 60secs, they should be able to shake the device in order to check order immediately.

Create logic such that after 6 rounds of play the game concludes and a total score is displayed.

Build all user interface as per the provided mockups. The app should display correctly on any iPhone 4.7in or larger. Be sure to integrate the App Icons provided.

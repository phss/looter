# Game REST API

## POST /game/new { player_name }

{ 
  game_id: 123,
  room_id: 456
}

## GET /game/:game_id/room/:room_id

{
  description: "...", // TEMPLATE OR RAW DESCRIPTION
  enemies: [...],
  items: [...],
  directions: [
    'left': 678,
    'right': 901
  ]
  options: [
    {
      description: "...",
      type: GET|POST
      link: "..."
    } 
  ]
}

## POST /game/:game_id/action/:action_id???

{
  description: "...",
  link: "..."
}

## GET /game/:game_id/fight/:fight_id/turn/:turn_id

{
  room: ...,
  description: "...",
  stats: {
    health: 10,
    ...
  }
  enemies: [...],
  options: [...]
}

## GET /game/:game_id/now

{
  link: "..."
}

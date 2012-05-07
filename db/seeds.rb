room1 = Room.create(name: 'The Room', description: "Johnny and Lisa's Living Room")
room2 = Room.create(name: 'The Bedroom', description: "Oh hi Mark.")
room1.exits << Exit.create(name: 'Go up the stairs', destination_id: room2.id)
room2.exits << Exit.create(name: 'Go back', destination_id: room1.id)
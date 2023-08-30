# Clean the database
Group.destroy_all
Survivor.destroy_all
Resource.destroy_all
ZombieHorde.destroy_all

# Create groups
group1 = Group.create(name: 'The Wasteland Wanderers', location: 'Desolate Plains')
group2 = Group.create(name: 'The Last Hope', location: 'Hidden Valley')

# Create survivors
survivor1 = Survivor.create(name: 'Elena', health: 100, stamina: 80, hunger: 30, group: group1)
survivor2 = Survivor.create(name: 'Jackson', health: 90, stamina: 70, hunger: 20, group: group1)
survivor3 = Survivor.create(name: 'Mia', health: 80, stamina: 60, hunger: 40, group: group2)
survivor4 = Survivor.create(name: 'Noah', health: 95, stamina: 75, hunger: 25, group: group2)

# Create resources
resource1 = Resource.create(name: 'Canned Food', amount: 50, difficulty: 3)
resource2 = Resource.create(name: 'Fresh Water', amount: 30, difficulty: 2)
resource3 = Resource.create(name: 'Medical Supplies', amount: 20, difficulty: 5)
resource4 = Resource.create(name: 'Fuel', amount: 40, difficulty: 4)

# Create zombie hordes
zombie_horde1 = ZombieHorde.create(location: 'Abandoned City', threat_level: 4)
zombie_horde2 = ZombieHorde.create(location: 'Decaying Suburb', threat_level: 3)

puts 'Seeds successfully created!'

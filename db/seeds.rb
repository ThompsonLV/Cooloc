p "Destroying all data..."
Chore.destroy_all
SpendingToFlatmate.destroy_all
Invitation.destroy_all
Spending.destroy_all
Flatmate.destroy_all
Shopping.destroy_all
Event.destroy_all
Colocation.destroy_all
p 'done'

# Colocations -----------------------------------------
p "Creating colocation 1"
colocation1 = Colocation.create!(name: "Coloc 1")

p 'done'

# Flatmates -----------------------------------------
p "Creating flatmates"
jean = Flatmate.create!(
  first_name: "Jean",
  last_name: "Dupont",
  age: 25,
  birthday: "1996-01-01",
  description: "Je suis un coloc",
  colocation: colocation1
)

pierre = Flatmate.create!(
  first_name: "Pierre",
  last_name: "Edouard",
  age: 30,
  birthday: "1995-12-08",
  description: "Je suis un super coloc",
  colocation: colocation1
)

mathilde = Flatmate.create!(
  first_name: "Mathilde",
  last_name: "Mathieu",
  age: 22,
  birthday: "1998-04-19",
  description: "Je suis une coloc géniale",
  colocation: colocation1
)

marie = Flatmate.create!(
  first_name: "Marie",
  last_name: "Josette",
  age: 28,
  birthday: "1994-29-06",
  description: "Je suis une coloc normale",
  colocation: colocation1
)
  p 'done'

# Chores -----------------------------------------
p "Creating chores"
chores1 = Chore.create!(
  title: "Faire la vaisselle",
  content: "Faire la vaisselle de la semaine",
  begin_date: "2023-12-15",
  flatmate: jean,
  colocation: colocation1
)

chores2 = Chore.create!(
  title: "Passer l'aspirateur",
  content: "Passer l'aspirateur dans le salon",
  begin_date: "2023-12-15",
  flatmate: pierre,
  colocation: colocation1
)

chores3 = Chore.create!(
  title: "Sortir les poubelles",
  content: "Sortir les poubelles le lundi soir",
  begin_date: "2023-12-15",
  flatmate: mathilde,
  colocation: colocation1
)
p 'done'

# Spendings -----------------------------------------
p "Creating spendings"
spending1 = Spending.create!(
  title: "Avance parc attraction",
  amount: 100,
)

spending2 = Spending.create!(
  title: "Avance charges",
  amount: 200)

p 'done'

# Shopping -----------------------------------------
p "Creating shopping"
tomatoes = Shopping.create!(
  item: "Tomates",
  bought: false,
  quantity: 2,
  colocation: colocation1
)

apples = Shopping.create!(
  item: "Pommes",
  bought: false,
  quantity: 3,
  colocation: colocation1
)

peaches = Shopping.create!(
  item: "Pêches",
  bought: false,
  quantity: 4,
  colocation: colocation1
)

p 'done'

# Events -----------------------------------------
p "Creating events"
night = Event.create!(
  title: "Soirée",
  description: "Soirée chez Jean",
  begin_date: "2023-12-15",
  end_date: "2023-12-15"
)

birthday = Event.create!(
  title: "Anniversaire",
  description: "Anniversaire de Pierre",
  begin_date: "2023-12-15",
  end_date: "2023-12-15"
)

christmas = Event.create!(
  title: "Repas",
  description: "Repas de Noël",
  begin_date: "2023-12-24",
  end_date: "2023-12-24"
)

p 'done'

# Invitations -----------------------------------------
p "Creating invitations"
Invitation.create!(
  event: night,
  flatmate: jean
)

Invitation.create!(
  event: birthday,
  flatmate: mathilde
  )

Invitation.create!(
  event: christmas,
  flatmate: marie
)

p 'done'

# SpendingToFlatmates -----------------------------------------
p "Creating spending_to_flatmates"
SpendingToFlatmate.create!(
  flatmate: jean,
  spending: spending1
)

SpendingToFlatmate.create!(
  flatmate: pierre,
  spending: spending2
)

p "Finished!"

require 'faker'

p "Destroying all data..."
Chore.destroy_all
SpendingToFlatmate.destroy_all
Invitation.destroy_all
Spending.destroy_all
Flatmate.destroy_all
Shopping.destroy_all
# Event.destroy_all
Colocation.destroy_all
p 'done'

# Colocations -----------------------------------------
p "Creating colocation 1"
colocation1 = Colocation.create!(name: "Coloc 1")

p 'done'

# Flatmates -----------------------------------------
p "Creating flatmates"

8.times do
  Flatmate.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '1980-01-01', to: '2003-12-31'),
    description: Faker::Lorem.sentence(word_count: 10),
    colocation_id: Colocation.pluck(:id).sample
  )
end
p 'done'

# Chores -----------------------------------------
# p "Creating chores"
# chores1 = Chore.create!(
#   title: "Faire la vaisselle",
#   content: "Faire la vaisselle de la semaine",
#   begin_date: "2023-12-15",
#   flatmate: jean,
#   colocation: colocation1
# )

# chores2 = Chore.create!(
#   title: "Passer l'aspirateur",
#   content: "Passer l'aspirateur dans le salon",
#   begin_date: "2023-12-15",
#   flatmate: pierre,
#   colocation: colocation1
# )

# chores3 = Chore.create!(
#   title: "Sortir les poubelles",
#   content: "Sortir les poubelles le lundi soir",
#   begin_date: "2023-12-15",
#   flatmate: mathilde,
#   colocation: colocation1
# )
# p 'done'

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
# p "Creating events"
# night = Event.create!(
#   title: "Soirée",
#   description: "Soirée chez Jean",
#   begin_date: "2023-12-15",
#   end_date: "2023-12-15"
# )

# birthday = Event.create!(
#   title: "Anniversaire",
#   description: "Anniversaire de Pierre",
#   begin_date: "2023-12-15",
#   end_date: "2023-12-15"
# )

# christmas = Event.create!(
#   title: "Repas",
#   description: "Repas de Noël",
#   begin_date: "2023-12-24",
#   end_date: "2023-12-24"
# )

# p 'done'

# # Invitations -----------------------------------------
# p "Creating invitations"
# Invitation.create!(
#   event: night,
#   flatmate: jean
# )

# Invitation.create!(
#   event: birthday,
#   flatmate: mathilde
#   )

# Invitation.create!(
#   event: christmas,
#   flatmate: marie
# )

# p 'done'

# SpendingToFlatmates -----------------------------------------
# p "Creating spending_to_flatmates"
# SpendingToFlatmate.create!(
#   flatmate: jean,
#   spending: spending1
# )

# SpendingToFlatmate.create!(
#   flatmate: pierre,
#   spending: spending2
# )

p "Finished!"

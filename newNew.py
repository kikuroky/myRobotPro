#Nesting Dictionary in a Dictionary
travel_log = {
    "Indonesia": {"city_visted": ["Jakarta", "Bali", "Yogyakarta",], "total_visited": 4},
}

#print(travel_log["Indonesia"])

#Nesting Dictionary in a List
travel_log_new = [
    {
        "country": "Indonesia",
        "city_visited": ["Jakarta", "Bali", "Yogyakarta"],
        "total_visted": 7
    },
]
#Create a Function
def add_country(country_visit, name_of_city, total_visit):
    new_country = {}
    new_country["country"] = country_visit
    new_country["city_visited"] = name_of_city
    new_country["total_visited"] = total_visit
    travel_log_new.append(new_country)

#Call the Function
add_country("Malaysia", ["Penang", "Kuala Lumpur"], 2)
print(travel_log_new)
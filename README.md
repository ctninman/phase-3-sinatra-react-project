# Take The Kids Out

### Sinatra/ActiveRecord - backend 

### React - frontend

<a href='https://github.com/ctninman/Take-The-Kids-Out-Phase3-Project'>Front-end Repo</a>

## Overview

Users can explore various cities to search for activities they and their children are likely to enjoy. Searches may be based upon age-level, or whether a location is outdoor or free. Users can add locations to their city, and add reviews to each of those locations. All data persists and is accessible to users upon refresh. 

## Database Tables

The database consists of 6 related tables:
- cities
- users
- locations
- reviews
- favorites
- kids

### City
- Has many users

- Has many locations

### User
- Belongs to city

- Has many favorites

- Has many reviews

- Has many locations through reviews

- Has many kids

### Location
- Belongs to city

- Has many favorites

- Has many reviews

- Has many users through reviews

### Review
- Belongs to user

- Belongs to location

### Favorite
- Has many users

- Has many locations

### Kid
- Belongs to user

## User

Login is not required to explore locations within a city, but various features are unlocked when a user is logged in. Login allows client to add an activity to a city, write a review for a location, and save and access locations as favorites, places to visit, or places they have visited. 

## Cities

Users may explore activities in any city in the database and filter the activities in a variety of methods, which include

### Free

- A list of all free activities

### Outdoor

- A list of all location that have outdoor activities

### Highest-Rated for Babies

- An ordered list of locations by the average score for children 0-12 months old

### Highest-Rated for Toddlers

- An ordered list of locations by the average score for children 1-3 years old

### Highest-Rated for Preschoolers

- An ordered list of locations by the average score for children 3-5 years old

### Highest-Rated for School-Age Kids

- An ordered list of locations by the average score for children 6-12 years old

### Highest-Rated for Adults

- An ordered list of locations by the average score for adults


  
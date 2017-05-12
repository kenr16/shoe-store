# Shoe Stores Friday Project

#### _Ken Rutan's Shoe Store Database Ruby App, May 12th, 2017_

#### By _**Ken Rutan**_

## Overview

This website will allow the user to enter new shoe stores and shoe brands into a database.  The shoe stores and shoe brands will have a many-to-many relationship with one another.  The project will also allow the user to visit an individual shoe store's site and select from the list of brands which one they would like that particular shoe store to register as carrying.  Likewise, they may select from a brand's website which stores will carry that brand.  You may visit the project at the following link:
- Github: https://github.com/kenr16/shoe-store

## Objective

The objective here was to create a PostgreSQL Database that would hold tables of a specific design.  From there, ruby object would be created that would correspond in form to the database tables in a way that allowed for rapid and easy modification of the database tables without specifically referencing individual values each time.  A many-to-many relationship is established inside the database via the creation of a third join table.  The use of Active Record should allow for seamless integration between the ruby back-end code and the database itself.

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
|Create an object class corresponding to the 'shoestore' table in the database.|*ID*, *name*|[1, "Bob's Shoestore"]|
|Create an object class corresponding to the 'Brands' table in the database.|*ID*, *name*, *cost*|[5, "Nike", $115.00]|

|Establish the many-to-many relationship by finding all brands assigned to a shoestore| shoestore1.brands |["Nike", "Addidas"]|
|Establish the same relationship backwards for finding all shoestores that carry a specific brand|brand1.shoestores|["Bob's Shoestore", "Sara's Closet"]|

## Installation

* In order to run this app:
  - Locate the git repository of this project.
  - Clone or download the git repository onto your desktop.
  - Locate home folder of the app "ie:/volunteer_tracker/"
  - Once you have navigated into this folder, open the command line or shell.
  - Once you have opened shell, run 'postgres' in the command line.
  - Open a new window in the command line/shell and run 'psql' for easy viewing of the database.
  - Open a third window in the command line and run the following commands:
  - "rake db:create"
  - "rake db:migrate"
  - run "ruby app.rb" which should open Sinatra.
  - The page should display when you navigate to localhost:4567 in the browser of your choice.

## Usage

Navigate to the 'shoe stores' or 'shoe brands' webpages and begin adding either shoe stores or shoe brands.  Once at least one of each has been created, you may begin adding relationships between the two.  From a shoe store's homepage, you may begin adding brands for that particular shoe store to carry.  From a brand's homepage, you may begin deciding which retailers will serve as outlets for that brand.  Both retailers and brands can be modified or deleted at will.

## Known Bugs
There are currently no known bugs in these HTML, CSS, Bootstrap, Ruby, Sinatra, PostgreSQL or Active Record files.

## Support and contact details

For further support, please contact Ken Rutan through his Github account. E-mail will not be listed here as this README is publicly displayed.

##Technologies Used

This website was constructed using HTML, CSS and Ruby as well as Sinatra, PostgreSQL and Active Record elements.

## License

Copyright (c) 2017 Ken Rutan.  This software is licensed under the MIT License.

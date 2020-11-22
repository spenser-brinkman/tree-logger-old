This application allows users to keep an inventory of trees growing on a property.  In its current state, the program allows a user to specify the date in which the tree was last inspected, along with its species, height, diameter, foliar density, and any additional comments the user would like to include relating to health issues, watering/fertilization schedules, animal nesting, etc.  At any point in the future, the user can go back to view a specific tree to either update or delete its data.

# Installation & Startup
1. Fork and clone this repository from GitHub into your coding environment of choice
2. Run `bundle install` to ensure all required Ruby Gems are present
3. Run `shotgun` to initialize TreeLogger on a server housed on your device
4. In your web browser, navigate to TreeLogger's homepage at http://localhost:9393/

# Flatiron Assessment Video & Blog
link
link

# Stretch Goals
- User can manage multiple properties
- Password complexity & length reqs
- User provides zip code which will help app generate list of endemic species on their homepage
- Homepage includes general tree-care links (ANSI standards, terminology, identification)
- Homepage provides resource to find local arborists
- Include age of tree (if known) & checkbox for new survey to mark a tree as "newly planted" to assign it a birthdate
- Homepage shows how many trees are saved
- Incorporate a Survey model, in which many trees can be added & updated at once. The data from a survey is added to a tree's history of surveys which may be viewed and altered. A tree would then contain a record of past data with corresponding visualiztions, etc
- Homepage shows most recent survey date
- Include a weather attribute for surveys
- Allow users to upload photograps of each tree
- Allow users to assign a "name" to each tree to help differentiate between multiple trees of the same species
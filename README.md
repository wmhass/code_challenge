# Code Challenge - iOS
---
This project is the implementation proposal for a iOS code challenge.

## The problem
---
- Create an iOS XCode project or workspace for this application in a new git repo.
- Asynchronously fetch and print (NSLog) the response data received from the API endpoint described above.
- Parse the retrieved JSON data into an array of objects of class `Guide`
- Display the `Guide` objects in a UITableView. Each table cell represents one `Guide` object and should display it's name, city, state, start date, and end date.
- Display the table cells sorted in ascending order by guide start date.


## The solution
---
To solve this challenge, `AFNetowrking` library was used to download the JSON data and to to parse the JSON into Object. This is one of the most common network libraries for iOS.

To show the loader while the data is being downloaded, the choice was the `SVProgressHUD`, which is a very very easy to use (to a standard loader, you only have to call one method to show, and another one to hide), with a great appearance.

To display the data, a standard `UITableViewController` was used, with a low level customisation (Custom cells and row height only). 

The main screen was inserted inside of a standard `UINavigationController` not only to display a `UINavigationBar` and handle a navigation item, but also, to be easy to create a navigation flow in the future (like an item detail view).

All 3rd party libraries was installed using `cocoapods` as dependency manager.

## Repository
---
All the App was developed in the `development` branch, and it was merged to the master at the end of the project, after everything be done.


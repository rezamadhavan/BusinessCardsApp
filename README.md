# BizCard

**App Name:** BizCard 

**App Tagline:** Moving the professional's preferred way of networking into a virtual environment.

**Links:**  
> IOS GitHub Repo: https://github.com/rezamadhavan/BusinessCardsApp.git  
> Backend Github Repo: https://github.com/rzrobin213/business-card-hack.git  

**Screenshots:**   
https://drive.google.com/drive/folders/1mIG-23LJ2mZvkIjQiBoml0G6KRE7kQWT?usp=sharing

**Description:** This app takes a traditional form of professional business conduct, the business card, into a more practical and modern design. In one page, we have a display of a simple business card, with one's picture, name, email, phone number, company, position, website, and unique code clearly visible. We imagined this page to be for any users that wanted to display their information for others like in a career fair. There is also a feature to add other users into your contacts using their distinct code. Your added contacts would appear in another tab, which lists basic information about each of your contacts. This would be the core networking component of this app, where one can connect with others using the app. This would be useful in a professional environment where passing a simple code can get you all relevant information about an associate.   

**Features:** 
- Add people to your contacts using their code. (Look at our screenshots for some codes)
- Edit you own business card and press the update button when finished.
- Rotate the phone to give you a nicer business card look. (when in profile view)
- View your contacts and delete them.

**How this app meets requirements:**  

For backend, the requirements were:
1) Designing an API, using database modeling, and implementing it using the Flask boilerplate code provided.  
2) Deployment to Google Cloud.  

We completed both of these requirements because to model users and contacts we used SQLAlchemy and modeled the data using the various database methods we learned in class. For our app, we also designed the API using Flask, creating routes for the front-end to interact with. Finally, we used the Google Cloud Platform to deploy our app so that it could be run remotely and so our IOS developers could interact with it.  

For frontend, the requirements were:
1) AutoLayout using NSLayoutConstraint or SnapKit
2) At least one UICollectionView or UITableView
3) Some form of navigation (UINavigationController or UITabBarController) to navigate between screens
4) Integration with an API - this API must provide some meaningful value to your app. For example, if you’re creating a music app, you could use the Apple Music API. Most of you will integrate with an API written by students in the backend course.

The entire UI is created using SnapKit to place all objects on the screen. A UITableView is used to display the user's contacts and each cell can be pressed to view the details of that contact. We used a UITabBarController to navigate between the user's profile, the add contact page, and the user's contacts page. The API is fully integrated with the app so that all information is stored in the API. Every time a user updates their profile, the API is called to update the user as well. Everytime the user views their contacts, the UITable is loaded using data that is retrieved from the API.

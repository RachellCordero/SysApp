# System Application 
 
##### Created By Rachell Cordero

This is a C#-based application built using .NET MVC framework where users may sign in with a username and password and each user can be given a role with corresponding permissions.


## Getting Started

These instructions will get you a local copy of the project up and running for development and testing. For information on how to install the project on a live system, see deployment.

### REQUIREMENTS

Application required:

```
Visual Studio 2022, Microsoft SQL
```

# Running the System
## Installation of System
Please follow the following steps to be able to run the system in your machine. 

1. Download the solution from the repository.
2. Open the solution in Visual Studio.
3. Open the AccountsDB.sql in your Microsoft SQL. AccountsDB is located in SysApp/DB/
4. Press F5 to run AccountsDB from SSMS.
```
This will generate all the stored procedures required in the system. 
```
5. In your Visual Studio, go to web.config and make sure that the connection string is correct.
6. Open Visual Studio and press F5 to run the solution.



# USAGE

1. To open the system, type the http address shown in the last line of the cmd window. Users are first taken to the login page when the application loads. He can log in using his registered username and password. 

2. However, if a user doesn't already have an account, he can create one by clicking "Create an Account," which will take him to the sign-up page. A user needs to provide a username, password, his first and last name and an email address to be able to sign up. upon signing up, he will be directed to the main page of the application. 


3. There are three pages available which can be selected in the side dashboard.  The first one is the users page that displays all user information. A user can be given a specific role on this page using Assign button. A user may be removed as well using Delete User button.


4. On the roles page, the available roles as well as their corresponding permissions can be seen. New roles can be created using the Add button and specific permissions for the role will be can be assigned as well. When additional permissions are created in the permissions page, it will also reflect in the roles page.

5. Lastly, the permissions page contains all the available permissions that can be assigned to a user. Additional permissions can be created using the add button and existing permissions can be deleted as well. Once a permission has been deleted, it will no longer reflect on the roles pages.  

6. To make the application look cleaner, the add and remove buttons are first hidden. Modal forms are then called to specify the exact roles and permissions that will be created. The delete buttons for each row will appear when the delete button is pushed.

7. There are three databases connected to the application, an account table containing the information of the users such as their user names, password, full name and email. A second table is created containing the roles and assigned permission to thes roles. Last table contains the permissions available to be assigned to a user. 

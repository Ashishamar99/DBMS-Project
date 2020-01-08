# DBMS-Project
This is a Blood Bank Management System for the administrator of the blood bank. Technology used is JSP and MySQL.


----------------------------------------------------------------------------------------------------------------------------------------
Softwares used -
Eclipse IDE - https://www.eclipse.org/downloads/
XAMPP Server - https://sourceforge.net/projects/xampp/
MySQL Workbench - https://dev.mysql.com/downloads/workbench/ (Optional)
Connector/J - https://dev.mysql.com/downloads/connector/j/ 
(Choose platform independent for OS if you don't find a compatible OS in the list)

----------------------------------------------------------------------------------------------------------------------------------------
This project is built using JSP and MySQL. JSP (Java Server Pages) is a collection of technologies that helps software developers create dynamically generated web pages based on HTML, XML, SOAP, or other document types. After downloading and setting up all the softwares mentioned, you will be ready to start off with your JSP programming. Although, you will need to do a few extra steps in setting up your IDE.

----------------------------------------------------------------------------------------------------------------------------------------
To create a JSP project in Eclipse IDE you will need to create a dynamic web project. If you don't have that option in the IDE Follow the steps given in the link (https://beginnersbook.com/2017/06/how-to-fix-dynamic-web-project-missing-in-eclipse-issue/). 
Briefly explaining the steps -->
Step 1 - Open the IDE and navigate to Help --> Install New Software.
Step 2 - In Work with paste this link: http://download.eclipse.org/releases/mars
       - If that link doesn't work try http://download.eclipse.org/releases/kepler
       - (Let that load for a while)
Step 3 - After the link fetches all the modules navigate to "Web, XML, Java EE and OSGi Enterprise Development" (this should probably be in the last).
Step 4 - Expand that module and you will find sub-modules. You will need to download 5 of these in order to support the creation of a dynamic web project.
       -> Eclipse Java EE Developer Tools
       -> Eclipse Java Web Developer Tools
       -> Eclipse Web Developer Tools
       ->JST Server Adapters Extensions (This is will be present in the mars link [step 2])
       ->JST Server Adapters (This is will be present in the mars link [step 2])
 [Note - The first 3 sub-modules will be present in both the links except for the last 2 which will be present only in the mars link]
Step 5 - Click on next and install them.

----------------------------------------------------------------------------------------------------------------------------------------
Once you've finished the 5 steps you will have to restart the IDE to apply the changes. After restarting the IDE, you can see that there is a new option (under File-->New) called "Dynamic Web Project". Choose that and in the pop-up window, choose the target runtime as tomcat and the dynamic web module version as 3.0 (for runtime tomcatv7.0). If the target runtime option is not available then you will have to create a new runtime. 

----------------------------------------------------------------------------------------------------------------------------------------
To create a new runtime -->
Click on the button "New Runtime" and choose "Tomcat v7.0" (or the latest version of tomcat). 
You will also have to check the box which says "Create new local server" and click next. 
For "tomcat installation directory" click "browse" and navigate to the folder where you have installed xampp and choose the folder called "tomcat". 
Click finish.

----------------------------------------------------------------------------------------------------------------------------------------
Now that you have created a runtime, choose that and click finish after giving a suitable project name. After your project is created expand it in the explorer and you can see that there will be a few files and folders which are generated. You will have to save all your JSP files, images for the project, HTML files under the folder "WebContent". For now to view my project place all the files inside "WebContent" of your project. 

Now, extract the contents of the Connector/J zip file which you downloaded and inside that folder you will find a JAR file. You will need to place that in a folder called "lib" under "WEB-INF" of the project. (Create a new folder called lib if it doesn't exist). After this, you will have to add the JAR file to your project. 

----------------------------------------------------------------------------------------------------------------------------------------
Adding a JAR file to your project -->
Right click on the project name in the explorer and choose "properties".
Go to "Java Build Path" and click on "libraries".
click on "add external JARs" and choose the jar file which is present from the extracted Connector/J folder.
click on "apply and close"

----------------------------------------------------------------------------------------------------------------------------------------
[Create the database. Or import the SQL file]. (Proceed to the end if this file to check out the creation of a database).

----------------------------------------------------------------------------------------------------------------------------------------
Now, that you have applied the JAR file to the project. We can run the project now!!.
----------------------------------------------------------------------------------------------------------------------------------------
Steps to run the project -->
Step 1 - Open the xampp control panel and start the apache and mysql services. Once they are running proceed to step 2.
Step 2 - Open a JSP file and click on the green play button (Run) and choose the local host which you created during the runtime.
Step 3 - If all is well, it should run just fine and you should see the output in a new window.

----------------------------------------------------------------------------------------------------------------------------------------
To stop the server -->
Choose "servers" which is located in the bottom of the screen in eclipse. Right click on the server and click "stop".
Finally, go to the xampp control panel and stop the apache and mysql services.

----------------------------------------------------------------------------------------------------------------------------------------
Creating the database. -->
Go to the xampp control panel and start the apache,mysql and tomcat services.
Go to your favorite browser and in the URL type "localhost" and load the page.
If the server is up and running then you must be in the xampp homepage.
Click on "phpMyAdmin" in the top right corner of the page.
You will be redirected to the phpmyadmin page where you can create databases using buttons.
You can also use MySQL Workbench to create databases.

----------------------------------------------------------------------------------------------------------------------------------------
TO IMPORT SQL FILES IN YOUR DATABASES -->
In the phpmyadmin page click on "Databases" and give a name for your database and click on the "create" button.
Once it is created, choose that and then move to the "Import" column.
Click on "Browse" and choose the sql file.
Scroll down and Click "Go"
After a while you should be able to access the tables and data under the database if the import was successful. If it was unsuccessful, change the character set of the file so that it is compatible with the sql file and try again.

NOTE --> In the connection URL "bloodbank" is the name of the database. Replace the word "bloodbank" with the database name to connect to your database.
----------------------------------------------------------------------------------------------------------------------------------------

# DBMS-Project
This is a Blood Bank Management System for the administrator of the blood bank. Technology used is JSP and MySQL.

----------------------------------------------------------------------------------------------------------------------------------------
Softwares used - <br/>
Eclipse IDE - https://www.eclipse.org/downloads/ <br/>
XAMPP Server - https://sourceforge.net/projects/xampp/ <br/>
MySQL Workbench - https://dev.mysql.com/downloads/workbench/ (Optional) <br/>
Connector/J - https://dev.mysql.com/downloads/connector/j/ <br/>
(Choose platform independent for OS if you don't find a compatible OS in the list)

----------------------------------------------------------------------------------------------------------------------------------------
This project is built using JSP and MySQL. JSP (Java Server Pages) is a collection of technologies that helps software developers create dynamically generated web pages based on HTML, XML, SOAP, or other document types. After downloading and setting up all the softwares mentioned, you will be ready to start off with your JSP programming. Although, you will need to do a few extra steps in setting up your IDE.

----------------------------------------------------------------------------------------------------------------------------------------
To create a JSP project in Eclipse IDE you will need to create a dynamic web project. If you don't have that option in the IDE Follow the steps given in the link <br/>(https://beginnersbook.com/2017/06/how-to-fix-dynamic-web-project-missing-in-eclipse-issue/). <br/>
<br/> Briefly explaining the steps --> <br/>
Step 1 - Open the IDE and navigate to Help --> Install New Software. <br/>
Step 2 - In 'Work with" paste this link: http://download.eclipse.org/releases/mars <br/>
       - If that link doesn't work try http://download.eclipse.org/releases/kepler <br/>
       - (Let that load for a while) <br/>
Step 3 - After the link fetches all the modules navigate to "Web, XML, Java EE and OSGi Enterprise Development" (this should probably be in the last). <br/>
Step 4 - Expand that module and you will find sub-modules. You will need to download 5 of these in order to support the creation of a dynamic web project.<br/>
       -> Eclipse Java EE Developer Tools. <br/>
       -> Eclipse Java Web Developer Tools. <br/>
       -> Eclipse Web Developer Tools. <br/>
       ->JST Server Adapters Extensions. (This is will be present in the mars link [step 2])<br/>
       ->JST Server Adapters. (This is will be present in the mars link [step 2])<br/>
[Note - The first 3 sub-modules will be present in both the links except for the last 2 which will be present only in the mars link]<br/>
Step 5 - Click on next and install them.

----------------------------------------------------------------------------------------------------------------------------------------
Once you've finished the 5 steps you will have to restart the IDE to apply the changes. After restarting the IDE, you can see that there is a new option (under File-->New) called "Dynamic Web Project". Choose that and in the pop-up window, choose the target runtime as tomcat and the dynamic web module version as 3.0 (for runtime tomcatv7.0). If the target runtime option is not available then you will have to create a new runtime. 

----------------------------------------------------------------------------------------------------------------------------------------
To create a new runtime --> <br/>
Click on the button "New Runtime" and choose "Tomcat v7.0" (or the latest version of tomcat). <br/>
You will also have to check the box which says "Create new local server" and click next. <br/>
For "tomcat installation directory" click "browse" and navigate to the folder where you have installed xampp and choose the folder called "tomcat". <br/>
Click finish. <br/>

----------------------------------------------------------------------------------------------------------------------------------------
Now that you have created a runtime, choose that and click finish after giving a suitable project name. After your project is created expand it in the explorer and you can see that there will be a few files and folders which are generated. You will have to save all your JSP files, images for the project, HTML files under the folder "WebContent". For now to view my project place all the files inside "WebContent" of your project. 

Now, extract the contents of the Connector/J zip file which you downloaded and inside that folder you will find a JAR file. You will need to place that in a folder called "lib" under "WEB-INF" of the project. (Create a new folder called lib if it doesn't exist). After this, you will have to add the JAR file to your project.

----------------------------------------------------------------------------------------------------------------------------------------
Adding a JAR file to your project --> <br/>
Right click on the project name in the explorer and choose "properties". <br/>
Go to "Java Build Path" and click on "libraries". <br/>
click on "add external JARs" and choose the jar file which is present from the extracted Connector/J folder. <br/>
click on "apply and close". <br/>

----------------------------------------------------------------------------------------------------------------------------------------
[Create the database. Or import the SQL file]. (Proceed to the end if this file to check out the creation of a database).

Note --> You can run the project but you cannot connect to the database unless it is created. So you will have to create the database or import the sql file first and then run the project!.
----------------------------------------------------------------------------------------------------------------------------------------
Now, that you have applied the JAR file to the project and created the database. We can run the project now!!.
----------------------------------------------------------------------------------------------------------------------------------------
Steps to run the project --> <br/>
Step 1 - Open the xampp control panel and start the apache and mysql services. Once they are running proceed to step 2. <br/>
Step 2 - Open a JSP file and click on the green play button (Run) and choose the local host which you created during the runtime. <br/>
Step 3 - If all is well, it should run just fine and you should see the output in a new window. <br/>

----------------------------------------------------------------------------------------------------------------------------------------
To stop the server --> <br/>
Choose "servers" which is located in the bottom of the screen in eclipse. Right click on the server and click "stop". <br/>
Finally, go to the xampp control panel and stop the apache and mysql services. <br/>

----------------------------------------------------------------------------------------------------------------------------------------
Creating the database. --> <br/>
Go to the xampp control panel and start the apache,mysql and tomcat services. <br/>
Go to your favorite browser and in the URL type "localhost" and load the page. <br/>
If the server is up and running then you must be in the xampp homepage. <br/>
Click on "phpMyAdmin" in the top right corner of the page. <br/>
You will be redirected to the phpmyadmin page where you can create databases using buttons. <br/>
You can also use MySQL Workbench to create databases. <br/>

----------------------------------------------------------------------------------------------------------------------------------------
TO IMPORT SQL FILES IN YOUR DATABASES --> <br/>
In the phpmyadmin page click on "Databases" and give a name for your database and click on the "create" button. <br/>
Once it is created, choose that and then move to the "Import" column. <br/>
Click on "Browse" and choose the sql file. <br/>
Scroll down and Click "Go". <br/>
After a while you should be able to access the tables and data under the database if the import was successful. If it was unsuccessful, change the character set of the file so that it is compatible with the sql file and try again. <br/>

NOTE --> In the connection URL "bloodbank" is the name of the database. Replace the word "bloodbank" with the database name to connect to your database.
----------------------------------------------------------------------------------------------------------------------------------------

#Author Name: Ian Bevel
#Program Name: salon
#Description: <p>The salon program is a ruby program that will allow the user to create a list of stylists and associate multiple clients with that stylist.  It incorporates databases as well as CRUD functionality.</p>
#Setting up the database:
<p>In psql type(press return after each step):
<ol>
<li>CREATE DATABASE salon;</li>
<li>CREATE TABLE stylists (id serial PRIMARY KEY, stylist_name varchar);</li>
<li>CREATE TABLE client (id serial PRIMARY KEY, client_name varchar, stylist_id int);</li>
<li>CREATE DATABASE salon_test WITH TEMPLATE salon;</li>
</ol>

#Set-up instructions: 
<p>All gems in Gemfile must be bundled and a Gemfile.lock file created prior to running this app.</p>
<ol>
<li>Go to www.github.com/ianofearth</li>
<li>Check the repositories tab and locate the "salon" project folder</li>
<li>In the right hand column it will say "HTTPS clone URL, click on the clipboard icon below that</li>
<li>Enter your terminal, change to Desktop directory, in command line: cd Desktop</li>
<li>Into the command line type: git clone (copy and paste the clone URL) salon</li>
<li>This will create a folder on your desktop called "salon" holding the project folders and files</li>
<li>Change directory to salon: cd salon</li>
<li>Download and install bundler</li>
<li>To gain access to the proper versions of gems, in the command line run: bundle</li>
<li>To initiate a sinatra session, in the command line type: ruby app.rb</li>
<li>In browser enter: localhost:4567 to run the app locally and follow on screen instructions</li>
<li>Follow the onscreen instructions to begin creating your very own salon!</li>
</ol>
</p>
#Bug reports: <p>There are currently no known bugs to salon.  Any discovered bugs should be reoprted 
directly to the programs creator at thisisnotarealemail@gmail.com</p>
#Licenses and Copywright info: <p>ianofearth License.  Copyright 2015 ianofearth industries.</p>
#<h2>You are not granted rights or licenses to the trademarks of ianofearth industries without the express written consent of ianofearth industries.</h2>


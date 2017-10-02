# _Volunteer Tracker_

#### _Epicodus project week 3 in Ruby, 9/22/17_

#### By _**Luciano Oliveira**_

## Description

_This application allows users to create Non Profit projects and assign volunteers to the projects._

## Setup/Installation Requirements

* _Clone program from https://github.com/lucky500/volunteer.git_
* _Open in terminal_
* _Run Bundle to install Ruby Gems_
* _Run the following commands to copy Database to the local machine_
* _Enter $psql (for Postgress)_
* _CREATE TABLE projects (id serial PRIMARY KEY, title varchar);_
* _CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int);_
* _open a new terminal window and run: ruby app.rb_
* _Go to localhost:4567_

## Specs

* _It will create an instance of a project class_
* _It will save an instance of the porject to the database_
* _It will return a list of projects from the database_
* _It will take a project name from user and display on the home page_
* _Users can click on the project and add volunteers to it_
* _Users can click on the project name and update its name_
* _Users can click on the project name and delete a project_
* _Users can click on volunteer name and update volunteer name_


## Known Bugs

_There are no known bugs at this time; however, this is a work in progress._

## Support and contact details

_If you run into any issues or have questions, ideas or concerns, or if you would like to contribute to the code, please contact me at luciano101@msn.com._

## Technologies Used

_This app was built using Ruby, Sinatra and Postgress._

### License

Copyright (c) 2017 Luciano Oliveira

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
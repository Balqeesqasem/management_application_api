# Task Managment API

## Description

This API is a task management application built with Ruby on Rails. It allows users to:

- **Create, Read, Update, show, and Delete Tasks**: Manage tasks with attributes such as title, description, status, tag, and priority.
- **Filter Tasks**: Filter tasks based on status, tag, or priority.
- **Validate Input**: Ensure that task data meets specified criteria, including unique priorities within the same tag.

## Postman Documentation

You can view the API documentation and test the endpoints using Postman at the following URL:

[Postman Documentation](https://documenter.getpostman.com/view/11123143/2sAXjF7Zow)

## Prerequisites

- Ruby 3.2.2
- Rails 7.2.1
- PostgreSQL 

## Installation

1. **Clone the repository If you have acccess as follow:**

   ```bash
   git clone https://github.com/Balqeesqasem/ClientTrip-management_application_API.git
   cd ClientTrip-management_application_API


 **I may send the whole file in the submission link if the clone not work**


## For Normal Installation
 **Now we need run the following command to alllow us hit API succsfully:**

```bash
    bundle install //to install all gems
    rails db:create // to create DB locally
    rails db:migrate

    rails server

```

## For Docker

## Additionally, you can use Docker. After cloning the code, run the following commands, and the server will be up without needing to install anything: 

   ```bash
      docker-compose build --no-cache
      docker-compose up





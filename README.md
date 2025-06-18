# Database - Weekly

This project was made by Muhammad Davinda Rinaldy in Training Program held by Kodacademy to make ERD of tickitz project, using mermaid tool and Query Database, using PostgreSQL.

## Entity Relationship Diagram 
```mermaid
erDiagram
    direction LR
    movie {
        string id PK
        string name
        string synopsis
        date release_date
        int runtime
        string poster
        string backdrop
        string id_genres FK
        string id_directors FK
        string id_casts FK
    }
    genres { 
        string id PK
        string name
    }
    directors {
        string id PK
        string name
    }
    casts {
        string id PK
        string name
    }
    users {
        string id PK
        string name
        string email
        string phone_number
        string password
    }
    session {
        string id PK
        string id_users FK
        timestamp created_at
    }
    transaction {
        string id PK
        string id_users FK
        string id_movie FK
        string amount
        string price 
        string location
        string cinema
        date time
        string seats
    }
    movie }|--|| genres: has
    movie }|--|| directors: has
    movie }|--|| casts: has
    users }o--|| session: make
    users ||--o{ transaction: create
    transaction ||--|{ movie: for
```
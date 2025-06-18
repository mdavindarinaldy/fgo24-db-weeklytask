# Database - Weekly

This project was made by Muhammad Davinda Rinaldy in Training Program held by Kodacademy to make ERD of tickitz project, using mermaid tool and Query Database, using PostgreSQL.

## Entity Relationship Diagram 
```mermaid
erDiagram
    direction LR
    movies {
        int id PK
        string name
        string synopsis
        date release_date
        int runtime
        string poster
        string backdrop
    }
    genres { 
        int id PK
        string name
    }
    movies_genres {
        int id_genres PK,FK
        int id_movies PK,FK
    }
    directors {
        int id PK
        string name
    }
    movies_directors {
        int id_directors PK,FK
        int id_movies PK,FK
    }
    casts {
        int id PK
        string name
    }
    movies_casts {
        int id_casts PK,FK
        int id_movies PK,FK
    }
    users {
        int id PK
        string name
        string email
        string phone_number
        string password
    }
    session {
        int id PK
        int id_users FK
        timestamp created_at
    }
    transaction {
        int id PK
        int id_users FK
        int id_movie FK
        int amount
        decimal price 
        string location
        string cinema
        date time
        string seats
    }
    movie ||--|{ movie_genres: has
    movie_genres }|--|| genres: belongs_to

    movie ||--|{ movie_directors: has
    movie_directors }|--|| directors: belongs_to

    movie ||--|{ movie_casts: has
    movie_casts }|--|| casts: belongs_to

    users }o--|| session: make
    users ||--o{ transaction: create
    transaction ||--|{ movie: for
```
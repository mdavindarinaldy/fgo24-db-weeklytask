# Database - Weekly

This project was made by Muhammad Davinda Rinaldy in Training Program held by Kodacademy to make ERD of tickitz project, using mermaid tool and Query Database, using PostgreSQL.

## Entity Relationship Diagram Ticket Booking Web App
```mermaid
erDiagram
    direction LR
    users {
        int id PK
        string name
        string email
        string phone_number
        string password
        enum role
    }
    movies {
        int id PK
        int created_by FK
        string name
        string synopsis
        date release_date
        decimal price 
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
    sessions {
        int id PK
        int id_users FK
        timestamp created_at
    }
    transactions {
        int id PK
        int id_users FK
        int id_movie FK
        int id_payment_method FK
        decimal total_amount
        string location
        string cinema
        date showtime
        timestamp created_at
    }
    transactions_detail {
        int id PK
        int id_transaction FK
        string seat
    }
    payment_methods {
        int id PK
        string name
    }
    movies ||--|{ movies_genres: has
    movies_genres }|--|| genres: belongs_to

    movies ||--|{ movies_directors: has
    movies_directors }|--|| directors: belongs_to

    movies ||--|{ movies_casts: has
    movies_casts }|--|| casts: belongs_to

    users ||--o{ sessions: make
    users ||--o{ transactions: create
    users ||--o{ movies : manages
    transactions }o--|| movies: for
    transactions_detail }|--|| transactions: contained_by
    transactions }o--|| payment_methods: with 
    users 

```
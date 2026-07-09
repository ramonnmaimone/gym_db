-- GYM DATABASE - DDL (PostgreSQL)


--1. MEMBERS

CREATE TABLE members (
    member_id BIGSERIAL PRIMARY KEY,
    member_name VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    birth_date DATE NOT NULL,
    active BOOLEAN NOT NULL,
    create_at TIMESTAMP NOT NULL,
    CONSTRAINT uq_member_cpf UNIQUE (cpf),
    CONSTRAINT uq_member_email UNIQUE (email)
);


--2. ADDRESSES

CREATE TABLE adresses (
    member_id BIGINT PRIMARY KEY,
    street VARCHAR(200) NOT NULL,
    number VARCHAR(20),
    complement VARCHAR(100),
    neighborhood VARCHAR(100),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    CONSTRAINT fk_adresses_members
        FOREIGN KEY (member_id) REFERENCES members (member_id)
        ON DELETE CASCADE
);

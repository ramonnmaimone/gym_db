-- GYM DATABASE - DDL (PostgreSQL)


--1. MEMBERS

CREATE TABLE members (
    member_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
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

CREATE TABLE addresses (
    member_id BIGINT PRIMARY KEY,
    street VARCHAR(200) NOT NULL,
    number VARCHAR(20),
    complement VARCHAR(100),
    neighborhood VARCHAR(100),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    CONSTRAINT fk_addresses_members
        FOREIGN KEY (member_id) REFERENCES members (member_id)
        ON DELETE CASCADE
);


-- 3. PLANS

CREATE TABLE plans (
    plan_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    monthly_price NUMERIC(8,2) NOT NULL,
    duration_months SMALLINT NOT NULL,
    CONSTRAINT chk_plans_price CHECK (monthly_price > 0),
    CONSTRAINT chk_plans_duration CHECK (duration_months > 0)
);


-- 4. INSTRUCTORS
CREATE TABLE instructors (
    instructor_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    specialty VARCHAR(100),
    phone VARCHAR(20),
    chef VARCHAR(20),
    CONSTRAINT uq_instructors_chef UNIQUE (chef)
);


-- 5. ENROLLMENTS
-- Associative table between members and plans

CREATE TABLE enrollments (
    enrollment_id BIGSERIAL PRIMARY KEY,
    member_id BIGINT NOT NULL,
    plan_id BIGINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'active',
    CONSTRAINT fk_enrollments_members
        FOREIGN KEY (member_id) REFERENCES member (member_id),
    CONSTRAINT fk_enrollment_plans
        FOREIGN KEY (plan_id) REFERENCES plans (plan_id),
    CONSTRAINT chk_enrollments_status
        CHECK (status IN ('active', 'cancelled', 'expired')),
    CONSTRAINT chk_enrollments_dates
        CHECK (end_date IS NULL OR end_date >= strat_date)
);


--6. PHYSICAL_ASSESSMENTS

CREATE TABLE physical_assessments (
    assessment_id BIGSERIAL PRIMARY KEY,
    member_id BIGINT NOT NULL,
    instructor_id BIGINT NOT NULL,
    assessment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    weigh_kg NUMERIC(5,2) NOT NULL,
    height_cm SMALLINT NOT NULL,
    body_fat_porcentage NUMERIC(4,2),
    notes TEXT,
    CONSTRAINT fk_assessments_members
        FOREIGN KEY (member_id) REFERENCES members (member_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_assessments_instructors
        FOREIGN KEY (instructor_id) REFERENCES instructors (instructor_id),
    CONSTRAINT chk_assessments_weight CHECK (weigh_kg > 0),
    CONSTRAINT chk_assessments_height CHECK (height_cm > 0)
);


-- Active plan
CREATE INDEX idx_enrollments_member_id ON enrollments (member_id);

-- Report "How much member for each plan"
CREATE INDEX idx_enrollments_plan_id ON enrollments (plan_id);

-- Enrollments filter 
CREATE INDEX idx_enrollments_status ON enrollments (status)
WHERE status = "active";


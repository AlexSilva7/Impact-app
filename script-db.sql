CREATE TABLE users(
  id SERIAL PRIMARY KEY ,
  name VARCHAR(80) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  email VARCHAR(80) NOT NULL UNIQUE,
  password_hash VARCHAR(60) NOT NULL,
  admin BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Students(  
    student_id SERIAL PRIMARY KEY,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    name VARCHAR(80) NOT NULL,
    birthdate VARCHAR(10) NOT NULL,
    city_of_birth VARCHAR(100) NOT NULL,
    schooling VARCHAR(30) NOT NULL,
    marital_status VARCHAR(10) NOT NULL,
    income VARCHAR(30) NOT NULL,
    family_members VARCHAR(3) NOT NULL,
    family_income VARCHAR(30) NOT NULL,
    jedi BOOLEAN  NOT NULL DEFAULT FALSE,
    family_members_with_disability BOOLEAN NOT NULL DEFAULT FALSE,
    government_aid BOOLEAN NOT NULL DEFAULT FALSE,
    updated_by VARCHAR(50) DEFAULT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE StudentContacts(  
    contact_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    email VARCHAR(80) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE StudentDocuments(
    document_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    rg VARCHAR(15) NOT NULL,
    cpf VARCHAR(15) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE StudentParent(
    parent_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    name VARCHAR(80) NOT NULL,
    relationship VARCHAR(10) NOT NULL,
    cpf VARCHAR(15) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE StudentAddress (
    addres_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    street VARCHAR(100) NOT NULL,
    number VARCHAR(10) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    complement VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
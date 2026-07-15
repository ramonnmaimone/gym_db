INSERT INTO members (name, cpf, email, phone, birth_date) VALUES
('Mariana Alves', '111.111.111-11', 'mariana.alves@email.com', '21988880001', '1995-03-12'),
('Rafael Costa',  '222.222.222-22', 'rafael.costa@email.com',  '21988880002', '1990-07-25'),
('Juliana Prado',  '333.333.333-33', 'juliana.prado@email.com', '21988880003', '1998-11-02');

INSERT INTO addresses 
(member_id, street, number, neighborhood, city, state, zip_code) VALUES
(1, 'Rua Voluntários da Pátria', '210', 'Botafogo', 'Rio de Janeiro', 'RJ', '22270-000'),
(2, 'Av. Atlântica', '1500', 'Copacabana', 'Rio de Janeiro', 'RJ', '22021-000'),
(3, 'Rua Barão de Ipanema', '55', 'Ipanema', 'Rio de Janeiro', 'RJ', '22050-000');

INSERT INTO plans (name, description, monthly_price, duration_months) VALUES
('Open Monthly', 'Full access, no contract', 150.00, 1),
('Quarterly', 'Full access with a 3-month contract', 130.00, 3),
('Annual', 'Full access with a 12-month contract and discount', 99.90, 12);

INSERT INTO instructors (name, specialty, phone, chef) VALUES
('Bruno Fernandes', 'Weight Training', '21977770001', 'CREF-012345'),
('Camila Duarte', 'Functional Training and HIIT', '21977770002', 'CREF-054321');

INSERT INTO enrollments (member_id, plan_id, start_date, end_date, status) VALUES
(1, 1, '2026-01-10', NULL, 'active'),
(2, 3, '2025-06-01', NULL, 'active'),
(3, 2, '2025-10-15', '2026-01-15', 'expired'),
(3, 1, '2026-01-16', NULL, 'active');

INSERT INTO physical_assessments (member_id, instructor_id,
assessment_date, weight_kg, height_cm, body_fat_porcentage, notes ) VALUES
(1, 1, '2026-01-12', 62.50, 165, 24.30, 'Initial focus on general conditioning'),
(2, 2, '2025-06-03', 81.00, 178, 18.50, 'Good progress compared to the last assessment'),
(3, 1, '2026-01-18', 58.00, 160, 22.00, 'Start of hypertrophy training');
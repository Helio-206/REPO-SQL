DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    ativo CHAR(1) NOT NULL DEFAULT 'S',
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nome, email, senha, ativo)
VALUES
    ('Abner Lourenco', 'abner@elemesmo.ao', 'Abner@2026', 'S'),
    ('Natan Matondo', 'natan@elemesmo.ao', 'Natan@2026', 'S'),
    ('Natandor Matondo', 'natandor@elemesmo.ao', 'Natandor@2026', 'N');

-- Consulta de login
-- Troque os valores abaixo pelo email e senha informados pelo usuário
SELECT
    id,
    nome,
    email,
    CASE
        WHEN ativo = 'S' THEN 'LOGIN LIBERADO'
        ELSE 'USUARIO INATIVO'
    END AS status_login
FROM usuarios
WHERE email = 'abner@elemesmo.ao'
  AND senha = 'Abner@2026';

-- Verificação de mensagem quando o login falhar
SELECT
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM usuarios
            WHERE email = 'abner@elemesmo.ao'
              AND senha = 'Abner@2026'
              AND ativo = 'S'
        ) THEN 'Bem-vindo ao sistema'
        ELSE 'Email ou senha invalidos'
    END AS resultado_login;

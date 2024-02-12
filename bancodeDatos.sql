CREATE TABLE JOGADOR
(
    ID_JOGADOR  NUMBER(10,0) NOT NULL,
    NOME VARCHAR2(100),
    POSICAO VARCHAR2(100),
    BI VARCHAR2(100),
    CONSTRAINT PK_JOGADOR PRIMARY KEY (ID_JOGADOR)
);

CREATE TABLE CONTRATADO2
(
    ID_JOGADOR NUMBER(10,0) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    DATA_FIM DATE NOT NULL,
    CONSTRAINT PK_CONTRATADO2 PRIMARY KEY (ID_JOGADOR, DATA_INICIO),
    CONSTRAINT FK_CONTRATADO2_REF_JOGADOR FOREIGN KEY (ID_JOGADOR)
        REFERENCES JOGADOR (ID_JOGADOR),
    CONSTRAINT CK_CONTRATADO2 CHECK (DATA_FIM > DATA_INICIO)
);

ALTER TABLE JOGADOR RENAME TO JOGADORES;

ALTER TABLE JOGADORES RENAME TO JOGADOR;

ALTER TABLE JOGADOR ADD APELIDO VARCHAR(30);

ALTER TABLE JOGADOR RENAME COLUMN APELIDO TO NICKNAME;

DESC JOGADOR; /* DEMONSTRA A TABELA NA SAIDA DO SCRIPT*/

ALTER TABLE JOGADOR MODIFY POSICAO NUMBER(5,0);

DESC JOGADOR;

ALTER TABLE JOGADOR DROP COLUMN BI CASCADE CONSTRAINT;

DESC JOGADOR;

DROP TABLE JOGADOR;

ALTER TABLE CONTRATADO 
DROP CONSTRAINT FK_CONTRATADO_REF_JOGADOR;

DROP TABLE JOGADOR;

ALTER TABLE CONTRATADO
ADD CONSTRAINT FK_CONTRATADO_REF_JOGADOR FOREIGN KEY (ID_JOGADOR)
    REFERENCES JOGADOR(ID_JOGADOR);

ALTER TABLE CONTRATADO
DISABLE CONSTRAINT FK_CONSTRATADO_REF_JOGADOR;

ALTER TABLE CONTRATADO
ENABLE CONSTRAINT FK_CONTRATADO_REF_JOGADOR;

DESC CONTRATADO;

ALTER TABLE CONTRATADO DROP CONSTRAINT NEW_FK_CONTRATADO_REF_JOGADOR;

ALTER TABLE CONTRATADO
ADD CONSTRAINT FK_CONTRATADO_REF_JOGADOR FOREIGN KEY (ID_JOGADOR)
    REFERENCES JOGADOR (ID_JOGADOR);
    
ALTER TABLE CONTRATADO
DISABLE CONSTRAINT FK_CONTRATADO_REF_JOGADOR;

ALTER TABLE CONTRATADO
ENABLE CONSTRAINT FK_CONTRATADO_REF_JOGADOR;

INSERT INTO JOGADOR
(ID_JOGADOR, NOME, POSICAO, NICKNAME)
VALUES
(1,'JOGADOR 1',2,'JOGADOR T�TICO');

INSERT INTO JOGADOR
(ID_JOGADOR, NOME, POSICAO, NICKNAME)
VALUES
(2,'JOGADOR 1',2,'JOGADOR');

SELECT * FROM JOGADOR;

INSERT INTO CONTRATADO2
(ID_JOGADOR, DATA_INICIO, DATA_FIM)
VALUES
(2, TO_DATE('09-02-2018'), TO_DATE('09-02-2019'));

UPDATE JOGADOR 
SET NOME = 'ALEXANDER', POSICAO = 5
WHERE ID_JOGADOR = 1;

SELECT * FROM CONTRATADO2;

DELETE FROM CONTRATADO2
WHERE ID_JOGADOR = 2;

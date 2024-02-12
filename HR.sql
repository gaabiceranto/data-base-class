SELECT * FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, MANAGER_ID
FROM HR.EMPLOYEES
WHERE MANAGER_ID IN (101, 145, 149);

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, MANAGER_ID
FROM HR.EMPLOYEES
WHERE MANAGER_ID NOT IN (101, 145, 149);

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, MANAGER_ID
FROM HR.EMPLOYEES
WHERE FIRST_NAME LIKE '%a';

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, MANAGER_ID
FROM HR.EMPLOYEES
WHERE SALARY NOT BETWEEN 2500 AND 2600;

INSERT INTO JOGADOR
(ID_JOGADOR, NOME, POSICAO, NICKNAME)
VALUES
(2,'JOGADOR 1',2,'JOGADOR');
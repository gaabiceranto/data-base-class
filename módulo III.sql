--Exemplos

SELECT
  EMPLOYEE_ID,
  FIRST_NAME,
  LAST_NAME,
  SALARY
FROM
  HR.EMPLOYEES
WHERE
  DEPARTMENT_ID IN (
    SELECT
      DEPARTMENT_ID
    FROM
      HR.DEPARTMENTS
    WHERE
      DEPARTMENT_NAME IN ('MARKETING', 'ADMINISTRATION')
  );

SELECT
  FIRST_NAME,
  JOB_ID
FROM
  HR.EMPLOYEES;

SELECT
  FIRST_NAME,
  JOB_ID,
  DECODE(JOB_ID, 'IT_PROG', 'PROGRAMADOR', 'FI_ACCOUNT', 'CONTADOR', 'VERIFICAR') CARGO
FROM
  HR.EMPLOYEES;

SELECT
  FIRST_NAME,
  JOB_ID,
  SALARY,
  CASE
    WHEN SALARY < 5000 THEN
      'AUMENTO'
    WHEN SALARY > 10000 THEN
      'VERIFICAR'
    ELSE
      'NÃO AUMENTAR'
  END        VERIFICAR_AUMENTO
FROM
  HR.EMPLOYEES;

--***** Atividades

-- Com base no DER abaixo, qual a forma correta para criar uma query que mostre o último nome, o número do departamento e o código do cargo de todos os empregados cuja localização do departamento seja igual a 1700?


SELECT
  LAST_NAME     "ÚLTIMO NOME",
  DEPARTMENT_ID "CÓDIGO DO DEPTO",
  JOB_ID        "CÓDIGO DO CARGO"
FROM
  EMPLOYEES
WHERE
  DEPARTMENT_ID IN(
    SELECT
      DEPARTMENT_ID
    FROM
      DEPARTMENTS
    WHERE
      LOCATION_ID=1700
  );

-- Com base no DER abaixo, escreva a sintaxe correta para selecionar o nome, o cargo e o salário de todos os empregados cujo salário seja maior que a média salarial de todos os empregados.

SELECT
  FIRST_NAME "Nome",
  JOB_ID     "Cargo",
  SALARY     "Salário"
FROM
  EMPLOYEES
WHERE
  SALARY > (
    SELECT
      AVG(SALARY)
    FROM
      EMPLOYEES
  );

-- Encontre os empregados que têm, no mínimo, uma pessoa subordinada a cada um deles.




SELECT
  EMPLOYEE_ID,
  MANAGER_ID,
  FIRST_NAME,
  LAST_NAME,
  JOB_ID,
  DEPARTMENT_ID,
  SALARY
FROM
  EMPLOYEES E
WHERE
  EXISTS (
    SELECT
      EMPLOYEE_ID
    FROM
      EMPLOYEES
    WHERE
      EMPLOYEES.MANAGER_ID = E. EMPLOYEE_ID
  )
ORDER BY
  EMPLOYEE_ID;
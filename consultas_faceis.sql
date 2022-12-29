
/*Mostrar nome, sobrenome e gênero de pacientes cujo gênero é 'M'*/
select 
	first_name AS NOME
    , last_name AS SOBRENOME
    , gender AS GENERO 
from patients
where gender = 'M'


/*Mostrar nome e sobrenome de pacientes que não têm alergias. (nulo)*/
select 
	first_name AS NOME
    , last_name AS SOBRENOME
from patients
where allergies is null

/*Mostrar o primeiro nome dos pacientes que começam com a letra 'C'*/
select 
	first_name AS NOME
from 
	patients
where 
	first_name like 'C%'
   
/*Mostrar nome e sobrenome de pacientes com peso entre 100 e 120 (inclusive)*/
select 
	first_name AS NOME
    ,last_name AS SOBRENOME
from
	patients
where
	weight >= 100 and weight <= 120
    

/*Atualize a tabela de pacientes para a coluna de alergias. Se a alergia do paciente for nula, substitua-a por 'NKA'*/
update	patients 
SET allergies = 'NKA'
where allergies IS null

/*Mostre o nome e o sobrenome concatenados em uma coluna para mostrar o nome completo.*/
select concat(first_name,' ', last_name) 
AS NOMECOMPLETO
from patients

/*Mostrar nome, sobrenome e o nome completo da província de cada paciente.

Exemplo: 'Ontário' em vez de 'ON'*/
select 
	patients.first_name
    , patients.last_name
    ,province_names.province_name
 FROM patients 
 join province_names ON patients.province_id = province_names.province_id

/*Mostre quantos pacientes têm birth_date com 2010 como ano de nascimento.*/
select count(*) AS TOTAL_PACIENTES 
from patients 
where year(birth_date) = 2010

/*Mostre o first_name, last_name e a altura do paciente com a maior altura.*/
select 
	first_name,
     last_name,
max(height) AS height
from patients

/*Mostrar todas as colunas para pacientes com um dos seguintes IDs de paciente:
1.45.534.879.1000*/

select * 
from patients
where 
	patient_id  in (1, 45, 534,879,1000)

/*Mostrar o número total de admissões*/
select count(*) as total_admissao from admissions

/*Mostre todas as colunas de internações em que o paciente foi internado e teve alta no mesmo dia.*/
select * from admissions
where admission_date = discharge_date

/*Mostra o número total de admissões para o Patient_id 579.*/
select patient_id, 
count(*) as total
from admissions 
where patient_id = 579

/*Com base nas cidades em que nossos pacientes moram, mostre o nome das cidades 
que estão na provincia_id 'NS'?*/
select distinct city 
from patients
where province_id = 'NS'

/*Escreva uma consulta para encontrar o nome, o sobrenome e a data de nascimento de 
pacientes com altura superior a 160 e peso superior a 70*/
SELECT 
	first_name
    ,last_name
    ,birth_date
from patients
where height  > 160 and weight > 70

/*Escreva uma consulta para localizar a lista de pacientes first_name, last_name e 
alergias da cidade de Hamilton onde as alergias não são nulas*/

select 
	first_name
    ,last_name
    ,allergies
from patients 
where 
	city  = 'Hamilton'
and allergies is not null

/*Com base nas cidades onde nosso paciente mora, escreva uma consulta para exibir a 
lista de cidades únicas começando com uma vogal (a, e, i, o, u). Mostra a ordem do 
resultado em ordem crescente por cidade.*/

select distinct city  
from patients
where 
	city like 'a%' 
    or city like 'e%' 
    or city like 'i%' 
    or city like 'o%' 
    or city like 'u%' 
order by city 
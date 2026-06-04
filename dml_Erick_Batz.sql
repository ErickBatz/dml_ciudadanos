/*1.mostrar los datos de todas las regiones*/
SELECT 
	* 
FROM 
	regiones;
/*2.Obtener los datos de todos los municipios*/
SELECT 
	* 
FROM 
	municipios;
	
/*3.mostrar todos los municipios ordenados por codigo de departamento*/
SELECT 
	* 
FROM 
	municipios
ORDER BY cod_depto ASC;

/*4.listar los datos de todos los departamentos que pertenecen a la region con codigo 6*/

SELECT 
	* 
FROM 
	departamentos
WHERE cod_region = 6;

/*5.seleccionar a los ciudadanos que pertenecen al municipio con codigo 901, los datos a mostrar son DPI,nombre, apellido, direccion
 y telefono movil
 importante: concatenar el nombre del ciudadano de tal forma que posea el siguiente formato>: apellido, nombre*/
 
SELECT 
 	ciudadanos.dpi,
	CONCAT(ciudadanos.nombre, " ",ciudadanos.apellido),
	ciudadanos.direccion,
	ciudadanos.tel_movil,
	ciudadanos.cod_muni
FROM 
	ciudadanos
WHERE cod_muni = 901;

/*6.mostrar los datos de los ciudadanos que tiene el apellido perez
importante: 
	-tomar en cuenta que el apellido puede o no tener tilde
	-no importa si el apellido se encuentra al inicio o al final*/
SELECT 
	* 
FROM 
	ciudadanos
WHERE apellido LIKE "%Perez%";

/*7.listar a todos los departamentos ordenados por codigo de region*/
SELECT 
	*
FROM 
	departamentos
ORDER BY cod_region ASC;

/*8.mostrar los datos de todos los ciudadanos que pertenecen al municipio con codigo 101 ordenar los datos 
por codigo de municipio y apellido*/
SELECT 
	*
FROM 
	ciudadanos
WHERE cod_muni = 101
ORDER BY cod_muni ASC, apellido ASC;

/*9.obtener todos los municipios de finalizan con la letra Z*/
SELECT 
	*
FROM 
	municipios
WHERE nombre_municipio LIKE "%z";

/*10.Mostrar dpi,nombre completo(concatenar nombre y apellido ) y telefono movil de los ciudadanos del minicipio con codigo 
101, ordenar los datos por apellido de forrma descedente*/
SELECT 
    ciudadanos.dpi,
    CONCAT(ciudadanos.nombre, ' ', ciudadanos.apellido) AS nombre_completo,
    ciudadanos.tel_movil
FROM 
    ciudadanos
WHERE 
    cod_muni = 101
ORDER BY 
    apellido DESC;
    
/*11.Mostrar todos los ciudadanos que poseen nivel academico 3 y pertenecen al municipio 102, ordenar los datos por codigo de 
municipio y apellido*/
SELECT 
	*
FROM 
	ciudadanos
WHERE 
	cod_nivel_acad = 5 	/*no hay nivel academico 3*/
	AND
	cod_muni = 102
ORDER BY 
	cod_muni ASC,
	apellido ASC; 

/*12.Agregar un nuevo ciudadanos, los datos son los siguientes*/
INSERT INTO ciudadanos (
    dpi, 
    apellido, 
    nombre, 
    direccion, 
    tel_casa, 
    tel_movil, 
    email, 
    fechanac, 
    cod_nivel_acad, 
    cod_muni
)
VALUES (
    '2283761300103', 
    'Zoila Nue', 
    'Vaciuda Dana', 
    '1 calle 1-11 zona 1', 
    '23234545', 
    '56567878', 
    'zoilavd@mail.com', 
    '1995-01-01', 
    5, 
    101
);
/*verificamos si se creo el registro que queriamos*/
SELECT 
	*
FROM 
	ciudadanos
WHERE 
	apellido = "Zoila Nue";
	
/*13.Agregar una nueva region, inventar los datos*/
INSERT INTO regiones
(
	cod_region,
	nombre,
	descripcion
)
VALUES(
	10,
	"region nueva",
	"esta es una nueva region que hice de prueba"
);
/*verificamos si se agrego el registro*/
SELECT 
	*
FROM 
	regiones;
	
/*14.Agregar un nuevo departamento para la region inventada*/
INSERT INTO departamentos
VALUES(
	25,
	"Departamento inventado",
	10	
);

SELECT 
	*
FROM 
	departamentos;

/*15.Agregar un nuevo municipio en el departamento creado en el inciso anterior*/
INSERT INTO municipios(
	cod_muni,
	nombre_municipio,
	cod_depto
)
VALUES (
	209,
	'Municipio_inventado',
	25
);
SELECT 
	*
FROM
	municipios
WHERE 
	cod_muni=209;


/*16.Agregar un nuevo nivel academico, invente los datos*/
INSERT INTO nivelesacademicos(
	cod_nivel_acad,
	nombre,
	descripcion
)
VALUES(
	9,
	'nivel inventado',
	'Nivel academico inventado'
);


/*17.Agregar nombre, telefono de casa,telefono movil,codigo de nivel academico, d
codigo de municipio y dpi para ciudadado(invente los datos)*/
INSERT INTO ciudadanos(
	dpi,
	apellido,
	nombre,
	tel_casa,
	tel_movil,
	cod_nivel_acad,
	cod_muni
)
VALUES(
	'1245789632458',
	'Garcia Morales',
	'Victor Daniel',
	'45858596',
	'21255663',
	9,
	101
);

/*UPDATE*/
/*18.Cambiar la direccion y el telefono para ciudadanos con el dpi 2283761300101*/
UPDATE ciudadanos
SET  direccion = '7ma. calle 7-77 zona 7',
		tel_movil = '22224444'
WHERE 
	dpi = '2283761300101';

/*verificamos cambios*/	
SELECT 
	*
FROM 
	ciudadanos 
WHERE	
	dpi = '2283761300101';

/*19.Modificar el correo electrónico para el ciudadano con el DPI 4455667780105 este debe ser
zoyelnuevo@mail.com.*/
UPDATE ciudadanos 
SET email = 'zoyelnuevo@mail.com'
WHERE 
	dpi= 2283761300101;

/*verificamos cambios*/	
SELECT 
	*
FROM 
	ciudadanos 
WHERE	
	dpi = 2283761300101;
	
/*20. Modificar Apellido, dirección, teléfono de casa, teléfono móvil y fecha de nacimiento de algún
ciudadano existente, invente todos los datos.*/
UPDATE ciudadanos 
SET apellido = 'Rivera Mendoza',
		direccion = '7ave9-45 zona 12',
		tel_casa = '14141515',
		tel_movil = '20202121',
		fechanac = '2006-07-08'
WHERE 
	dpi = '1007928191909';
	
/*verificamos cambios*/	
SELECT 
	*
FROM 
	ciudadanos 
WHERE	
	dpi = '1007928191909';
	
/*21.Cambiar el nombre de la region agregada en el inciso 13, el nombre depe de ser Region 13*/
UPDATE regiones 
SET nombre = 'region 13'
WHERE 
	cod_region = '10';

/*verificamos si se aplicaron los cambios*/
SELECT 
	*
FROM 
	regiones 
WHERE 
	cod_region = '10';

/*22.Modificar los datos del nivel académico agregado en el inciso 16, el nombre debe ser Nivel 16 y
en la descripción colocar el texto nombre modificado en la consulta 22.*/
UPDATE nivelesacademicos
SET  nombre = 'nivel 16',
		descripcion = 'nombre modificado en la consulta 22'
WHERE 
	cod_nivel_acad = 9;
/*verificamos si se ralizaron los cambios*/
SELECT 
	*
FROM 
	nivelesacademicos
WHERE 
	cod_nivel_acad = '9';
	
/*DELETE*/
/*23.Eliminar el nivel academico inventado*/
DELETE FROM nivelesacademicos
WHERE
	cod_nivel_acad = '9';
	
	
/*creamos a un ciudadanos para poder eliminarlos depues*/
INSERT INTO ciudadanos (
    dpi, 
    apellido, 
    nombre, 
    direccion, 
    tel_casa, 
    tel_movil, 
    email, 
    fechanac, 
    cod_nivel_acad, 
    cod_muni
)
VALUES (
    '2283761300109', 
    'Batz Morales', 
    'Erick Rene ', 
    '1 calle 1-11 zona 1', 
    '23234545', 
    '56567878', 
    'zoilavd@mail.com', 
    '1995-01-01', 
    5, 
    2277
);

INSERT INTO municipios(
	cod_muni,
	nombre_municipio,
	cod_depto
)
VALUES(
	2277,
	'municipio 2277',
	1 
);

/*24.Eliminar todos los ciudadanos que nacieron en el municipio con el código 2217*/
DELETE FROM ciudadanos 
WHERE 
	cod_muni=2277;
/*comprobar antes la condicion para evitar eliminar registros que  no queremos*/
SELECT 
	*
FROM 
	ciudadanos
WHERE 
	cod_muni = 2277;
	
/*25.eliminar al ciudadanos con DPI 2283761300101*/
DELETE FROM ciudadanos 
WHERE 
	dpi = '2283761300101';

/*antes de ejecutar verificamos si todo esta correcto con la condicion */
SELECT 
	*
FROM 
	ciudadanos 
WHERE 
	dpi = '2283761300101';
	
/*26.Eliminar a todos los ciudadanos que nacieron en el municipio 101 y que tienen fecha de
nacimiento menor a 1980.*/
DELETE FROM ciudadanos 
WHERE
	cod_muni = 101 AND 
	YEAR(fechanac)<1980;
	
/*antes de ejecutar verificamos si todo esta correcto con la condicion */
SELECT 
	*
FROM 
	ciudadanos 
WHERE 
	cod_muni = 101 AND 
	YEAR(fechanac)<1980;
	
/*Eliminar todos los departamentos de la region No.1*/
DELETE FROM departamentos 
WHERE
	cod_region = 1;
	
SELECT 
	*
FROM 
	departamentos 
WHERE 
	cod_region = 1;

/*28.Eliminar a los ciudadanos con teléfono móvil 33734648 y teléfono de casa 21243830*/
DELETE FROM ciudadanos 
WHERE 
	tel_movil = 33734648 AND 
	tel_casa = 21243830;


SELECT 
	*
FROM 
	ciudadanos 
WHERE
	tel_movil = 33734648; AND 
	tel_casa = 21243830; 
	 
	

	

#Por cada Centro de investigación con tres o más investigadores, mostrar su zona
select Centro_de_Investigacion.Nombre, Centro_de_Investigacion.Zona_Nombre from Centro_de_Investigacion
where Centro_de_Investigacion.Nombre in (select Centro_de_Investigacion_Nombre from Investigador
group by Centro_de_Investigacion_Nombre
having count(Investigador.DNI)>=3);

#Selecciona los Antídotos desarrollados en un centro de investigación específico ('Alpes')
select * from Antídoto 
where Centro_de_Investigacion_Nombre in 
(select Centro_de_Investigacion.Nombre from Centro_de_Investigacion where Centro_de_Investigacion.Zona_Nombre='Alpes');

#Selecciona cada veneno y su antídoto si existe
select Animal_Nombre, idVenenos, Antídoto_idAntídoto from Venenos
where Antídoto_idAntídoto is not null;

#Accede al nombre de los animales de la tabla animales y su zona de la tabla habita, que no habitan una zona concreta ('Tailandia')
select Animal.Nombre, Habita.Zona_Nombre from Animal inner join Habita on Animal.Nombre=Habita.Animal_Nombre
where Nombre <>All(select Animal_Nombre from Habita where Zona_Nombre='Tailandia');






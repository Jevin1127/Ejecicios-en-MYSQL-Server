# Ejercicios de SQL Server - Nivel Básico a Intermedio 🛢️

Repositorio de ejercicios prácticos de SQL Server que cubren desde consultas básicas hasta operaciones avanzadas con múltiples tablas.

## 📂 Estructura de Ejercicios

### 🔍 Consultas Básicas
| Archivo | Descripción | Habilidades |
|---------|-------------|-------------|
| **AW Ejercicio Practico** | Consultas sobre AdventureWorks | `SELECT`, `WHERE`, `ORDER BY` |
| **Guia Practica** | Ejercicios guiados paso a paso | `JOIN`, `GROUP BY` |

### 🧩 Operaciones Intermedias
| Archivo | Descripción | Técnicas |
|---------|-------------|----------|
| **Examen2Jevini.opez** | Problemas de examen con datos reales | Subconsultas, `HAVING` |
| **Jevin...Exame...** | Unión de 3+ tablas con filtros | `INNER JOIN`, `LEFT JOIN` |

### 🎯 Proyectos Temáticos
| Carpeta | Enfoque | Datasets |
|---------|---------|----------|
| **Museo** | Gestión de colecciones | Tablas normalizadas |
| **Peliculas** | Análisis de películas | Datos IMDb-like |
| **SolicitudBeca** | Sistema educativo | Relaciones complejas |

## 💻 Tecnologías Usadas
```sql
-- Ejemplo típico incluido:
SELECT 
    e.Nombre, 
    COUNT(p.ProyectoID) AS Proyectos
FROM Empleados e
LEFT JOIN Proyectos p ON e.EmpleadoID = p.ResponsableID
WHERE p.Fecha BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY e.Nombre
HAVING COUNT(p.ProyectoID) > 2
ORDER BY Proyectos DESC;
```
## 🚀 Cómo Utilizar
1. Requisitos:
  - SQL Server 2019+

  - SSMS o Azure Data Studio

  - Datasets proporcionados en /data

2. Ejecución:
```bash
# Restaurar BD de ejemplo:
sqlcmd -S localhost -U sa -P "contraseña" -i museo.sql
```
3. Niveles de dificultad:

  - 🌱 Básico: Consultas simples (1-2 tablas)

  - 🌿 Intermedio: Agregaciones y joins

  - 🌳 Avanzado: Optimización de queries

## 📚 Aprendizaje por Tema
1. Manipulación de Datos:

  - Filtrado con WHERE complejo

  - Ordenamiento personalizado

2. Relaciones entre Tablas:
  
  - tipos de JOIN prácticos

  - Problemas de cardinalidad

3. Funciones Esenciales:
```sql
-- Ejemplo de funciones de fecha:
SELECT 
    DATENAME(MONTH, Fecha) AS Mes,
    FORMAT(SUM(Monto), 'C') AS Ventas
FROM Ventas
WHERE YEAR(Fecha) = 2023
GROUP BY DATENAME(MONTH, Fecha)
```
## 🔍 Recomendaciones
  - Comenzar con Guia Practica antes de los exámenes

  - Usar Proyecto Final como integrador de conocimientos

  - El archivo SolicitudBeca contiene casos reales de uso

## 📌 Todos los ejercicios incluyen:

✅ Soluciones comentadas

✅ Explicación de la lógica SQL

✅ Alternativas de optimización

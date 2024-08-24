# Práctica Fundamentos IOS

## Enunciado
Descripción: Desarrollo de una aplicación iOS que consuma la API Rest Dragon Ball de KeepCoding presentada en clase.
## Requisitos Obligatorios
1. La aplicación será desarrollada siguiendo la arquitectura MVC.
2. El diseño de interfaces se utilizará .xibs (No storyboards)
3. La aplicación contará con las siguientes pantallas:
1. Login, que permita identificar a un usuario (usando el endpoint: /api/auth/login)
2. Listado de héroes, que lista todos los héroes (usando el endpoint: /api/heros/all). Se podrá escoger
entre UITableViewController y UICollectionViewController.
3. Detalle de héroe, que representa algunas de las propiedades del héroe (imagen, nombre,
descripción…) y que contenga un botón para mostrar el listado de transformaciones.
4. Lista de transformaciones del héroe, que liste todas las transformaciones disponibles para ese
héroe (usando el endpoint: /api/heros/trasfromations)
4. El proyecto debe incluir Unit Test para la capa de modelo.
## Requisitos Opcionales
1. Mostrar/ esconder el botón de transformaciones en el detalle de héroe. Si el héroe cuenta con
transformaciones, el botón será mostrado. Si el héroe no cuenta con transformaciones, debemos esconder el
botón.
2. Detalle de transformación,
## Ejemplos de Pantallas
![Simulator Screenshot - iPhone 15 Pro - 2024-08-23 at 23 33 01](https://github.com/user-attachments/assets/90c8784d-0b84-43d5-b520-ea5b54d19a86)
![Simulator Screenshot - iPhone 15 Pro - 2024-08-23 at 23 39 20](https://github.com/user-attachments/assets/1f6eb3c6-d882-4ef8-80ea-b8769e6143f0)
![Simulator Screenshot - iPhone 15 Pro - 2024-08-23 at 23 40 29](https://github.com/user-attachments/assets/58eb6098-404f-4bbc-b67f-c45c74843fdc)
![Simulator Screenshot - iPhone 15 Pro - 2024-08-23 at 23 41 37](https://github.com/user-attachments/assets/8f401c57-7392-4ba8-8866-21b2c5f6d53a)
![Simulator Screenshot - iPhone 15 Pro - 2024-08-23 at 23 42 15](https://github.com/user-attachments/assets/645632f5-bbaf-42f0-8c5a-a6d23f1eeac7)

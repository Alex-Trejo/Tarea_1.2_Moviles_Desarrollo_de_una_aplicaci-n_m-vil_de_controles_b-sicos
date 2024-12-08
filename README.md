# Tarea 1.2: Desarrollo de una Aplicación Móvil con Controles Básicos

## Integrantes
- Silvia Ivón Añasco Rivadeneira  
- Sheylee Arielle Enriquez Hernandez  
- Yorman Javier Oña Gamarra  
- Alex Fernando Trejo Duque  

---

## Descripción del Proyecto

El proyecto **Tarea 1.2** es una aplicación móvil desarrollada en **Flutter** que explora y utiliza controles básicos de interfaz de usuario, junto con lógica para resolver ejercicios prácticos en el contexto del curso _Desarrollo de Aplicaciones Móviles_. 

La aplicación consta de diferentes páginas, cada una enfocada en resolver ejercicios específicos relacionados con lógica matemática y algoritmos. A continuación, se describen las características y funcionalidades incluidas.

---

## Funcionalidades

### Ejercicio 1: Codigo ASCII
- **Archivo lógico**: `logica_ejercicio1_ascii`
  - es generar y visualizar una tabla de códigos ASCII, que incluya tanto los valores decimales como sus descripciones o caracteres representados.
  - Una función generarTablaASCIIConPausa que genera una lista de valores ASCII (del 0 al 255) junto con su descripción.
  - Valida si un valor tiene una descripción en el mapa proporcionado (asciiMap) o muestra el carácter correspondiente en su defecto.

- **Interfaz gráfica**: `ejercicio_1_page.dart`
  - Permite al usuario visualizar la tabla ASCII generada.
  - Incluye un botón interactivo para generar y mostrar la tabla en una lista estilizada.
  - Diseñada con una temática de colores oscuros, texto destacado y elementos interactivos.

---

### Ejercicio 2: Cálculo del Factorial
- **Archivo lógico**: `logica_ejercicio2_factorial.dart`
  - Contiene una función que calcula el factorial de un número positivo ingresado por el usuario.
  - Valida que el número no sea negativo, generando un error si esto ocurre.
- **Interfaz gráfica**: `ejercicio_2_page.dart`
  - Permite al usuario ingresar un número, calcular su factorial y mostrar el resultado.
  - Incluye validaciones y manejo de errores amigables para el usuario.
  - Diseño interactivo con colores oscuros y elementos estilizados.

---

### Ejercicio 3: Cálculo del Máximo Común Divisor (MCD)
- **Archivo lógico**: `logica_ejercicio3_mcd.dart`
  - Implementa un algoritmo basado en restas sucesivas para calcular el MCD de dos números positivos.
  - Valida que ambos números sean mayores que cero.
- **Interfaz gráfica**: `ejercicio_3_page.dart`
  - Permite al usuario ingresar dos números, calcular su MCD y visualizar el resultado.
  - Contiene manejo de errores si los números no cumplen las condiciones requeridas.
  - Diseño estilizado y consistente con el resto de las páginas.

---

### Ejercicio 4: Factorización
- **Archivo lógico**: `logica_ejercicio4_factorizacion.dart`
  - Implementa un algoritmo para factorizar un número entero positivo en sus factores primos.
  - Devuelve una lista de mapas que contiene los factores y sus respectivas potencias.
  - Valida que el número ingresado sea mayor que cero.
  - **Ejemplo de salida**: Para el número 18, el resultado sería:
    ```dart
    [
      {'factor': 2, 'potencia': 1},
      {'factor': 3, 'potencia': 2}
    ]
    ```



- **Interfaz gráfica**: `ejercicio_4_page.dart`
  - Permite al usuario ingresar un número y visualizar su descomposición en factores primos.
  - Contiene las siguientes funcionalidades:
    - **Validaciones**: Asegura que el usuario ingrese un número mayor que cero, mostrando un mensaje de error en caso contrario.
    - **Resultado claro**: Muestra los factores primos y sus potencias en un formato amigable y organizado en columnas.
    - **Indicadores visuales**: Incluye un *spinner* para indicar que la aplicación está procesando la solicitud y manejos de errores para entradas no válidas.
  - **Diseño estilizado**:
    - Fondo oscuro para mejor visibilidad.
    - Botones y tarjetas estilizadas.
    - Uso de colores y fuentes legibles para mejorar la experiencia del usuario.

---

### Ejercicio 5: Generación de Números Primos
- **Archivo lógico**: `logica_ejercicio5_primos.dart`
  - Genera una lista de números primos desde 3 hasta 32,767 utilizando un algoritmo básico de validación.
- **Interfaz gráfica**: `ejercicio_5_page.dart`
  - Genera y muestra los números primos en un diseño organizado en cuadrícula de 4 columnas.
  - Manejo de errores y estado de carga mientras se procesan los números.
  - Visualización optimizada para dispositivos móviles.

---

## Tecnologías Utilizadas

- **Framework Frontend**: Flutter
- **Lenguaje de Programación**: Dart
- **Entorno de Desarrollo**: Visual Studio Code
- **Gestor de Versiones**: Git/GitHub

---

## Cómo Clonar y Ejecutar el Proyecto

### Prerrequisitos
- Tener instalado Flutter en tu máquina. Puedes seguir la [documentación oficial](https://flutter.dev/docs/get-started/install) para la instalación.
- Tener configurado un editor de texto como Visual Studio Code con las extensiones de Flutter y Dart.

### Pasos para clonar el repositorio

1. Clonar el repositorio en tu máquina local:
   ```bash
   git clone https://github.com/Alex-Trejo/Tarea_1.2_Moviles_Desarrollo_de_una_aplicacion_movil_de_controles_basicos.git

   ```
2. Accede al directorio del proyecto:
    ```bash
    cd Tarea_1.2_Moviles_Desarrollo_de_una_aplicacion_movil_de_controles_basicos

   ```
3. Instalar las dependencias:
   ```bash
    flutter pub get

   ```
4. Ejecutar el proyecto: 
    ```bash
    flutter run

    ```

## Estructura del Proyecto
El proyecto está organizado de la siguiente manera:
```bash
    📂 lib
    ┣ 📂 logica
    ┃ ┣ logica_ejercicio1_ascii.dart
    ┃ ┣ logica_ejercicio2_factorial.dart
    ┃ ┣ logica_ejercicio3_mcd.dart
    ┃ ┣ logica_ejercicio4_factorizacion.dart
    ┃ ┗ logica_ejercicio5_primos.dart
    ┣ 📂 pages
    ┃ ┣ ejercicio_1_page.dart
    ┃ ┣ ejercicio_2_page.dart
    ┃ ┣ ejercicio_3_page.dart
    ┃ ┣ ejercicio_4_page.dart
    ┃ ┗ ejercicio_5_page.dart
    ┗ main.dart

```

- **logica/**: Contiene la lógica para resolver los ejercicios planteados.
- **pages/**: Contiene las páginas de la aplicación con su respectiva interfaz gráfica.
- **main.dart**: Punto de entrada de la aplicación.

## Diseño de la Aplicación
- El diseño de la aplicación sigue una paleta de colores oscuros para una experiencia moderna y agradable.
- Cada página incluye:
    1. Validaciones para manejar entradas incorrectas.
    2. Estados de carga para operaciones que tardan en completarse.
    3. Mensajes de error amigables para el usuario.

## Autoría y Colaboración
El proyecto ha sido desarrollado por un equipo de cuatro integrantes con un enfoque en resolver problemas matemáticos utilizando algoritmos simples e interfaces gráficas eficientes.

Para más detalles, visita el [repositorio del proyecto](https://github.com/Alex-Trejo/Tarea_1.2_Moviles_Desarrollo_de_una_aplicacion_movil_de_controles_basicos.git)


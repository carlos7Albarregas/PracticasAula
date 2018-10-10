# # EJERCICIO 5 - REGISTRO-SERVLET

Formularioque valida en el servidor los campos que son obligatorios (*) ademas de comprobar que se mete una fecha correcta. A la hora de la comprobacion de datos tiene que aparecer en el mismo servlet otra vez ese mismo formulario con los datos recogidos anteriormente (en el caso que sean correctos). En este proceso el cliente no se enteraria ya que es algo trasparente.

Una vez recibido el formulario, compruebo si hay errores. En el caso que no haya errores una salida de resultados y en el caso que haya errores otra vez mostramos el form e indicamos los fallos que han obtenido y los datos introducidos. Con esta opcion nos vamos a una pantalla informativa que hay errores. Para ello le pasamos toda la informacion en el formulario a traves de 'value'. Ademas, aparecera un al lado del campo erroneo una foto de un aspa y si esta correcto el check verde.
========================================================================================================================================
Entrando en mas detalle en el codigo, lo primero que hago es llamar al metodo "todoCorrecto" que lo que hace es comprobar si todas las posiciones son true, si esto fuera asi esta todo correcto. Dependiendo de si es verdadero o falso vamos a una parte del codigo u otra.

-Si es falso el formulario: lo primero que tenemos que pensar es que tiene que imprimirse todo el formulario de nuevo. A partir de aqui, ir viendo cada parte del formulario viendo sus errores. Para ello, con sentencias 'if' preguntando por el fallo segun la posicion sabremos lo que habra pasado (posicion0: fallo en el nombre, posicion1: usuario incorrecto, posicion2: fecha incorrecta, posicion4: contraseña incorrecta.

*** COMPROBACION DE ERRORES***

Esta comprobacion la hago todo en el doPost porque este metodo siempre se ejecuta cuando vamos a entrar al servlet y gracias a esto comprueba cada vez que le demos al boton "Enviar". Para comprobar nombre, usuario y contraseña hago misma logica, es decir, obtengo el parametro y una vez obtenido, pregunto por el metodo "isEmpty()" que me dira si hay algo o no. Si hay le introduzco un numero distinto de 0 (si es -1 significa que hay error). Para comprobar la fecha, si es bisiesto significa que el mes de febrero tiene un dia mes (29) los demas meses dependiendo el caso 30 o 31. Hago un array porque asi me sera mas facil comprobar cuando el dia de un mes no sea 30 o 31. A la hora de comprobar, simplemente aqui lo que hacemos es que cuando el dia que haya cogido sea menor con respecto a la posicion del mes de este dia, significa que es correcto.
************************************************

Por lo general lo que hago en cada 'if' y 'else' es:
    -True: pinto el check verde al lado del campo y recupero los datos puesto por el usuario gracias a 'value' y pasandole la variable          correspondiente, dicha variable la saco a traves del metodo getParameter().
    -False: pinto el aspa rojo al lado del campo y muestro de nuevo la cajita de comentarios o bien, si es fecha, cada selected
    

-Si es verdadero el formulario: muestro toda la salida de informacion, recorriendolo con un mapa. Lo que hago es primero para que no me muestre el valor de enviar hago una condicion, seguidamente para que no me muestre la fecha tres veces, dos condiciones para que en el caso de me venga el dia o el mesno me haga nada. Una vez que me venga ya el año es cuando voy a mostrar la fecha

# EJERCICIO 6 CABECERA DE PETICION

En este ejercicio simplemente lo que hacemos es recorrer todas las cabeceras de nuestro servidor a traves de un iterador y a la vez que la vamos obteniendo mostramos la salida hacia el usuario

# EJERCICIO 7 INFORMACION DEL CLIENTE

Mostramos al usuario informacion revelante sobre el servidor, ademas de añadir por URL parametros iniciales: "param1" y "param2" los cuales vienen ya inicializados. Estos parametros ademas de mostrarlo por html, lo mostramos tambien por consola a traves de 'request.getParameter()'

# EJERCICIO 8 PARAMETROS INICIALES
Ejercicio parecido al anterior el cual la diferencia es que, en vez de pasar los datos por URL (que la vea el usuario) lo pasamos a traves de @webServlet. Aqui en este fragmento podremos tantos parametros como nos hicieran falta respetando su sintaxis: 
@WebInitParam(name=param, value="valor")

========================================================================================================================================

# JSP - EJERCICIO 2 EDAD DE UNA PERSONA
Ejercicio que muestra al usuario la edad que tiene en años, meses y dias. Para ello, el usuario debera poner su nombre y la fecha de nacimiento(tipo date) a traves de un formulario.
En cuanto a la hora de entrarnos a la logica para calcular la edad, tenemos que saber lo primero que si la fecha de nacimiento es mayor que la fecha introducida significa que ya ha cumplido años, de lo contrario habria que restarle 1.

1) obtenemos la fecha de nacimiento a traves de 'request.getParameter()', a continuacion convertimos esta fecha (String) a Date (previamente he instanciado un objeto de la clase "SimpleDateFormat" para maquetar la fecha). Despues de esto transformo el Date a Calendar para trabajar mas comodo con la fecha (hacemos uso de setTime() habiendo creado un objeto de la clase Calendar).

2) Saber si ha nacido o no. Para ello, comparo los milisegundos entre las dos fechas. Si es menor que la fecha actual significa que no habra nacido. 
NOTA: CALENDAR.MONTH() DEVUELVE EL MES DE 0-11 SIENDO 0 ENERO Y 11 DICIEMBRE. POR ELLO LE SUMO 1 PARA NO HABER EQUIVOCACIONES
NOTA2: PARA EL CALCULO DE LOS AÑOS, SIMPLEMENTE RESTAMOS EL AÑO ACTUAL MENOS EL AÑO DE NACIMIENTO

3) Saber si la fecha actual es menor que la introducida. En este caso, SI ES MENOR IGUAL PUEDE HABER CUMPLIDO AÑOS (SI ESTA EN EL MISMO MES AL ACTUAL LA FECHA NACIMIENTO).

4) Si estamos ante el mismo mes de nacimiento al actual PODRIA haber cumplido años. Para ello tendremos que hacer uso de "DAYOFMONTH". Si el dia actual es menor al dia de nacimiento NO ha llegado aun el dia y por tanto habria que restarle 1.

4.1) Si estamos ante el mismo dia o superior al actual SI HA CUMPLIDO años y por tanto no habria que restarle 1.

5) Si la fecha introducida es mayor no ha ccumplido porque es mayor a la del usuario

6) Por ultimo, en cuanto a la hora de mostrar la informacion. Se trata de mostrar la fecha exacta con su año/s, su mes/meses y sus dia/dias cumplidos exactamente, es decir evitar sacar 0 años, 0 meses o 0 dias si es el caso. O bien sacar 1 año, 1 mes o 1 dia.
Para ello es un metodo en el que tenemos que mirar si el mes es superior a 1 sacar "MESES", dentro de este, si el dia es igual a 0 no mostrarlo, si el dia es igual a 1 sacar "1 dia" y si el dia es superior a 1 sacar "x DIAS". Este proceso se repetira tambien en el caso de que el mes sea 1 o 0.

# JSP - EJERCICIO 3 CONTROL DE COOKIES

Se trata de poder crear/consultar/modificar/eliminar una cookie a partir de la eleccion del usuario. Si por ejemplo, partiendo de que la cookie no esta creada, no se podra realizar las operaciones de consulta/modificar/borrado. En el caso de que ESTA CREADA, podra hacer uso de cualquiera de las operaciones.

En cuanto a la hora de saber si hay una cookie o no, tenemos que hacer uso del metodo 'request.getCookies()' que devuelve un array de todas las cookies que tenemos. Para realizar las operaciones anteriormente mencionadas, tenemos que tener una cookie seleccionada. Para ello, recorremos el array de cookies y si el nombre de la cookie es igual a la que ha metido el usuario trabajo con ella.

-Crear: si la cookie ya esta creada (distinta de null) no puede crearse otra vez de nuevo. En el caso de que sea nula, no existe y habria que crearla dandole una expiracion y añadiendola a response. 

-Modificar: si hay cookie, para modificarla hacemos 'setValue()' pasandole el parametro que ha metido el usuario. Le damos de nuevo una caducidad la cookie y la agregamos al response. Si no existe, devolvemos un mensaje de que no existe.

-Consultar: simplemente mostramos un mensaje de informacion sobre el nombre de la cookie y el valor.

-Eliminar: para eliminar la cookie le tenemos que poner una expiracion igual a 0 y usar 'response.addCookie()'

Cabe destacar que tenemos por un lado, el formulario html, y por otro el jsp el cual hace estas operaciones.
Desde el JSP con 'sendRedirect()' le pasamos la ruta del menuCookie, agregandole un parametro que sera la cadena de informacion dependiendo de la operacion, para que pueda otra vez volver a realizar operaciones.


# JSP - EJERCICIO 4 CALCULADORA
Calculadora estandar de numeros reales que mostrara el resultado de la suma/resta/multiplicacion/division partiendo de dos numeros introducidos por el usuario. Hay que comprobar que si el usuario mete un caracter tratemos la excepcion NumberFormatException para que pueda continuar con la ejecucion del programa. Ademas tambien hay que controlar que no se puede dividir entre cero.

Para realizar este calculo, he creado un metodo que devuelve un String (cadena) con el resultado de la opearcion y que recibe 3 parametros: la operacion, numero 1 y numero 2. Este metodo lo llamo siempre y cuando se haya seleccionado una operacion (sea distinto de null), y aqui en este fragmento de codigo es donde hago el try/catch porque es donde me puede saltar la excepcion.

# JSP - EJERCICIO 5 CONTADOR DE VISITAS CON COOKIES
CADA VEZ QUE EL USUARIO SE META EN LA PAGINA ME DIGA CUANTAS VECES LO HA VISITADO.
======================= FORMATO DE SALIDA ===========================
Mensaje de cuantas veces visita la pagina
 INFORMACION DE LA COOKIE ( SI ES LA PRIMERA VEZ)
CADUCIDAD: hasta que se cierre el navegador (-1)
nombre cookie:
segura:
version:
SOLO APARECE LA INFORMACION LA PRIMERA VEZ, si vuelvo a entra desde el menu NO tiene que aparecer la informacion
En cualquier otro caso muestra solamente el mensaje de visitas
===================================================================================================================================
Botones: Recargar (muestra el numero de veces SOLO), Eliminar (la vuelve a crear de nuevo con el mismo nombre y muestra informacion), menu inicial

Al igual que en el ejercicio de contol de cookies, selecciono una cookie comprobando de que si hay alguna o no. Cogere la primera cookie que sea distinta a la cookie creada por defecto (JSESSION)

-Si hay una cookie Y EL VALOR ES 1 o ninguno muestra el mensaje, nos crearmos la cookie (añadiendole el nombre dado y el valor "1", porque si llega aqui significa que por un lado le ha dado el usuario a eliminar o bien es la primera vez que se accede, dandole una expiracion (-1).

-Si hay cookie y el valor es mayor a 1: si el usuario ha dado a 'Recargar', para incrementar el valor tenemos que transformar el String a entero. Para ello, hacemos un 'parseInt()' del getValue(), una vez hecho esto le sumamos uno (cont=cont+1), modificamos el setValue() pasandole aqui el valor del contador transformado a String (Integer.toString(valor)) y por ultimo añadimos al response para confirmar los cambios.

-Si la cookie no esta creada salta un mensaje de que se tiene que crear previamente.

# JSP - EJERCICIO 6 CONTROL DE SESIONES

Ejercicio similar al control de cookies solo que LOS ATRIBUTOS NO SE PONEN POR PARAMETRO INICIAL (que se vea por url), SINO A TRAVES DE ATRIBUTOS DE SESIONES O DE PETICION. Pantalla principal (MenuSesiones.jsp), pantalla secundaria(ControlSesiones.jsp).
En esta pantalla principal tenemos el formulario para que el usuario meta un nombre y un valor, y 4 botones de crear/modificar/consultar/eliminar.

-Para mostrar el mensaje segun la operacion que haya seleccionada el usuario, tenemos que crear un atributo de sesion, para ello:
HttpSession sesion =request.getsession()
sesion.getAtributte ( si es distinto de nulo escribo el atributo, sino "")

-ControlSesiones.jsp: lo primero es saber si ha escrito algun nombre el usuario, en el caso de que no haya escrito nada no hacemos ninguna operacion. En caso de que SI, empieza la logica:

>SI LA SESION NO HA SIDO CREADA ("sesion.getAttribute(nombre)"), significa que la unica operacion que puede hacer el usuario es crearla ya que sin estar creada no podemos realizar el resto de operaciones. Si el usuario ha seleccionado el boton de "crear", creamos la sesion con setAttribute() pasandole como parametro los valores que haya puesto en el formulario. 

NOTA: PARA MOSTRAR EL MENSAJE HACIA LA PANTALLA PRINCIPAL LO UNICO QUE HAGO ES PASARLE LA INFORMACION COMO CADENA A UNA SESION QUE HE CREADO: "MENSAJE". AQUI EN ESTE ATRIBUTO DE SESION ES DONDE EL USUARIO VA A HABER LA SALIDA DE INFORMACION DEPENDIENDO LO QUE HAYA SELECCIONADO.

> SI LA SESION YA HA SIDO CREADA: no la puede volver a crear de nuevo. En el caso de que sea modificar hacemos uso de setAttribute() marcandole el nombre actual y el nuevo valor pasado. Si es consultar, le paso la informacion a mi variable de sesion "mensaje". Y si es eliminar, removeAttribute() y le invalidamos la sesion. 
En el caso de que la elimine la sesion, le redirigo hacia el index.html

# JSP - EJERCICIO 7 CONTADOR DE VISITAS CON SESIONES

Ejercicio que trata de hacer el mismo funcionamiento que el ejercicio anterior sobre el contador de cookies, solo que a traves de una sesion. La diferencia con respecto al anterior ejercicio, es que ahora simplemente solo tiene que mostrar unicamente el mensaje de cuantas visitada acarrea esta sesion. El usuario interactuara mediante los botones "Recargar" y "eliminar"

Antes de empezar la logica, para evitar problemas con la sesion "mensaje" la elimino porque en el caso de que no lo haga, salta un error 500.

1) Obtengo todas las variables de sesiones que haya mediante 'getAttributeNames()' como devuelve un Enumeration, lo recorremos mediante un bucle while y cogera la ultima sesion creada con su valor.

2) Si tenemos una sesion ya cogida y el usuario ha dado a recargar: pasamos el valor de la sesion (Object) a un entero. Para ello, usamos'Integer.parseInt(valor.toString()) ' incrementamos el valor a 1, transformamos el valor de la sesion con su nuevo valor a String mediante 'Integer.toString()' ,y por ultimo hacemos setAttributte() pasandole el nombre cogido de la sesion y su nuevo valor.

3) En el caso de que de a eliminar, removeAttributte() e invalidamos la sesion.

Para mostrar la informacion de cuantas visitas lleva o si hay sesion o no. Uso una variable 'salida' de tipo String la cual dependiendo el caso mostrara una salida u otra. Invocaremos esta variable antes de mostrar los botones.

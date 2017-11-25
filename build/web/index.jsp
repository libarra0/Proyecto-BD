<%-- 
    Document   : index
    Created on : 15/11/2017, 08:27:01 PM
    Author     : Leo
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gym Colima</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/fontello.css">
        <link rel="stylesheet" href="CSS/estilos.css">
    </head>
    <body>
        <header>
            <div class="contenedor">
                <h1>Gym Colima</h1>
                <input type="checkbox" id="menu-bar">
                <label class="icon-menu" for="menu-bar"></label>
                <nav class="menu">
                    <a href="#bienvenidos">Inicio</a>
                    <a href="#promociones">Promociones</a>
                    <a href="#clases">Clases</a>
                    <a href="#contacto">Contacto</a>
                </nav>
            </div>
        </header>

        <main>
            <section id="banner">
                <img src="Imagenes/gym5.jpg">
                <div class="contenedor">
                    <h2>Rutinas ideales para hombres y mujeres</h2>
                    <p>Inscribete a una clase, ¡Ahora!</p>
                    <a href="#clases">Ver más</a>
                </div>
            </section>

            <section id="bienvenidos">
                <h2>BIENVENIDOS A NUESTRO GYM</h2>
                <p>Aqui en gym colima estamos interesados en cuidar la salud de los
                    demás ------------------------------------------------------------</p>
            </section>

            <section id="blog">
                <h3>Te interesa conocer más de Gym Colima</h3>
                <div class="contenedor">
                    <article>
                        <img src="Imagenes/Instalaciones.jpg">
                        <h4>Conoce nustras instalaciones</h4>
                    </article>
                    <article>
                        <img src="Imagenes/Clases.jpg">
                        <h4>Inscribete a nuestras clases</h4>
                    </article>
                    <article>
                        <img src="Imagenes/Instructor_gym.jpg">
                        <h4>Conoce a nuestros instructores</h4>
                    </article>
                </div>
            </section>

            <section id="promociones">
                <h4>Conoce las promociones que Gym Colima tiene para ti</h4>
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid" src="Imagenes/Publicidad1.jpg" alt="First slide" width="100%" height="100%">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="Imagenes/Publicidad2.jpg" alt="Second slide" width="100%">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="Imagenes/Publicidad3.jpg" alt="Third slide" width="100%">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </section>

            <section id="clases">
                <h5>Inscríbete a una cualquiera de nuestras clases</h5>
                <h5>Clases:</h5>
                <div class="col-md-4">
                    <select class="form-control" tabindex="-1" aria-hidden="true">
                        <option active>Escoje una clase</option>
                        <%
                            try {
                                // Conexion con bd
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba", "root", "12345");
                                if (!conexion.isClosed()) {
                                    // La consulta
                                    Statement st = conexion.createStatement();
                                    ResultSet rs = st.executeQuery("select nombre from clases");

                                    //Resultado en option
                                    while (rs.next()) {
                                        out.println("<option>" + rs.getString(1) + "</option>");
                                    }

                                    // cierre de la conexion
                                    conexion.close();
                                } else {
                                    // Error en la conexion
                                    out.println("fallo");
                                }
                            } catch (Exception e) {
                                // Error en algun momento.
                                out.println("Excepcion " + e);
                                e.printStackTrace();
                            }
                        %>
                    </select>
                </div>
                <h5>Horarios:</h5>
                <div class="col-md-4">
                    <select class="form-control" tabindex="-1" aria-hidden="true">
                        <option active>Escoja un Horario</option>
                        <%
                            try {
                                // Conexion con bd
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba", "root", "12345");
                                if (!conexion.isClosed()) {
                                    // La consulta
                                    Statement st = conexion.createStatement();
                                    ResultSet rs = st.executeQuery("select horario, hora_inicio,hora_fin from clases ORDER BY hora_inicio ASC");

                                    //Resultado en option
                                    while (rs.next()) {
                                        out.println("<option>" + rs.getString(1) + " de " + rs.getString(2) + "-" + rs.getString(3) + "</option>");
                                    }

                                    // cierre de la conexion
                                    conexion.close();
                                } else {
                                    // Error en la conexion
                                    out.println("fallo");
                                }
                            } catch (Exception e) {
                                // Error en algun momento.
                                out.println("Excepcion " + e);
                                e.printStackTrace();
                            }
                        %>
                    </select>
                </div>
            </section>
        </main>


        <footer>
            <div id="contacto" class="contenedor">
                <p class="copy">Gym Colima &copy; 2012</p>
                <div class="sociales">
                    <a class="icon-facebook" href="https://www.facebook.com">GymColima</a>
                    <a class="icon-twitter" href="https://twitter.com">@GymColima1</a>
                    <a class="icon-phone">(312) 313-95-06</a>
                    <a class="icon-whatsapp">+52 1 312-35-395-06</a>
                    <a class="icon-address">Calle J. Jesús Alcaraz 528,
                        El Porvenir II, 28019 Colima, Col.</a>
                </div>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>

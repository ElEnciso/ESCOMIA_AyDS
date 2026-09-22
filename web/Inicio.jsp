<%-- 
    Document   : Inicio
    Created on : 12 sep 2026, 12:16:18 p.m.
    Author     : elencios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital Sepa-la-bola</title>
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="icon" href="img/sepa.png"/>
    </head>
    <body>
        <header>
            <jsp:include page="navbar.jsp" />
        </header>
        
        <main class="container">
            <div class="tittle">
                <h2 class="section-title">Hospital Sepa-la-bola</h2>
                <ul class="func">
                    <li><a href="#servicios">Servicios</a></li>
                    <li><a href="#especialidades">Especialidades</a></li>
                    <li><a href="medicos.jsp">Médicos</a></li>
                </ul>
            </div>
            
            <div class="contacto card-panel">
                <p class="direccion">
                    <img src="https://cdn-icons-png.flaticon.com/512/2838/2838912.png" alt="Ubicación" class="icon-small">
                    C. Porai 67, Gustavo A. Madero, 02496 CDMX, México
                </p>
                <div class="telefonos">
                    <a href="tel:+525555555555" class="btn-tel">
                        <img src="https://cdn-icons-png.flaticon.com/512/724/724664.png" alt="Teléfono" class="icon-small">
                        Atención: +52 55 5555 5555 
                    </a>
                    <a href="tel:+525555555556" class="btn-tel btn-urgencia">
                        <img src="https://cdn-icons-png.flaticon.com/512/1032/1032989.png" alt="Urgencias" class="icon-small">
                        Urgencias: +52 55 5555 5556 
                    </a>
                </div>
            </div>
            
            <div class="fila">
                <div class="columna mapa-container">
                    <iframe src="https://maps.google.com/maps?q=Edificio%20de%20IA%20-%20ESCOM%20IPN&t=&z=17&ie=UTF8&iwloc=&output=embed" width="100%" height="100%" style="border:0; border-radius: 8px;" allowfullscreen="" loading="lazy"></iframe>
                </div>
                <div class="columna carrusel-hospital">
                    <button class="carrusel-btn prev" id="btn-prev">&#10094;</button>

                    <div class="carrusel-track" id="track">
                        <img src="img/fachada.jpg" alt="Fachada del hospital">
                        <img src="img/habitacion.jpg" alt="Habitación de paciente">
                        <img src="img/laboratorio.jpg" alt="Laboratorio clínico">
                        <img src="img/quirofano.jpg" alt="Quirófano">
                    </div>

                    <button class="carrusel-btn next" id="btn-next">&#10095;</button>
                </div>
            </div>
            
            <div class="descripcion card-panel">
                <h3>Sobre Nosotros</h3>
                <p>
                    En el <strong>Hospital Sepa-la-bola</strong>, nos comprometemos a brindar atención médica de la más alta calidad. 
                    Aunque nuestro nombre diga lo contrario, contamos con tecnología de punta, quirófanos completamente equipados y un 
                    cuerpo médico altamente capacitado. Somos la mera punta del tren, el mero borrego de la barbacoa. Nuestra misión es salvaguardar tu salud con un trato humano, cálido y profesional. 
                    Estamos abiertos las 24 horas del día, los 365 días del año.
                </p>
            </div>
            
            <h3 class="section-heading">Nuestros Servicios Principales</h3>
            <section class="grid-servicios" id="servicios">
                <article class="servicio-card">
                    <h4>Urgencias 24/7</h4>
                    <p>Atención inmediata para situaciones críticas con personal especializado en trauma y reanimación.</p>
                </article>
                <article class="servicio-card">
                    <h4>Laboratorio Clínico</h4>
                    <p>Análisis de sangre, orina y patología con resultados precisos y tiempos de entrega rápidos.</p>
                </article>
                <article class="servicio-card">
                    <h4>Imagenología</h4>
                    <p>Servicios de Rayos X, Resonancia Magnética, Tomografía y Ultrasonido de última generación.</p>
                </article>
                <article class="servicio-card">
                    <h4>Farmacia Interna</h4>
                    <p>Suministro de medicamentos especializados e insumos médicos disponibles para pacientes ingresados.</p>
                </article>
            </section>
            
            <h3 class="section-heading">Directorio de Especialidades</h3>
            <section class="especialidades-container" id="especialidades">
                <ul class="lista-especialidades">
                    <li>Alergología e Inmunología</li>
                    <li>Cardiología</li>
                    <li>Cirugía General</li>
                    <li>Dermatología</li>
                    <li>Endocrinología</li>
                    <li>Gastroenterología</li>
                    <li>Ginecología y Obstetricia</li>
                    <li>Neurología</li>
                    <li>Odontología y Maxilofacial</li>
                    <li>Oncología Médica</li>
                    <li>Pediatría Integral</li>
                    <li>Psiquiatría y Psicología</li>
                    <li>Traumatología y Ortopedia</li>
                    <li>Urología</li>
                </ul>
            </section>
        </main>
        <footer class="site-footer">
            <p>&copy; 2026 ElEnciso WEB</p>
        </footer>
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                const track = document.getElementById('track');
                const btnPrev = document.getElementById('btn-prev');
                const btnNext = document.getElementById('btn-next');
                const imagenes = document.querySelectorAll('.carrusel-track img');

                if (!track || imagenes.length === 0) return;

                let enTransicion = false;
                let temporizador;

                // PREPARACIÓN DE LA CINTA: Movemos físicamente la última foto al principio.
                // Así, siempre hay una foto escondida a la izquierda por si el usuario le pica "Atrás".
                track.insertBefore(track.lastElementChild, track.firstElementChild);

                // Mantenemos la vista siempre enfocada en la segunda foto (la primera real)
                track.style.transition = "none";
                track.style.transform = "translateX(-100%)";

                function moverDerecha() { // Botón Siguiente (Flecha >)
                    if (enTransicion) return;
                    enTransicion = true;

                    // Desliza la cinta a la izquierda para mostrar la foto de la derecha
                    track.style.transition = "transform 0.5s ease-in-out";
                    track.style.transform = "translateX(-200%)";

                    // Cuando termina la animación (500ms después):
                    setTimeout(() => {
                        track.style.transition = "none";
                        // Toma la foto que quedó atrás y la manda al final de la fila
                        track.appendChild(track.firstElementChild);
                        // Resetea la cámara a la posición neutral de forma invisible
                        track.style.transform = "translateX(-100%)";
                        enTransicion = false;
                    }, 500);
                }

                function moverIzquierda() { // Botón Previo (Flecha <)
                    if (enTransicion) return;
                    enTransicion = true;

                    // Desliza la cinta a la derecha para mostrar la foto de la izquierda
                    track.style.transition = "transform 0.5s ease-in-out";
                    track.style.transform = "translateX(0%)";

                    // Cuando termina la animación:
                    setTimeout(() => {
                        track.style.transition = "none";
                        // Toma la última foto de la fila y la manda al principio
                        track.insertBefore(track.lastElementChild, track.firstElementChild);
                        // Resetea la cámara a la posición neutral
                        track.style.transform = "translateX(-100%)";
                        enTransicion = false;
                    }, 500);
                }

                // CONTROL DEL TIEMPO (Se reinicia con cada clic)
                function iniciarAutoPlay() {
                    temporizador = setInterval(moverDerecha, 4000);
                }

                function reiniciarAutoPlay() {
                    clearInterval(temporizador);
                    iniciarAutoPlay();
                }

                // ASIGNACIÓN DE BOTONES
                if (btnNext) {
                    btnNext.onclick = function() {
                        moverDerecha();
                        reiniciarAutoPlay();
                    };
                }

                if (btnPrev) {
                    btnPrev.onclick = function() {
                        moverIzquierda();
                        reiniciarAutoPlay();
                    };
                }

                // Arranca el giro automático
                setTimeout(iniciarAutoPlay, 100);
            });
        </script>
    </body>
</html>
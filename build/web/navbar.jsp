<style>
    /* Estilos del Navbar Hospitalario */
    .navbar-hospital {
        background-color: #004080; /* Azul mï¿½dico profundo */
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 40px;
        height: 70px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        position: sticky;
        top: 0;
        z-index: 1000;
        margin-bottom: 30px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .navbar-brand { 
        color: #ffffff; 
        font-size: 26px; 
        font-weight: bold; 
        text-decoration: none; 
        letter-spacing: 1px;
    }
    
    .navbar-brand span { 
        color: #4ddbff; /* Azul claro cian */
        font-weight: 300; 
    }
    
    .navbar-menu { 
        list-style: none; 
        display: flex; 
        gap: 10px; 
        margin: 0; 
        padding: 0; 
    }
    
    .navbar-menu li a {
        color: #f8f9fa; 
        text-decoration: none; 
        font-size: 15px; 
        font-weight: 500;
        padding: 10px 18px;
        border-radius: 6px; 
        transition: all 0.3s ease;
    }
    
    .navbar-menu li a:hover { 
        background-color: #0066cc; 
        color: #ffffff; 
    }
</style>

<nav class="navbar-hospital">
    <a href="Inicio.jsp" class="navbar-brand">
        Hospital <span>Sepa-la-bola</span>
    </a>
    <ul class="navbar-menu">
        <li><a href="#servicios">Servicios</a></li>
        <li><a href="#especialidades">Especialidades</a></li>
        <li><a href="medicos.jsp">Médicos</a></li>
        <li><a href="Form.html">Agendar Cita</a></li>
        <li><a href="Iniciar.html">Inciar Sesiï¿½n</a></li>
    </ul>
</nav>
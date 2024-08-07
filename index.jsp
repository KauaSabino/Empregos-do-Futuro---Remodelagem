<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="./src/style/style.css">
    <link rel="shortcut icon" href="./src/img/logo.png" type="image/x-icon">
    <title>Empregos do Futuro</title>
</head>
<body>
    
    <header>
        <a href="#"><img src="./src/img/logo.png" alt="Logo - Empregos do Futuro"></a>
        <nav>
            <ul>
                <li><a href="./index.jsp">Vagas</a></li>
                <li><a href="./formEmpresas.html">Empresas</a></li>
                <li><a href="./contato.html">Contato</a></li>
                <li><a href="./login.html">Enviar Curriculo</a></li>
            </ul>
        </nav>
    </header>
    <main>
            <img src="./src/img/banner.png" alt="Banner" id="banner">
        <div id="coluna">
            <div id="filtro">
                <h3>Filtros</h3>
                <form action="">
                    <label for="">Buscar vaga:</label>
                    <input type="text" name="" id="">

                    <label for="">Vagas por cidade:</label>
                    <select name="select">
                        <option value="Undefined" selected>Selecione...</option>
                        <option value="Centro">Centro - Guarulhos</option>
                        <option value="Sao Paulo">Centro - São Paulo</option>
                        <option value="Aruja">Arujá</option>
                        <option value="Pimentas">Pimentas</option>
                        <option value="Flamengo">Flamengo</option>
                        <option value="Vila Rosalia">Vila Rosália</option>
                        <option value="Macedo">Macedo</option>
                        <option value="Maia">Maia</option>
                        <option value="Ceacap">Cecap</option>
                        <option value="Itaquera">Itaquera</option>
                        <option value="bonsucesso">Bonsucesso</option>
                        <option value="Cumbica">Cumbica</option>
                    </select>

                    <label for="">Área de interesse:</label>
                    <select name="select">
                        <option value="Undefined" selected>Selecione...</option>
                        <option value="Administracao">Administração</option>
                        <option value="Civil">Construção Cívil</option>
                        <option value="Educacional">Educacional</option>
                        <option value="Marketing">Marketing</option>
                        <option value="Producao">Produção</option>
                        <option value="Seguranca">Segurança do Trabalho</option>
                        <option value="Tecnologia">Tecnologia</option>
                        <option value="Transportes">Transportes</option>
                        <option value="Vendas">Vendas</option>
                    </select>
                    
                </form>
            </div>
            <div id="vagas">
                <div id="subt-vagas">
                    <h2>Vagas disponiveis:</h2>
                    
                </div>
                
                <%
        //variavel para o driver
        String driver = "com.mysql.jdbc.Driver" ;

        //Carregar o driver na memória
        Class.forName( driver ) ;

        //Cria a variavel para conectar com o banco de dados
        Connection conexao ;

        //Abrir a conexao com o banco de dados
        conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmpregosDoFuturo", "root", "root") ;

        String sql = "SELECT * FROM vaga" ;

        PreparedStatement stm = conexao.prepareStatement(sql) ;

        //Cria a variavel para armazenar os dados que virão do banco 
        ResultSet dados ;
        dados = stm.executeQuery() ;

        while( dados.next() ) 
        {
            out.print("<div class='box-vaga'>");
            out.print("<i class='bi bi-briefcase icon'></i>");
            out.print("<div class='texto'>");
            out.print("<a href='./vaga.html'><h3>" + dados.getString("cargo") + "</h3></a>");
            out.print("<p>" + dados.getString("descricaoHabilidades") + "</p>");
            out.print("<p>" + dados.getString("beneficios") + "</p>");
            out.print("</div>");
            out.print("</div>");
        }

   %>
            </div>
        </div>
    </main>
    <footer>

    </footer>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>
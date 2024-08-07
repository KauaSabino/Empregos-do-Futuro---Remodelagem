<%@page language="java" import="java.sql.*" %>

<%
    //Cria variaveis para armazenar as informações digitadas pelo usuario
    String vCpf = request.getParameter("cpf") ;
    String vSenha = request.getParameter("senha") ;


    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco
    Connection conexao ;

    //Abrir a conexao com o banco
    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmpregosDoFuturo", "root", "root") ;

    String sql = "SELECT * FROM Usuario WHERE cpf=? and senha=?" ;

    //Cria a Statement para executar o comando no banco
    PreparedStatement stm = conexao.prepareStatement(sql) ;

    stm.setString( 1, vCpf );
    stm.setString( 2, vSenha );

    //Variavel para armazenar as informações que virão do banco
    ResultSet dados = stm.executeQuery() ;

    if ( dados.next() ){
        //LOGIN OK
        session.setAttribute( "usuario" , dados.getString("cpf")  ) ;
        response.sendRedirect("index.jsp") ;
    }else{
        //LOGIN incorreto
        out.print("Login incorreto");
    }


%>
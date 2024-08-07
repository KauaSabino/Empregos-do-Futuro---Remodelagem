<%@page language="java" import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    //cria as variaveis e armazena as informações digitadas pelo usuário
    String vCpf  = request.getParameter("cpf") ;
    //int    vidade = Integer.parseInt( request.getParameter("txtIdade") );
    String vEmail = request.getParameter("email");
    String vSenha = request.getParameter("senha"); 

    String vIdUser;
    String vNome = request.getParameter("nome");
    String vDataNascimento = request.getParameter("dataNascimento");
    String vSexo = request.getParameter("sexo");
    String vNacionalidade = request.getParameter("nacionalidade");
    String vCelular = request.getParameter("celular");
    String vNomeContato = request.getParameter("nomeContato");
    String vFormacao = request.getParameter("formacao");
    String vPretensaoSalarial = request.getParameter("pretensaoSalarial");
    String vCnh = request.getParameter("cnh");
    String vCategoriaCnh = request.getParameter("categoriaCnh");
    String vDeficiencia = request.getParameter("deficiencia");
    String vCep = request.getParameter("cep");
    String vEstado = request.getParameter("estado");
    String vCidade = request.getParameter("cidade");
    String vBairro = request.getParameter("bairro");
    String vRua = request.getParameter("endereco");
    String vNumero = request.getParameter("numero");
    String vPrimeiroEmprego = request.getParameter("primeiroEmprego");
    String vNomeEmprego = request.getParameter("nomeEmprego");
    String vCargoEmprego = request.getParameter("cargoEmprego");
    String vRamo = request.getParameter("ramo");
    String vDataInicio = request.getParameter("dataInicio");
    String vDataSaida = request.getParameter("dataSaida");
    String vTipoContrato = request.getParameter("tipoContrato");
    String vDescHabilidades = request.getParameter("descHabilidades");
    String vResumoProfissional = request.getParameter("resumoProfissional");
    String vObjetivos = request.getParameter("objetivos");






    //variaveis para acessar o banco de dados
    String database = "EmpregosDoFuturo"; 
    String endereco = "jdbc:mysql://localhost:3306/" + database ; 
    String usuario  = "root"; 
    String senha    = "root";

    //Driver 
    String driver = "com.mysql.jdbc.Driver" ;

    //Carrega o driver na memoria
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco
    Connection conexao ;

   //Abrir a conexao com o banco
   conexao = DriverManager.getConnection( endereco , usuario, senha) ;

   //Varival para o comando Insert do SQL
   String sql = "INSERT INTO Usuario (cpf, email, senha) values (?, ?, ?)" ;

   //Cria a variavel Statement para executar o SQL
   PreparedStatement stm = conexao.prepareStatement(sql) ;
   stm.setString(1, vCpf ) ;
   stm.setString(2, vEmail ) ;
   stm.setString(3, vSenha ) ;

   stm.execute() ;
   stm.close() ;

   String selectIdUserSql = "SELECT idUser FROM Usuario WHERE cpf = ?";
   selectIdUserStm = conexao.prepareStatement(selectIdUserSql);
   selectIdUserStm.setString(1, vCpf);
   rs = selectIdUserStm.executeQuery();
   if (rs.next()) {
            int idUser = rs.getInt("idUser");
   }
   // Fecha o ResultSet e o PreparedStatement
    rs.close();
    selectIdUserStm.close();
            // Inserir dados na tabela Curriculo
             String insertCurriculoSql = "INSERT INTO Curriculo(idUser, nome, dataNascimento, sexo, cpf, nacionalidade, celular, nomeContato, formacao, pretensaoSalarial, cnh, categoriaCnh, deficiencia, cep, estado, cidade, bairro, endereco, numero, primeiroEmprego, nomeEmprego, cargoEmprego, ramo, dataInicio, dataSaida, tipoContrato, descHabilidades, resumoProfissional, objetivos) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            insertCurriculoStm = conexao.prepareStatement(insertCurriculoSql);
            insertCurriculoStm.setInt(1, idUser);
            insertCurriculoStm.setString(2, vNome);
            insertCurriculoStm.setString(3, vDataNascimento);
            insertCurriculoStm.setString(4, vSexo);
            insertCurriculoStm.setString(5, vCpf);
            insertCurriculoStm.setString(6, vNacionalidade);
            insertCurriculoStm.setString(7, vCelular);
            insertCurriculoStm.setString(8, vNomeContato);
            insertCurriculoStm.setString(9, vFormacao);
            insertCurriculoStm.setString(10, vPretensaoSalarial);
            insertCurriculoStm.setString(11, vCnh);
            insertCurriculoStm.setString(12, vCategoriaCnh);
            insertCurriculoStm.setString(13, vDeficiencia);
            insertCurriculoStm.setString(14, vCep);
            insertCurriculoStm.setString(15, vEstado);
            insertCurriculoStm.setString(16, vCidade);
            insertCurriculoStm.setString(17, vBairro);
            insertCurriculoStm.setString(18, vRua);
            insertCurriculoStm.setInt(19, Integer.parseInt(vNumero));
            insertCurriculoStm.setBoolean(20, Boolean.parseBoolean(vPrimeiroEmprego));
            insertCurriculoStm.setString(21, vNomeEmprego);
            insertCurriculoStm.setString(22, vCargoEmprego);
            insertCurriculoStm.setString(23, vRamo);
            insertCurriculoStm.setDate(24, Date.valueOf(vDataInicio));
            insertCurriculoStm.setDate(25, (vDataSaida != null && !vDataSaida.isEmpty()) ? Date.valueOf(vDataSaida) : null);
            insertCurriculoStm.setString(26, vTipoContrato);
            insertCurriculoStm.setString(27, vDescHabilidades);
            insertCurriculoStm.setString(28, vResumoProfissional);
            insertCurriculoStm.setString(29, vObjetivos);
            insertCurriculoStm.executeUpdate();

    

    // Fecha a conexão com o banco de dados
    insertCurriculoStm.close();
    conexao.close();



   out.print("<h3>Dados gravados!</h3>") ;
   out.print("<br><br>") ;
   out.print("<a href='cadastro.html'>Voltar</a>") ;

%>



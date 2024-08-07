<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
    // Parâmetros do formulário
    String vCpf  = request.getParameter("cpf") ;
    String vEmail = request.getParameter("email");
    String vSenha = request.getParameter("senha"); 
    
    String vNome = request.getParameter("nome");
    String vDataNascimento = request.getParameter("nascimento");
    String vSexo = request.getParameter("sexo");
    String vNacionalidade = request.getParameter("nacionalidade");
    String vCelular = request.getParameter("celular");
    String vNomeContato = request.getParameter("nomeContato");
    String vFormacao = request.getParameter("formacao");
    String vPretensaoSalarial = request.getParameter("pretensaoSalario");
    String vCnh = request.getParameter("cnh");
    String vCategoriaCnh = request.getParameter("categCnh");
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
    String vObjetivos = request.getParameter("objetivoProfissional");

    Connection conexao = null;
    PreparedStatement selectIdUserStm = null;
    PreparedStatement insertCurriculoStm = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmpregosDoFuturo", "root", "root");

        
            // Usuário não existe, inserimos um novo usuário
            String insertUsuarioSql = "INSERT INTO Usuario (email, cpf, senha) VALUES (?, ?, ?)";
            PreparedStatement insertUsuarioStm = conexao.prepareStatement(insertUsuarioSql);
            insertUsuarioStm.setString(1, vEmail);
            insertUsuarioStm.setString(2, vCpf);
            insertUsuarioStm.setString(3, vSenha);
            insertUsuarioStm.executeUpdate();
            insertUsuarioStm.close();

        // Obter idUser
        String selectIdUserSql = "SELECT idUser FROM Usuario WHERE cpf = ?";
        selectIdUserStm = conexao.prepareStatement(selectIdUserSql);
        selectIdUserStm.setString(1, vCpf);
        rs = selectIdUserStm.executeQuery();
        int idUser = 0;
        if (rs.next()) {
            idUser = rs.getInt("idUser");
        }
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
        insertCurriculoStm.setInt(10, Integer.parseInt(vPretensaoSalarial));
        insertCurriculoStm.setString(11, vCnh);
        insertCurriculoStm.setString(12, vCategoriaCnh);
        insertCurriculoStm.setString(13, vDeficiencia);
        insertCurriculoStm.setString(14, vCep);
        insertCurriculoStm.setString(15, vEstado);
        insertCurriculoStm.setString(16, vCidade);
        insertCurriculoStm.setString(17, vBairro);
        insertCurriculoStm.setString(18, vRua);
        insertCurriculoStm.setInt(19, Integer.parseInt(vNumero));
        insertCurriculoStm.setString(20, vPrimeiroEmprego);
        insertCurriculoStm.setString(21, vNomeEmprego);
        insertCurriculoStm.setString(22, vCargoEmprego);
        insertCurriculoStm.setString(23, vRamo);
        insertCurriculoStm.setDate(24, java.sql.Date.valueOf(vDataInicio));
        insertCurriculoStm.setDate(25, (vDataSaida != null && !vDataSaida.isEmpty()) ? java.sql.Date.valueOf(vDataSaida) : null);
        insertCurriculoStm.setString(26, vTipoContrato);
        insertCurriculoStm.setString(27, vDescHabilidades);
        insertCurriculoStm.setString(28, vResumoProfissional);
        insertCurriculoStm.setString(29, vObjetivos);
        insertCurriculoStm.executeUpdate();

        insertCurriculoStm.close();
        conexao.close();

        out.println("<script type='text/javascript'>");
        
        out.println("window.location.href = 'login.html';"); // Substitua 'paginaDestino.jsp' pelo caminho da sua página de destino
        out.println("alert('Dados inseridos com sucesso!');");
        out.println("</script>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Erro: " + e.getMessage());
    } 
%>

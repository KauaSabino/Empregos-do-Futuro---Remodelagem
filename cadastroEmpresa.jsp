<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
    // Parâmetros do formulário
    String vRazaoSocial = request.getParameter("razaoSocial");
    String vNomeFantasia = request.getParameter("nomeFantasia");
    String vCnpj = request.getParameter("cnpj");
    String vServicoRealizado = request.getParameter("servicoRealizado");
    String vCepEmpresa = request.getParameter("cepEmpresa");
    String vEstadoEmpresa = request.getParameter("estadoEmpresa");
    String vCidadeEmpresa = request.getParameter("cidadeEmpresa");
    String vBairroEmpresa = request.getParameter("bairroEmpresa");
    String vEnderecoEmpresa = request.getParameter("enderecoEmpresa");
    String vNumeroEmpresa = request.getParameter("numeroEmpresa");
    String vEmailEmpresa = request.getParameter("emailEmpresa");
    String vTelEmpresa = request.getParameter("telEmpresa");
    String vCelEmpresa = request.getParameter("celEmpresa");
    String vResponsavelEmpresa = request.getParameter("responsavelEmpresa");
    String vSiteEmpresa = request.getParameter("siteEmpresa");
    String vObservacoes = request.getParameter("observacoes");

    String vCargoVaga = request.getParameter("cargoVaga");
    String vQuantVaga = request.getParameter("quantVaga");
    String vSalarioVaga = request.getParameter("salarioVaga");
    String vEnderecoVaga = request.getParameter("enderecoVaga");
    String vTipoVaga = request.getParameter("tipoVaga");
    String vFormacaoVaga = request.getParameter("formacaoVaga");
    String vPcd = request.getParameter("pcd");
    String vDescVaga = request.getParameter("descVaga");
    String vBeneficiosVaga = request.getParameter("beneficiosVaga");


    Connection conexao = null;
    
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmpregosDoFuturo", "root", "root");

        String insertEmpresaSql = "INSERT INTO Empresa (cnpj, razaoSocial, nomeFantasia, areaServico, cep, estado, cidade, bairro, endereco, numero, email, telefone, celular, responsavel, site, observacao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement insertEmpresaStm = conexao.prepareStatement(insertEmpresaSql);
        insertEmpresaSql.setString(1, vCnpj);
        insertEmpresaSql.setString(2, vRazaoSocial);
        insertEmpresaSql.setString(3, vNomeFantasia);
        insertEmpresaSql.setString(4, vServicoRealizado);
        insertEmpresaSql.setString(5, vCepEmpresa);
        insertEmpresaSql.setString(6, vEstadoEmpresa);
        insertEmpresaSql.setString(7, vCidadeEmpresa);
        insertEmpresaSql.setString(8, vBairroEmpresa);
        insertEmpresaSql.setString(9, vEnderecoEmpresa);
        insertEmpresaSql.setString(10, vNumeroEmpresa);
        insertEmpresaSql.setString(11, vEmailEmpresa);
        insertEmpresaSql.setString(12, vTelEmpresa);
        insertEmpresaSql.setString(13, vCelEmpresa);
        insertEmpresaSql.setString(14, vResponsavelEmpresa);
        insertEmpresaSql.setString(15, vSiteEmpresa);
        insertEmpresaSql.setString(16, vObservacoes);
        insertEmpresaStm.executeUpdate();
        insertEmpresaStm.close();

        PreparedStatement selectEmpresaStm = null;
        String selectEmpresaSql = "SELECT idEmpresa FROM Empresa WHERE cnpj = ?";
        selectEmpresaStm = conexao.prepareStatement(selectEmpresaSql);
        selectEmpresaStm.setString(1, vCnpj);
        rs = selectEmpresaStm.executeQuery();
        int idEmpresa = 0;
        if (rs.next()) {
            idEmpresa = rs.getInt("idEmpresa");
        }
        rs.close();
        selectEmpresaStm.close();

        PreparedStatement insertVagaSql = null;
        String sqlVaga = "INSERT INTO Vaga (idEmpresa, cargo, quant, salario, local, tipoContratacao, formacao, pcd, descricaoHabilidades, beneficios) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        insertVagaSql = conexao.prepareStatement(sqlVaga);
        insertVagaSql.setInt(1, idEmpresa);
        insertVagaSql.setString(2, vCargoVaga);
        insertVagaSql.setInt(3, Integer.parseInt(vQuantVaga));
        insertVagaSql.setInt(4, Integer.parseInt(vSalarioVaga));
        insertVagaSql.setString(5, vEnderecoVaga);
        insertVagaSql.setString(6, vTipoVaga);
        insertVagaSql.setString(7, vFormacaoVaga);
        insertVagaSql.setBoolean(8, vPcd);
        insertVagaSql.setString(9, vDescVaga);
        insertVagaSql.setString(10, vBeneficiosVaga);
        insertVagaSql.executeUpdate();

        insertVagaSql.close();
        conexao.close();

        out.println("<script type='text/javascript'>");
        out.println("window.location.href = 'login.html';");
        out.println("alert('Cadastrado com sucesso!');");
        out.println("</script>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Erro: " + e.getMessage());
    } 
%>

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

        // Inserir dados da empresa
        String insertEmpresaSql = "INSERT INTO Empresa (cnpj, razaoSocial, nomeFantasia, areaServico, cep, estado, cidade, bairro, endereco, email, telefone, celular, responsavel, site, observacao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement insertEmpresaStm = conexao.prepareStatement(insertEmpresaSql);
        insertEmpresaStm.setString(1, vCnpj);
        insertEmpresaStm.setString(2, vRazaoSocial);
        insertEmpresaStm.setString(3, vNomeFantasia);
        insertEmpresaStm.setString(4, vServicoRealizado);
        insertEmpresaStm.setString(5, vCepEmpresa);
        insertEmpresaStm.setString(6, vEstadoEmpresa);
        insertEmpresaStm.setString(7, vCidadeEmpresa);
        insertEmpresaStm.setString(8, vBairroEmpresa);
        insertEmpresaStm.setString(9, vEnderecoEmpresa);
        insertEmpresaStm.setString(10, vEmailEmpresa);
        insertEmpresaStm.setString(11, vTelEmpresa);
        insertEmpresaStm.setString(12, vCelEmpresa);
        insertEmpresaStm.setString(13, vResponsavelEmpresa);
        insertEmpresaStm.setString(14, vSiteEmpresa);
        insertEmpresaStm.setString(15, vObservacoes);
        insertEmpresaStm.executeUpdate();
        insertEmpresaStm.close();

        // Obter idEmpresa
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

        // Inserir dados da vaga
        String insertVagaSql = "INSERT INTO Vaga (idEmpresa, cargo, quant, salario, local, tipoContratacao, formacao, pcd, descricaoHabilidades, beneficios) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement insertVagaStm = conexao.prepareStatement(insertVagaSql);
        insertVagaStm.setInt(1, idEmpresa);
        insertVagaStm.setString(2, vCargoVaga);
        insertVagaStm.setInt(3, Integer.parseInt(vQuantVaga));
        insertVagaStm.setDouble(4, Double.parseDouble(vSalarioVaga));
        insertVagaStm.setString(5, vEnderecoVaga);
        insertVagaStm.setString(6, vTipoVaga);
        insertVagaStm.setString(7, vFormacaoVaga);
        insertVagaStm.setBoolean(8, Boolean.parseBoolean(vPcd));
        insertVagaStm.setString(9, vDescVaga);
        insertVagaStm.setString(10, vBeneficiosVaga);
        insertVagaStm.executeUpdate();
        insertVagaStm.close();
        conexao.close();

        out.println("<script type='text/javascript'>");
        out.println("alert('Cadastrado com sucesso!');");
        out.println("window.location.href = 'login.html';");
        out.println("</script>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Erro: " + e.getMessage());
    }
%>

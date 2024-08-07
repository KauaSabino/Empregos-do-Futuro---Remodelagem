function verifCNH(){
    var cnh = document.getElementById("cnh")
    if(cnh.value == "true"){
        document.getElementById("categCnh").disabled = true
    }
    else{
        document.getElementById("categCnh").disabled = false
    }
}
function verifDeficiencia(){
    var deficiencia = document.getElementById("deficiencia")
    if(deficiencia.value == "false"){
        document.getElementById("descDeficiencia").disabled = true
    }
    else{
        document.getElementById("descDeficiencia").disabled = false
    }
}
function verifEmprego(){
    
    var emprego = document.getElementById("primeiroEmprego")
    if(emprego.value == "false"){
        document.getElementById("nomeEmprego").disabled = false
        document.getElementById("cargoEmprego").disabled = false
        document.getElementById("ramo").disabled = false
        document.getElementById("dataInicio").disabled = false
        document.getElementById("dataSaida").disabled = false
        document.getElementById("tipoContrato").disabled = false
        document.getElementById("descHabilidades").disabled = false
    }
    else{
        document.getElementById("nomeEmprego").disabled = true
        document.getElementById("cargoEmprego").disabled = true
        document.getElementById("ramo").disabled = true
        document.getElementById("dataInicio").disabled = true
        document.getElementById("dataSaida").disabled = true
        document.getElementById("tipoContrato").disabled = true
        document.getElementById("descHabilidades").disabled = true
    }
}
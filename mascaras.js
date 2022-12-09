
function MascaraCep(cep){
	
    if(mascaraInteiro(cep)==false){
        event.returnValue = false;
    }       
	
    return formataCampo(cep, '00.000-000', event);
	
}

function ValidaCep(cep){
	
    exp = /\d{2}\.\d{3}\-\d{3}/
    if(!exp.test(cep.value))
    alert('Numero de Cep Invalido!');   
				
}

function MascaraCelular(telefone){
	
	if(mascaraInteiro(telefone)==false){
		event.returnValue = false;
	}
	
	return formataCampo(telefone, '(00) 00000-0000', event);
		
}

//valida celular
function ValidaCelular(telefone){
	
    exp = /\(\d{2}\)\ \d{5}\-\d{4}/
    if(!exp.test(telefone.value))
        alert('Numero de Celular Invalido!');
				
}

//valida numero inteiro com mascara
function mascaraInteiro(){
	
    if (event.keyCode < 48 || event.keyCode > 57){
        event.returnValue = false;
        return false;
    }
	
    return true;
		
}

//formata de forma generica os campos
function formataCampo(campo, Mascara, evento) { 

    var boleanoMascara; 
        
    var Digitato = evento.keyCode;
    exp = /\-|\.|\/|\(|\)| /g
    campoSoNumeros = campo.value.toString().replace( exp, "" ); 
   
    var posicaoCampo = 0;    
    var NovoValorCampo="";
    var TamanhoMascara = campoSoNumeros.length;; 
        
    if (Digitato != 8) { // backspace 
        for(i=0; i<= TamanhoMascara; i++) { 
		
            boleanoMascara  = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
				|| (Mascara.charAt(i) == "/")) 
				
            boleanoMascara  = boleanoMascara || ((Mascara.charAt(i) == "(") 
				|| (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " ")) 
				
            if (boleanoMascara) { 
                NovoValorCampo += Mascara.charAt(i); 
                TamanhoMascara++;
            }else { 
                NovoValorCampo += campoSoNumeros.charAt(posicaoCampo); 
                posicaoCampo++; 
            } 
			
        }  
		
        campo.value = NovoValorCampo;
        return true; 
		
    }else { 
        return true; 
    }
}
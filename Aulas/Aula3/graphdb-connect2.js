var axios = require('axios');

var prefixes = `
    PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
    PREFIX owl: <http://www.w3.org/2002/07/owl#>
    PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
    PREFIX noInference: <http://www.ontotext.com/explicit#>
    PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
    PREFIX h: <http://www.prc.di.uminho.pt/2020/advogados#>
    `
var getLink = "http://localhost:7200/repositories/historia-prc2020" + "?query="

var query = `SELECT ?s WHERE {
     ?s rdf:type h:Advogado
}`

var encoded = encodeURIComponent(prefixes + query)

axios.get(getLink + encoded)
    .then(data => console.log(JSON.stringify(data.data)))
    .catch(erro => console.log(erro));
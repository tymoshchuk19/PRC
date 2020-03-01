var axios = require('axios');

axios.get("http://localhost:7200/repositories/historia-prc2020")
    .then(data => console.log(JSON.stringify(data.data)))
    .catch(erro => console.log(erro));
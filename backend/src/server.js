const express = require('express');

const app = express();

const mongoconnect = require('mongoose');
const Note = require('./models/Note');
const bodypar = require('body-parser');
app.use(bodypar.urlencoded({extended:false}));
app.use(bodypar.json());
mongoconnect.connect('mongodb+srv://pratikgaikwad072002:Acerapp@cluster0.tlu1ipi.mongodb.net/notedDB').then(
function()
{
    app.get("/" , function(req,res){
        res.send("This is Home Page");
        });

      const noterouter = require('./routes/Note')
      app.use("/notes" , noterouter)  
        
        

}
)



app.listen(2000 , function(){
console.log("app running on Server : 2000 ");
});

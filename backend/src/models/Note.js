const mongoconnect = require('mongoose');

const NotesSchema = mongoconnect.Schema({
    id :{
        type : String,
        unique: true,
        required : true
    },
    name :{
        type : String,
        required:true
    },
    userId :{
        type:String,
        required:true
    },
    CreatedOn :{
        type:Date,
        default : Date.now
    },
    title:{
        type : String ,
        required : true

    }
})

module.exports = mongoconnect.model("Note", NotesSchema);

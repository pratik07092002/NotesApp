const express = require('express')
const router = express.Router()

const Note = require('./../models/Note')
router.get("/lists" ,async function(req,res) {
    var notes = await Note.find({userId : req.body.userId});
    res.json(notes);
}); 
router.post("/add" , async function(req,res) {
    await Note.deleteOne({id: req.body.id})
   // res.json(req.body);
    const newnote = new Note({
        id : req.body.id,
        userId : req.body.userId,
        title : req.body.title,
        name : req.body.name
    })

  await  newnote.save();
  const reponse = { Message : `New note created with id: ${req.body.id} ` };
    res.json(reponse);
}); 
router.post("/delete" , async function(req,res){
    await Note.deleteOne({id : req.body.id})

    const respnse = { Message : `Note Deleted with id: ${req.body.id} `};
    res.json(respnse)
})

module.exports = router
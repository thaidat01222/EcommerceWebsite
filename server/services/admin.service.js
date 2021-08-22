const login_services = require('../services/login.service');
const user_models = require('../models/user.models');
const book_models = require('../models/book.model');
const jwt = require('jsonwebtoken');

exports.adminAuth = async (req, res) => {
    console.log('adminAuth ');
    let auth = await login_services.authorization(req);
    if(auth.authorization == true && auth.id == 0 ){
        return true;
    }else{
        return false;
    }
}


exports.displayUser = async (req, res) => {
    console.log('display-user');
    let adminAuth = await this.adminAuth(req);
    if(adminAuth){
        let resulst = await user_models.getAllUser();
        res.status(200).send(resulst);
    }else{
        res.status(401).send('Loi adminAuth');
    }
}

exports.addUser = async (req, res) => {
    console.log('addUser admin');
    let auth = await login_services.authorization(req);
    if (auth.authorization == true && auth.id == 0) {
        let account = {
            id: req.body.id,
            email: req.body.email,
            password: req.body.pass,
            username : req.body.username,
            firstname: req.body.firstName,
            lastname: req.body.lastName,
            address: req.body.address
        }
        console.log(account)
        let results = await user_models.addUser(account);
        res.status(200).send('Add thanh cong');
    }else{
        res.status(400).send('Loi addUser')
    }
}

exports.updateUser = async (req,res)=>{
    let auth = await login_services.authorization(req);
    if (auth.authorization == true && auth.id == 0) {
        let account = {
            id: req.body.id,
            username: req.body.username,
            password: req.body.pass,
            firstname: req.body.firstName,
            lastname: req.body.lastName,
            address: req.body.address
        }
        console.log(account);
        let results = await user_models.updateUser(account);
        res.status(200).send('Add thanh cong');
    }else{
        res.status(400).send('Loi addUser')
    }
    
}

exports.deleteUser = async (req, res)=>{
    console.log('admin delete');
    let adminAuth = await this.adminAuth(req);
    if(adminAuth){
        let id = req.body.id;
        let resulst = await user_models.deleteUser(id);
        res.status(200).send("Xoa thanh cong");
    }else{
        res.status(401).send('Loi adminAuth');
    }
}

exports.displayBook = async (req, res) => {
    console.log('display-book');
    let adminAuth = await this.adminAuth(req);
    if(adminAuth){
        let resulst = await book_models.getAllBook();
        res.status(200).send(resulst);
    }else{
        res.status(401).send('Loi adminAuth');
    }
}
exports.displayDiscount = async (req, res) =>{
    console.log('display-discount');
    let adminAuth = await this.adminAuth(req);
    if(adminAuth){
        let resulst = await user_models.getAllDiscount();
        res.status(200).send(resulst);
    }else{
        res.status(401).send('Loi adminAuth');
    }
}

exports.deleteVoucher = async (req, res)=>{
    console.log('delete-voucher');
    let adminAuth = await this.adminAuth(req);
    if(adminAuth){
        let id = req.body.id;
        let resulst = await user_models.deleteDiscount(id);
        res.status(200).send("Xoa thanh cong");
    }else{
        res.status(401).send('Loi adminAuth');
    }
}
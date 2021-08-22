const nodemailer = require('nodemailer');
const user_models = require('../models/user.models');
const login_services = require('./login.service');

exports.userInfo = async (req, res) => {
    console.log('userInfo');
    let auth = await login_services.authorization(req);
    console.log(new Date(), 'auth ', auth);
    if (auth.authorization) {
        let userInfo = await user_models.getUserById(auth.id);
        console.log('userInfo', userInfo[0]);
        res.status(200).send(userInfo[0]);
    } else {
        res.status(400).send('Bạn Phải Đăng Nhập Để Xem Phần này');
    }
}

exports.userUpdate = async (req, res) => {
    console.log(new Date(), 'userUpadate');
    let auth = await login_services.authorization(req);
    console.log(new Date(), 'auth ', auth);
    if (auth.authorization) {
        let account = {
            id: auth.id,
            username: req.body.username,
            firstName: req.body.firstName,
            lastName: req.body.lastName,
            university: req.body.university,
            profession: req.body.profession,
            address: req.body.address,
            city: req.body.city,
            country: req.body.country,
            linkFacebook: req.body.linkFacebook,
            synopsis: req.body.synopsis
        }
        console.log(new Date(), 'account', account)
        let userUpdate;
        try {
            userUpdate = await user_models.userUpdate(account);
        } catch (err) {
            console.log(err);
        }
        if (userUpdate) {
            res.status(200).send('Update thanh cong');
        } else {
            res.status(400).send('Update khong thanh cong');
        }
    }
}

exports.addToCart = async (req, res) => {
    console.log('user-services addToCart');
    let auth = await login_services.authorization(req);
    if (auth.authorization) {
        let idUser = auth.id;
        let idBook = req.body.id;
        console.log('idbook', idBook);
        console.log('iduser', idUser);
        try {
            await user_models.updateIdInCart(idUser, idBook);
            res.status(200).send('Update thanh cong')
        } catch (err) {
            res.status(400).send(err)
        }
    } else {
        res.status(400).send('Chua Dang Nhap')
    }
}

exports.removeIdInCart = async (req, res) => {
    console.log('user-services removeIdInCart');
    let auth = await login_services.authorization(req);
    if (auth.authorization) {
        let idUser = auth.id;
        let idBook = req.body.id;
        console.log('idbook', idBook);
        console.log('iduser', idUser);
        try {
            await user_models.removeIdInCart(idUser, idBook);
            res.status(200).send('Remove thanh cong');
        } catch (err) {
            res.status(400).send(err);
        }
    } else {
        res.status(400).send('Chua Dang Nhap');
    }
}

exports.subcribeEmail = async (req, res) => {
    let email = req.body.email;
    console.log('subcribe email');
    const option = {
        service: 'gmail',
        auth: {
            user: 'percyusjasson@gmail.com', 
            pass: 'thaidat01222@@A' 
        }
    };
    var transporter = nodemailer.createTransport(option);

    transporter.verify(function (error, success) {
        if (error) {
            console.log(error);
        } else { 
            console.log('Kết nối thành công!');
            var mail = {
                from: 'percyusjasson@gmail.com', 
                to: email, 
                subject: 'Thư được gửi bằng Node.js', 
                text: 'Percy Book Store :Ban Da Dang Ky Thanh Cong', 
            };   
            transporter.sendMail(mail, function (error, info) {
                if (error) { 
                    console.log('gui email loi',error);
                } else { 
                    console.log('Email sent: ' + info.response);
                }
            });
        }
    });
}
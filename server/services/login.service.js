const jwt = require('jsonwebtoken');
const user_models = require('../models/user.models');

exports.authorization = async (req) => {
    console.log('autherization');
    try {
        let token = req.headers.authorization;
        console.log(new Date(), 'token = ', token);
        if (token == null) {
            return auth = { authorization: false };
        }
        let check_token = jwt.verify(token, 'mk');
        console.log('check', check_token);
        if (check_token != null) {
            let auth = {
                authorization: true,
                id: check_token.id
            }
            return auth;
        } else {
            let auth = {
                authorization: false
            }
            return auth;
        }

    } catch (err) {
        console.log('token error: ', err);
        let auth = {
            authorization: false
        }
        return auth;
    }

}

exports.auth = async (req, res) => {
    let auth = await this.authorization(req);
    console.log(new Date(), 'auth ', auth);
    if (auth.authorization) {
        res.status(200).send('Da dang nhap')
    } else {
        res.send('Chua dang nhap');
    }
}

exports.login = async (req, res) => {
    console.log("login", req);

    let account = {
        email: req.body.email,
        password: req.body.password
    }
    console.log('login_account', account)
    let authentication = await user_models.login(account)
    if (authentication.length == 1) {
        if (authentication[0].account_type == 'client') {
            let token = jwt.sign({ id: authentication[0].id }, 'mk');
            console.log("Login thanh cong");
            res.status(200).json({
                message: 'Đăng Nhập Thành Công!',
                token: token,
                account_type : 'client'
            })
        } else {
            let token = jwt.sign({ id: authentication[0].id }, 'mk');
            console.log("Login thanh cong");
            res.status(200).json({
                message: 'Đăng Nhập Thành Công!',
                token: token,
                account_type : 'staff'
            })
        }
    } else {
        console.log("Login Loi")
        res.status(400).send("Sai thong tin dang nhap")
    }
}

exports.signup = async (req, res) => {
    console.log("Signup");
    let account = {
        firstName: req.body.firstName,
        lastName: req.body.lastName,
        email: req.body.email,
        password: req.body.password,
    }
    console.log('signup', account);
    let checkAccount = await user_models.getUserByEmail(account.email);
    if (checkAccount.length != 0) {
        res.status(400).send('Email da ton tai');

    } else {
        await user_models.signup(account);
        res.status(200).send('Tao tai khoan thanh cong');
    }
}

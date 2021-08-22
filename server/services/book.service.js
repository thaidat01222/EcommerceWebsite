const book_models = require('../models/book.model');
const user_models = require('../models/user.models');
const login_services = require('../services/login.service');
exports.newBook = async (req, res) => {
    try {
        let books = await book_models.getNewBook();
        res.status(200).send(books);
    } catch (err) {
        console.log(err);
        res.status(401).send(err);
    }
}

exports.trendingBook = async (req, res) => {
    try {
        let books = await book_models.getTrendingBook();
        res.status(200).send(books);
    } catch (err) {
        console.log(err);
        res.status(401).send(err);
    }
}

exports.recommendBook = async (req, res) => {
    try {
        let books = await book_models.getRecommendBook();
        res.status(200).send(books);
    } catch (err) {
        console.log(err);
        res.status(401).send(err);
    }
}

exports.bookInfo = async (req, res) => {
    let id = req.params.id;
    try {
        let books = await book_models.getBookInfoById(id);
        res.status(200).send(books);
    } catch (err) {
        console.log(err);
        res.status(401).send(err);
    }
}

exports.getBookByType = async (req, res) => {
    let type = req.params.type;
    try {
        let books = await book_models.getBookByType(type);
        let date = new Date();
        for (let item = 0; item < books.length; item++) {
            if (date - books[item].dateUpdate >= 60480000) {
                books[item].dateUpdate = ''
            } else {
                books[item].dateUpdate = 'NEW'
            }
        }
        res.status(200).send(books);
    } catch (err) {
        console.log(err);
        res.status(400).send('Loi ', err);
    }
}

exports.countBookByType = async (req, res) => {
    let books = []
    try {
        let book_domestic = await book_models.countBookByType();
        console.log('domes_service', book_domestic);
        books[0] = book_domestic;
        console.log('books', books)
        res.send(books);
    } catch (err) {
        console.log(err);
    }
}
function processStringOfIdInCart(string) {
    string = string.slice(2);
    let listIdOfBookInCart = string.split(' ');
    console.log(string);
    console.log(listIdOfBookInCart);
    return listIdOfBookInCart;
}

exports.productInCart = async (req, res) => {
    console.log('productInCart');
    let auth = await login_services.authorization(req);
    if (auth.authorization) {
        let stringOfIdInCart = await user_models.getIdInCart(auth.id);
        console.log('stringOfIdCart ', stringOfIdInCart);
        let listIdOfBookInCart = processStringOfIdInCart(stringOfIdInCart);
        console.log('listIdOfBookInCart ', listIdOfBookInCart);
        let results = [];
        for (let index = 0; index < listIdOfBookInCart.length; index++) {
            results[index] = await book_models.getBookInfoById(listIdOfBookInCart[index]);
        }
        res.status(200).send(results);
    } else {
        res.status(400).send('Bạn Phải Đăng Nhập Để Xem Phần này');
    }
}

exports.countProductInCart = async (req, res) => {
    console.log('countProductInCart');
    let auth = await login_services.authorization(req);
    if (auth.authorization) {
        let stringOfIdInCart = await user_models.getIdInCart(auth.id);
        console.log('stringOfIdCart ', stringOfIdInCart);
        let listIdOfBookInCart = processStringOfIdInCart(stringOfIdInCart);
        console.log('listIdOfBookInCart ', listIdOfBookInCart);
        let results = [];
        for (let index = 0; index < listIdOfBookInCart.length; index++) {
            results[index] = await book_models.getBookInfoById(listIdOfBookInCart[index]);
        }
        res.status(200).send(results);
    } else {
        res.status(400).send('Bạn Phải Đăng Nhập Để Xem Phần này');
    }
}

exports.getAllNewBook = async (req, res) => {
    try {
        let books = await book_models.getAllNewBook();
        res.status(200).send(books);
    } catch (err) {
        res.status(400).send(err);
    }
}

exports.getAllTrendingBook = async (req, res) => {
    try {
        let books = await book_models.getAllTrendingBook();
        res.status(200).send(books);
    } catch (err) {
        res.status(400).send(err);
    }
}

exports.requestBook = async (req, res) =>{
    console.log('bookservices - requestBook ');
    let auth = await login_services.authorization(req);
    if(auth.authorization){
        let email = await user_models.getUserById(auth.id);
        let book_request = {
            email: email[0].email,
            name : req.body.name,
            author : req.body.author,
            country : req.body.country
        }
        let results = await book_models.requestBook(book_request);
        res.status(200).send("Gui request thanh cong");
    }else{
        res.status(401).send("Ban phai dang nhap de gui request");
    }
}

exports.search = async(req, res) =>{
    let key = req.params.key;
    console.log('key', key)
    let book = [] ;
    book = await book_models.getAllBook();
    console.log('book', book.length);
    let results_book = [];
    for (let i = 0; i< book.length; i++){
        var nameofbook = book[i].nameofbook;
        console.log('string',nameofbook);
        if(nameofbook.indexOf(key) != -1){
            results_book.push(book[i])
        }
    }
    console.log('search', results_book);
    res.status(200).send(results_book);
}
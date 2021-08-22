const book_services = require('../services/book.service');
const login_services = require('../services/login.service');
const user_services = require('../services/user.service');
const discount_services = require('../services/discount.service');
const admin_service = require('../services/admin.service');

exports.registerEndpoint = (app) =>{
    app.post('/api/login', login_services.login);

    app.get('/api/newbook', book_services.newBook);

    app.get('/api/trendingbook', book_services.trendingBook);

    app.get('/api/recommendbook' , book_services.recommendBook);

    app.get('/api/bookinfo/:id' , book_services.bookInfo);

    app.post('/api/auth', login_services.auth);

    app.post('/api/signup', login_services.signup);

    app.post('/api/user' , user_services.userInfo);

    app.post('/api/userupdate', user_services.userUpdate);

    app.get('/api/bookByType/:type', book_services.getBookByType);

    app.get('/api/countBookByType', book_services.countBookByType);

    app.post('/api/productInCart', book_services.productInCart);

    app.get('/api/search/:key', book_services.search);

    app.post('/api/countProductInCart', book_services.countProductInCart)

    app.get('/api/getAllNewBook' , book_services.getAllNewBook);

    app.get('/api/getAllTrendingBook' , book_services.getAllTrendingBook);

    app.post('/api/discount' , discount_services.checkDiscount);

    app.post('/api/addToCart', user_services.addToCart);

    app.post('/api/removeIdInCart', user_services.removeIdInCart);

    app.post('/api/requestBook', book_services.requestBook);

    app.post('/api/subcribeEmail', user_services.subcribeEmail);

    app.post('/api/admin/auth', admin_service.adminAuth);
    
    app.post('/api/admin/displayUser', admin_service.displayUser);

    app.post('/api/admin/addUser', admin_service.addUser);

    app.post('/api/admin/deleteUser', admin_service.deleteUser);

    app.post('/api/admin/displayBook', admin_service.displayBook);

    // app.post('/api/admin/addBook', admin_service.addBook);

    // app.post('/api/admin/updateBook', admin_service.updateBook);

    // app.post('/api/admin/deleteBook', admin_service.deleteBook);

    app.post('/api/admin/updateUser', admin_service.updateUser);


    app.post('/api/admin/displayDiscount', admin_service.displayDiscount);

    // app.post('/api/admin/addVoucher', admin_service.addVoucher);

    app.post('/api/admin/deleteDiscount', admin_service.deleteVoucher);
}
const db = require('./database');

exports.getUserByEmail = async (email) => {
    let sql = `SELECT (email) FROM user WHERE email = '${email}'`;
    try {
        const [results, field] = await db.query(sql);
        return results;
    } catch (err) {
        console.log(err)
    }
}

exports.getUserById = async (Id) => {
    let sql = `SELECT * FROM user WHERE id = '${Id}'`;
    try {
        const [results, field] = await db.query(sql);
        return results;
    } catch (err) {
        console.log(err)
    }
}

exports.signup = async (account) => {
    let sql = `INSERT INTO user(firstName, lastName, email, password) VALUES ("${account.firstName}","${account.lastName}","${account.email}","${account.password}")`;
    console.log('signup: ', sql);
    try {
        const [results, field] = await db.query(sql);
    } catch (err) {
        console.log(err)
    }
}

exports.login = async (account) => {
    let sql = `SELECT (id),(email),(password),(account_type) FROM user WHERE ((email = '${account.email}') AND (password = '${account.password}'))`;
    console.log('login', sql);
    try {
        const [results, field] = await db.query(sql);
        return results;
    } catch (err) {
        console.log(err);
    }
}

exports.userUpdate = async (account) => {
    let sql = `UPDATE user SET username = '${account.username}', firstName = '${account.firstName}', lastName = '${account.lastName}', university = '${account.university}', profession = '${account.profession}', address = '${account.address}', city = '${account.city}', country = '${account.country}', linkFacebook = '${account.linkFacebook}', synopsis = '${account.synopsis}' WHERE id = '${account.id}'`;
    console.log(new Date(), 'userUpdate', sql);
    try {
        const [results, field] = await db.query(sql);
        return true;
    } catch (err) {
        console.log(err);
        return false;
    }
}

exports.getIdInCart = async (id) => {
    let sql = `SELECT (idInCart) FROM user WHERE id = '${id}'`;
    console.log(new Date(), 'getIdInCart', sql);
    try {
        const [resulst, field] = await db.query(sql);
        return resulst[0].idInCart;
    } catch (err) {
        console.log(err);
    }
}

exports.updateIdInCart = async (idUser, idBook) => {
    console.log('updateIdInCart');
    let getIdInCart = await this.getIdInCart(idUser);
    console.log('temp', getIdInCart);
    getIdInCart += ' ' + idBook;
    console.log('temp2', getIdInCart);
    let sql = `UPDATE user SET idInCart = '${getIdInCart}' WHERE id = '${idUser}'`
    console.log('updateIdInCart', sql);
    try {
        const [resulst, field] = await db.query(sql);

    } catch (err) {
        console.log(err);
    }
}

exports.removeIdInCart = async (idUser, idBook) => {
    console.log('removeIdInCard');
    let getIdInCart = await this.getIdInCart(idUser);
    console.log('string', getIdInCart)
    let stringIdBook = idBook.toString();
    let lengthStringIdBook = stringIdBook.length;
    console.log('length', lengthStringIdBook);
    let indexOfIdBook = getIdInCart.indexOf(stringIdBook);
    if (getIdInCart[indexOfIdBook + lengthStringIdBook] == ' ') {
        console.log('case 1');
        getIdInCart = getIdInCart.replace(` ${stringIdBook} `, ' ');
        console.log('getIdInCart in case 1', getIdInCart);
    }else if ((indexOfIdBook + lengthStringIdBook + 1 > getIdInCart.length)) {
        console.log('case 2')
        for (let index = 1; index <= lengthStringIdBook + 1; index++) {
            getIdInCart = getIdInCart.substring(0, getIdInCart.length - 1);
        }
        console.log('getIdInCart in case 2', getIdInCart);
    }

    let sql = `UPDATE user SET idInCart = '${getIdInCart}' WHERE id = '${idUser}'`
    try {
        const [results, field] = await db.query(sql);
    } catch (err) {
        console.log(err);
    }
}

exports.getAllDiscount = async () =>{
    let sql = `SELECT * FROM discount WHERE 1=1 ORDER BY id ASC `;
    try{
        const [resulst, field] = await db.query(sql);
        return resulst;
    }catch(err){
        console.log(err)
    }
}

exports.getAllUser = async () =>{
    let sql = `SELECT * FROM user WHERE email <> 'admin@gmail.com' ORDER BY id ASC `;
    try{
        const [results, field] = await db.query(sql);
        return results;
    }catch(err){
        console.log(err);
    }
}

exports.addUser = async (account)=>{
    let sql = `INSERT INTO user(id,email, password,username,firstName, lastName, address) VALUES ("${account.id}","${account.email}","${account.password}","${account.username}","${account.firstname}","${account.lastname}","${account.address}")`;
    try{
        const [results, field] = await db.query(sql);
    }catch(err){
        console.log(err);
    }
}

exports.updateUser = async (account)=>{
    console.log('update user');
    let sql = `UPDATE user SET username = '${account.username}', firstName = '${account.firstname}', lastName = '${account.lastname}', address = '${account.address}' WHERE id = ${account.id}`;
    try{
        const [results, field] = await db.query(sql);
    }catch(err){
        console.log(err);
    }
}

exports.deleteUser = async (id)=>{
    console.log('delete user');
    let sql = `DELETE FROM user WHERE id = '${id}'`;
    try{
        const [results, field] = await db.query(sql);
    }catch(err){
        console.log(err);
    }
}
exports.deleteDiscount = async (id)=>{
    console.log('delete discount');
    let sql = `DELETE FROM discount WHERE id = '${id}'`;
    try{
        const [results, field] = await db.query(sql);
    }catch(err){
        console.log(err);
    }
}
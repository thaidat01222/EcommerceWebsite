const db = require('./database');

exports.getNewBook = async () => {
    let sql = `SELECT (nameofbook),(image),(id),(price) FROM book ORDER BY dateUpdate DESC LIMIT 8`
    console.log('getNewBook ', sql);
    try {
        const [results, field] = await db.query(sql);
        return results;
    } catch (err) {
        console.log(err)
    }

}

exports.getTrendingBook = async () => {
    let sql = "SELECT (nameofbook),(image),(id),(price) FROM book ORDER BY countBuy DESC LIMIT 8";
    console.log('getTrendingBook ', sql);
    try {
        const [results, field] = await db.query(sql);
        return results;
    } catch (err) {
        console.log(err);
    }
}

exports.getRecommendBook = async () => {
    // let sql = "SELECT (nameofbook),(image),(id),(price) FROM book ORDER BY countBuy ASC LIMIT 12";
    let sql = "SELECT (nameofbook),(image),(id),(price) FROM book ORDER BY countBuy ASC LIMIT 12";
    console.log('getRecommendBook ', sql);
    try {
        const [results, field] = await db.query(sql);
        return results;
    } catch (err) {
        console.log(err);
    }
}

exports.getBookInfoById = async (id) => {
    let sql = `SELECT * FROM book WHERE id = ${id}`;
    console.log('getBookInfo ', sql);
    try {
        const [results, field] = await db.query(sql);
        return results;
    } catch (err) {
        console.log(err);
    }
}

exports.getBookByType = async (type) => {
    let sql = `SELECT * FROM book WHERE type = '${type}' ORDER BY dateUpdate DESC`;
    console.log('getBookByType', sql);
    try {
        const [results, field] = await db.query(sql);
        return results;
    } catch (err) {
        console.log(err);
    }
}

exports.countBookByType = async () => {
    let sql_domestic = `SELECT COUNT(type) AS count_domestic FROM book WHERE type = 'domestic_literature'`;
    let sql_foreign = `SELECT COUNT(type) AS count_foreign FROM book WHERE type = 'foreign_literature'`;
    let sql_art = `SELECT COUNT(type) AS count_art FROM book WHERE type = 'art'`
    let sql_education = `SELECT COUNT(type) AS count_education FROM book WHERE type = 'domestic_education'`;
    let sql_science = `SELECT COUNT(type) AS count_science FROM book WHERE type = 'science_and_technology'`;
    let sql_family = `SELECT COUNT(type) AS count_family FROM book WHERE type = 'family_and_children'`;
    let sql_political = `SELECT COUNT(type) AS count_political FROM book WHERE type = 'political'`;
    let sql_comic = `SELECT COUNT(type) AS count_comic FROM book WHERE type = 'comic'`;
    let results = {
        count_domestic: '',
        count_foreign: '',
        count_art: '',
        count_education: '',
        count_science: '',
        count_family: '',
        count_political: '',
        count_comic: ''
    };
    try {
        const [results_domestic, field_domestic] = await db.query(sql_domestic);
        const [results_foreign, field_foreign] = await db.query(sql_foreign);
        const [results_art, field_art] = await db.query(sql_art);
        const [results_education, field_education] = await db.query(sql_education);
        const [results_science, field_science] = await db.query(sql_science);
        const [results_family, field_family] = await db.query(sql_family);
        const [results_political, field_political] = await db.query(sql_political);
        const [results_comic, field_comic] = await db.query(sql_comic);
        results.count_domestic = results_domestic[0].count_domestic;
        results.count_foreign = results_foreign[0].count_foreign;
        results.count_art = results_art[0].count_art;
        results.count_education = results_education[0].count_education;
        results.count_science = results_science[0].count_science;
        results.count_family = results_family[0].count_family;
        results.count_political = results_political[0].count_political;
        results.count_comic = results_comic[0].count_comic;
        return results;
    } catch (err) {
        console.log(err);
    }
}

exports.getAllNewBook = async () =>{
    let sql = `SELECT * FROM book WHERE dateUpdate > SUBDATE(NOW(), 7) `  ;
    try{
        const [results, field ] = await db.query(sql);
        return results;
    }catch(err){
        console.log(err);
    }
}

exports.getAllTrendingBook = async () =>{
    let sql = `SELECT * FROM book ORDER BY countBuy DESC LIMIT 24`  ;
    try{
        const [results, field ] = await db.query(sql);
        return results;
    }catch(err){
        console.log(err);
    }
}

exports.getAllBook = async () =>{
    let sql = `SELECT * FROM book WHERE 1 = 1 ORDER BY id ASC` ;
    try{
        const [resulst, field] = await db.query(sql);
        return resulst;
    }catch(err){
        console.log(err);
    }
}

exports.requestBook = async (book_request) =>{
    let sql = `INSERT INTO request ( email, nameofbook, author, country) VALUES ('${book_request.email}','${book_request.name}','${book_request.author}','${book_request.country}')`;
    try{
        const [results, field] = await db.query(sql);
        return results;
    }catch(err) {
        console.log(err);
    }
}
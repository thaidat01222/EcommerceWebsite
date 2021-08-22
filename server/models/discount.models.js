const db = require('./database');

exports.checkDiscount = async(discount) =>{
    console.log('discount-model checkDiscount');
    let sql = `SELECT * FROM discount WHERE nameOfDiscount = '${discount}'`;
    try{
        const [resulst, field] = await db.query(sql);
        console.log('value DB',resulst);
        return resulst;
    }catch(err){
        console.log(err)
        return 0;
    }
}
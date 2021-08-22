const discount_models = require('../models/discount.models');
const login_services = require('../services/login.service');
exports.checkDiscount = async (req, res) => {
    console.log('discount-service checkdiscount');
    // console.log(req.body);
    let auth = await login_services.authorization(req);
    console.log(auth);
    let discount = req.body.discount;
    console.log('discount', discount);
    if (auth.authorization) {
        let value = await discount_models.checkDiscount(discount);
        console.log('value receive',value);
        res.status(200).send(value[0]);
    } else {
        res.status(400).send(err);
    }
}


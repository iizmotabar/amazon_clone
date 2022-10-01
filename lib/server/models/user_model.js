const mongoose = require('mongoose');
const Schema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    email: {
        require: true,
        type: String,
        trim: true,
        validate: {
            validator: function (v) {
                const emailRegex = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                return value.match(emailRegex);


            },
            message: props => `${props.value} is not a valid email address!`

        }
    },
    password: {
        trim: true,
        requried: true,
        type: String,

    },
    address: {
        type: String,
        default: '',
    }
}

);

const mongoose = require('mongoose');
const userSchema = mongoose.Schema({
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
            validator: function (value) {
                const emailRegex = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(emailRegex);
            },
            message: props => `${props.value} is not a valid email address!`
        }
    },


    password: {
        requried: true,
        type: String,
        validate: {
            validator: function (value) {
                const passwordRegex = "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
                return value.match(passwordRegex);
            },
            message: props => `Password should contain at least 8 characters, 1 letter & 1 digit`,
        }
    },
    address: {
        type: String,
        default: '',
    },
    type: {
        type: String,
        default: 'user',
    },
});

const User = mongoose.model("User", userSchema);
module.exports = User;


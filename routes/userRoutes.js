const express = require('express');
const router = express.Router();
const uploadFile = require("../middlewares/multerMiddleware");
const validations = require("../middlewares/validateRegisterMiddleware");
const guestMiddleware = require("../middlewares/guestMiddleware");
const authMiddleware = require("../middlewares/authMiddleware");
const validateLoginForm = require("../middlewares/validateLoginForm")
const validateEditUser = require('../middlewares/validateEditUser')
const usersController = require('../src/controllers/usersController')
const adminMiddleware = require('../middlewares/adminMiddleware')

// formulario de registro
router.get("/register", guestMiddleware, usersController.register);
router.get("/create", usersController.userCreate);

// procesar el registro
router.post("/register/create", uploadFile.single("avatar"), validations, usersController.processRegister);
router.post("/create", uploadFile.single("avatar"), validations, usersController.processRegister);


//formualrio de login
router.get("/login", guestMiddleware, usersController.login);

//procesar el login
router.post("/login/create", validateLoginForm, usersController.loginProcess);

// perfil de usuario
router.get("/profile", authMiddleware, usersController.profile);

//edicion de usuario
router.get('/profile/edit/:id', authMiddleware, usersController.edit);
router.put('/profile/edit/update/:id', validateEditUser, usersController.update);

//edicion de usuario comun por el usuario administrador
router.get('/user/edit/:id', authMiddleware, usersController.edit2);

//logout
router.post("/logout", usersController.logout)

//usuarios para admin
router.get("/users", authMiddleware, adminMiddleware, usersController.list)
router.delete('/user/delete/:id', adminMiddleware, usersController.destroy);

module.exports = router

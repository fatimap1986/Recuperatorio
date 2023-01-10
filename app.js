const express = require('express');
const path = require('path');
const app = express();
const methodOverride = require('method-override');
const session = require('express-session');
const cookies = require('cookie-parser');

app.use(session({
    secret: "Shhh, It's a secret",
    resave: false,
    saveUninitialized: false,
}));

app.use(cookies());
app.use(express.static('public'));  // Necesario para los archivos estáticos en el folder /public
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(methodOverride('_method'))

// view engine setup
app.set('views', path.resolve(__dirname, './views'));
app.set('view engine', 'ejs');

app.use(express.static(path.resolve(__dirname, './public')));
app.use(express.urlencoded({ extended: false }));

const mainRouter = require('./routes/mainRouter')
const productsRoutes = require('./routes/productsRoutes');

app.use('/', mainRouter);
app.use(productsRoutes);

app.use ( async (req, res, next) => {
    res.status(404).render('notfound/notFound');
})

const port = process.env.PORT || 3002;
app.listen(port, () => { console.log(`Servidor corriendo en http://localhost:${port} 🤓👌`);})

const imagemin = require('imagemin');
const imageminGiflossy = require('imagemin-giflossy');
 



const directory = process.argv[2];

imagemin([directory+'/*.gif'], 'build/images',
 {use: [imageminGiflossy({optimizationLevel:3,
                          colors: 32,
                          optimize: 3})]
}).then(() => {
    console.log('Images optimized');

});


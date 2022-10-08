// const {
//     Client
// } = require('whatsapp-web.js');
// const client =
//     new Client({
//         puppeteer: {
//             args: ['--no-sandbox'],
//         }
//     });

// client.on('qr', (qr) => {
//     console.log('QR RECEIVED', qr);
// });

// client.on('ready', () => {
//     console.log('Client is ready!');
// });

// client.initialize();


const qrcode = require('qrcode-terminal');

const {
    Client
} = require('whatsapp-web.js');
const client = new Client();

client.on('qr', qr => {
    qrcode.generate(qr, {
        small: true
    });
});

client.on('ready', () => {
    console.log('Client is ready!');
});


// client.on('message', message => {
// 	if(message.body === '!ping') {
// 		client.sendMessage(message.from, 'pong');
// 	}
// });

client.on('message', message => {
    if (message.body.includes("Janderson")) {
        message.reply(message.body.replace("Janderson", "Janderson✅"));
    }
});

client.initialize();
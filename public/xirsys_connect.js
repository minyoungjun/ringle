// Ident and secret should ideally be passed from a server for security purposes.
// If serverAuthentication is true then you should remove these two values.

var xirsysConnect = {
	secure : false,
	data : {
		domain : 'dev.ringleplus.com',
		application : 'default',
		room : 'default',
		ident : 'sungpah',
		secret : 'cd20dd42-2b8a-11e5-a940-32a6c4b6df2b'
	}
};

// Secure method
/*var xirsysConnect = {
	secure : true,
	server : '/getToken.php',
	info : {
		domain : 'www.your-domain.com',
		application : 'default',
		room : 'default'
	}
};*/


var crypto = require('crypto');
var util = require('util');
var request = require('request');

var sbNamespace = '{YOUR NAMESPACE}';
var sbEntityPath = '{YOUR QUEUE}';
var sharedAccessKey = 'LBgdFoE........lFyvW4='; 
var sharedAccessKeyName = '{POLICY NAME}';

var sas = getSASToken(sbNamespace, sbEntityPath, sharedAccessKeyName, sharedAccessKey);

sendMessage(sbNamespace, sbEntityPath, 'Hello from node', 'text/plain', sas, function(e,r,b){

		if(e) { return console.log(e); }
		console.log(r.statusCode);
});

function sendMessage(ns, queue, msg, contentType, sas, done){

	request({
			uri: 'https://' + ns + '.servicebus.windows.net/' + queue + '/messages',
			method: 'POST',
			headers: {
				'Authorization': sas,
				'Content-Type': contentType
			},
			body: msg
	},done);
}

function getSASToken(serviceNamespace, entityPath, sasKeyName, sasKey) { 
    var uri = "http://" + serviceNamespace + 
    ".servicebus.windows.net/" + entityPath; 

    var encodedResourceUri = encodeURIComponent(uri); 

	var expireInSeconds = Math.round(minutesFromNow(5) / 1000);

    var plainSignature = encodedResourceUri + "\n" + expireInSeconds; 

    var signature = crypto.createHmac('sha256', sasKey)
    					  .update(plainSignature)
    					  .digest('base64'); 

    return util.format('SharedAccessSignature sig=%s&se=%s&skn=%s&sr=%s', 
    			encodeURIComponent(signature), expireInSeconds, sasKeyName, encodedResourceUri);; 

    function minutesFromNow(minutes) {
  		var date = new Date();
  		date.setMinutes(date.getMinutes() + minutes);
  		return date;
	}
}

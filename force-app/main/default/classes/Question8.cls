//A
//I will configure this using external credentials and named credentials. Inside external credentials i will use custom and link it with the named credentials and in the name credentails i will provide the api url without any route like this /bdt. And i will add the authorization header with the Bearer apikey. so that every time when we call named credential can send it as header. and from apex class we will use like this: callout:'Echange-API/bdt'.

//B

Http http = new Http();

HttpRequest req = new HttpRequest();

req.setEndpoint('callout:Excahnge_API/bdt');
req.setMethod('GET');

HttpResponse res = http.send(req);

Map<String,SObject> data = (Map<String,SObject)JSON.decentralizedUntyped(res);


//C 
// We will use the try catch block to catch the error and respose proeprly with the status code like 500 for server error or 404 for wrong endpoint route like this.


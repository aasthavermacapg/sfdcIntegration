public with sharing class CurrencyConversioncontroller {
    @AuraEnabled
    public static map<String, Object> retrieveCurrencyConversionrates(String strEndpointUrl){
        map<String,Object> mapjsondata = new map<String,Object>();
        String strresponse = null;
        if(String.isNotBlank(strEndpointUrl)){
            HttpRequest httpRequest = new HttpRequest();
            httpRequest.setEndpoint(strEndpointUrl);
            httpRequest.setMethod('GET');
            httpRequest.setHeader('Authorization', 'OAuth '+UserInfo.getSessionId());
            httpRequest.setHeader('Authorization', 'Bearer '+UserInfo.getSessionId());

            try{
                Http http = new Http();
                HttpResponse httpResponse = http.send(httpRequest);
                if(httpResponse.getStatusCode() == 200){
                    strresponse = httpResponse.getBody();
                }
                else{
                    throw new CalloutException(httpResponse.getBody());
                }
            }catch(Exception ex){
                throw ex;
            }
        }
        if(String.isNotBlank(strresponse)){
            mapjsondata = (map<String, Object>)JSON.deserializeUntyped(strresponse);
            system.debug('mapjsondata ===> '+mapjsondata);
        }
        return mapjsondata;
    }
}
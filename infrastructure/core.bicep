param location string 

param prefix string 

param vnetSetting object = {
  addressPrefixes:[

    '10.0.0.0/20'
  ]
  subnets:[
    {
      name:'subnet1'
      addressPrefix : '10.0.0.0/20'
    }
  ]
}


resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: '${prefix}-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: vnetSetting.addressPrefixes
    }
    subnets: [ for subnet in vnetSetting.subnets : {
      name : subnet.name 
      properties:{
        addressPrefix:subnet.addressPrefix
      }
    }]  
  }
}

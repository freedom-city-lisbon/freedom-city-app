const bool isProduction = bool.fromEnvironment('dart.vm.product');

const developmentConfig = {
  'baseUrl': 'http://localhost:8000'
};

const productionConfig = {
  'baseUrl': 'https://api.freedomcity.pt'
};

const config = isProduction ? productionConfig : developmentConfig;

const bool isProduction = bool.fromEnvironment('dart.vm.product');

class Config {
  String baseUrl;

  Config({
    required this.baseUrl,
  });
}

var developmentConfig = Config(
  baseUrl: "https://fdf77993-c6da-47ca-9bf9-aa5298664215.mock.pstmn.io"
);

var productionConfig = Config(
  baseUrl: "https://api.freedomcity.pt"
);

final config = isProduction ? productionConfig : developmentConfig;

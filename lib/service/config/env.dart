class Env {
  static final String _key = const String.fromEnvironment('API_KEY');
  static final String _host = const String.fromEnvironment('HOST');

  static get key => _key;

  static get host => _host; 
}
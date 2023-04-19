class LoadingScreen {
  //singleton pattern
  const LoadingScreen._sharedInstance();
  static const LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen() => _shared;

  
}

class DoSomethingModel{
  String image;
  String title;
  DoSomethingModel({required this.image,required this.title});
}

List<DoSomethingModel> doSomethings = [
  DoSomethingModel(image: "assets/icons/fi_download.png", title: "Top Up"),
  DoSomethingModel(image: "assets/icons/fi_repeat.png", title: "Send"),
  DoSomethingModel(image: "assets/icons/fi_upload.png", title: "Withdraw"),
  DoSomethingModel(image: "assets/icons/fi_grid.png", title: "More")
];
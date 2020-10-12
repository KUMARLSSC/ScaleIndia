class SliderModel {
  String imageAseetPath;
  String title;
  String desc;
  SliderModel({this.desc, this.imageAseetPath, this.title});

  void setImageAssetPath(String getImageAssetPath) {
    imageAseetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAseetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

//1
  sliderModel.setDesc('Map your Skills to Industry requirements');
  sliderModel.setTitle("Employee");
  sliderModel.setImageAssetPath("assets/img/employee.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc('Know your Industry updates');
  sliderModel.setTitle("Employer");
  sliderModel.setImageAssetPath("assets/img/images.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //3
  sliderModel.setDesc('Batches ready for assessment');
  sliderModel.setTitle("Assessor");
  sliderModel.setImageAssetPath("assets/img/assessor.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //4
  sliderModel.setDesc('Training schedule for the day');
  sliderModel.setTitle("Trainer");
  sliderModel.setImageAssetPath("assets/img/trainer.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //5
  sliderModel.setDesc('Track your learning progress');
  sliderModel.setTitle("Elearning");
  sliderModel.setImageAssetPath("assets/img/elearning.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //6
  sliderModel.setDesc('Assess and Upskill yourself');
  sliderModel.setTitle("Assessment");
  sliderModel.setImageAssetPath("assets/img/assessment.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}

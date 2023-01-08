import '../models/questions_model.dart';

List<QuestionsModel> questions = [
  QuestionsModel(
      "If you are near a pedestrian crossing and there are people waiting to cross the road, you should",
      {
        "Slow down, press horn and proceed": false,
        "Press horn and proceed": false,
        "Stop the vehicle, wait until pedestrians cross and then move forward":
            true
      }),
  QuestionsModel(
      "You are coming towards a narrow bridge and another vehicle is about to enter the bridge from the other side. What should you do?",
      {
        "Wait until the other vehicle crosses the bridge before proceeding": true,
        "Switch on headlight and cross the bridge": false,
        "Increase speed of the vehicle and try to cross the bridge quickly":
        false
      }),
  QuestionsModel(
      "In case you see a vehicle that has met with an accident with injured passengers inside, you should -",
      {
        "Stop your vehicle and report the matter to the nearest police station": false,
        "Take the vehicle to the closest police station and report the accident": false,
        "Take measures to secure medical attention to those injured and report the accident to the closest police station within a period of 24 hours":
        true
      }),
  QuestionsModel(
      "On a road that has been designated as one way",
      {
        "You should not drive in reverse gear": true,
        "You should not overtake": false,
        "You should not park":
        false
      }),
  QuestionsModel(
      "You can overtake a vehicle that is in the front",
      {
        "Through the left side of the vehicle ahead": false,
        "Through the right side of the vehicle ahead": true,
        "If the road is wide enough":
        false
      }),
  QuestionsModel(
      "A learner's license is valid for a period of",
      {
        "30 days": false,
        "6 months": true,
        "Until a driving licence is availed":
        false
      }),
];

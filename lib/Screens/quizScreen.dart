import 'package:flutter/material.dart';
import 'package:gearus_app/uitilites/appconstant.dart';
import 'package:gearus_app/uitilites/questions_list.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  PageController controller = PageController(initialPage: 0);
  bool ispressed = false;
  int score = 0;
  int selectedbotton = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColors,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView.builder(
              controller: controller,
              itemCount: questions.length,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (page) {
                setState(() {
                  ispressed = false;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Question ${index + 1}/${questions.length}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      height: 6,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      questions[index].questions!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    for (int i = 0; i < questions[index].answer!.length; i++)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 12),
                        child: MaterialButton(
                          shape: StadiumBorder(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          onPressed: () {
                            setState(() {
                              ispressed = true;
                              selectedbotton = i;
                            });
                            if (questions[index]
                                    .answer!
                                    .entries
                                    .toList()[i]
                                    .value ==
                                true) {
                              setState(() {
                                score = score + 1;
                                print(score);
                              });
                            } else {}
                          },
                          child: Text(
                            questions[index].answer!.keys.toList()[i],
                            style: TextStyle(
                                color: i == selectedbotton
                                    ? Colors.black
                                    : AppConstants.backgroundColors,
                                fontSize: 20),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                if (ispressed == true) {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 750),
                                      curve: Curves.linear);
                                }
                              },
                              child: Text(
                                "Next Question",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              )),
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
